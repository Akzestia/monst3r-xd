return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<leader>r",
			function()
				require("persistence").load()
			end,
			desc = "Restore session",
		},
	},
}
