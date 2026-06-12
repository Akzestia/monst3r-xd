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
		})
		telescope.load_extension("fzf")
	end,
}
