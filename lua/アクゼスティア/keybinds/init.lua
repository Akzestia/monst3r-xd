vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Cmd>wa<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "Y", "yy", { desc = "Yank entire line" })
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = "Buffers" })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

vim.keymap.set({ "n", "t" }, "<C-/>", function()
	require("snacks").terminal(nil, {
		win = { position = "bottom", height = 0.3 },
	})
end, { desc = "Toggle terminal" })

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set("n", "<leader>1", "<cmd>vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>2", "<cmd>split<cr>", { desc = "Horizontal split" })

vim.keymap.set("n", "<leader>q", "<cmd>close<cr>", { desc = "Close split" })
