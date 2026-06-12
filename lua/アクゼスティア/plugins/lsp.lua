return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp"
  },
  opts = {
    servers = {
      clangd = {
        cmd = {
          "/opt/homebrew/opt/llvm/bin/clangd",
          "--background-index",
          "--clang-tidy",
          "-j=10",
          "--pch-storage=memory",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--all-scopes-completion",
          "--header-insertion=iwyu",
          "--background-index-priority=normal",
        },
      },
      qmlls = {
        cmd = { "qmlls" },
        filetypes = { "qml", "qmljs" },
        root_markers = { ".git" },
        settings = {
          qmlls = {
            lint = { disableImportWarnings = true },
          },
        },
        single_file_support = true,
      },
      cqlls = {
        cmd = { "cqlls" },
        filetypes = { "cql", "cqlang" },
        root_markers = { ".git" },
        settings = {},
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = false,
              buildScripts = { enable = true },
            },
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = { enable = true },
            diagnostics = {
              experimental = { enable = false },
            },
            imports = {
              granularity = { group = "module" },
            },
            files = {
              watcher = "client",
            },
          },
        },
      },
      denols = {
        root_markers = { "deno.json", "deno.jsonc" },
        settings = {
          deno = {
            enable = true,
            suggest = {
              imports = {
                hosts = {
                  ["https://deno.land"] = true,
                  ["https://esm.sh"] = true,
                },
              },
            },
          },
        },
      },
      ts_ls = {
        root_markers = { "package.json", "tsconfig.json" },
        single_file_support = false,
      },
    },
  },
  config = function(_, opts)
    require("mason").setup()

    -- Only let mason auto-install registry-known servers.
    -- clangd is your custom homebrew build; qmlls/cqlls aren't mason servers.
    require("mason-lspconfig").setup({
      ensure_installed = { "rust_analyzer", "denols", "ts_ls" },
      automatic_enable = false, -- we enable manually below
    })

    -- Completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_blink, blink = pcall(require, "blink.cmp")
    if ok_blink then
      capabilities = blink.get_lsp_capabilities(capabilities)
    else
      local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp.default_capabilities(capabilities)
      end
    end

    -- Global defaults for every server
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- denols and ts_ls conflict; only one should attach per project.
    -- root_markers above handle that: deno.json => denols, package.json => ts_ls.

    -- Apply per-server config and enable
    for name, cfg in pairs(opts.servers) do
      vim.lsp.config(name, cfg)
      vim.lsp.enable(name)
    end

    -- Keymaps on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local o = { buffer = args.buf, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, o)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, o)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, o)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, o)
      end,
    })
  end,
}
