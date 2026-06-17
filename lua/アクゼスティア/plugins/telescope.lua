return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"%.git/",
					"dist/",
					"dest/",
					"external/",
					"build/",
					"target/",
					"%.cache/",
					"vendor/",
					"%.lock",
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
				mappings = {
					i = {
						["<S-j>"] = actions.move_selection_next,
						["<S-k>"] = actions.move_selection_previous,
					},
					n = {
						["<S-j>"] = actions.move_selection_next,
						["<S-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"f",
						"--hidden",
						"--strip-cwd-prefix",
						"--exclude",
						".git",
						"--exclude",
						"node_modules",
						"--exclude",
						"external",
						"--exclude",
						"build",
						"--exclude",
						"target",
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
