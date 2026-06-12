return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			views = {
				cmdline_popup = {
					position = { row = "96.6%", col = "50%" },
					size = { width = 60, height = "auto" },
				},
			},
		})
	end,
}
