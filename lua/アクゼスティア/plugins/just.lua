return {
	"nxuv/just.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("just").setup({
			fidget_message_limit = 32,
			open_qf_on_error = true,
			open_qf_on_run = true,
			open_qf_on_any = false,
			autoscroll_qf = true,
			register_commands = true,
			notify = vim.notify,
		})

		vim.keymap.set("n", "<leader>j", "<cmd>JustSelect<cr>", { desc = "Just: select task" })
		vim.keymap.set("n", "<leader>J", "<cmd>Just<cr>", { desc = "Just: run default" })
	end,
}
