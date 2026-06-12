vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		if
			vim.fn.argc() == 0
			and vim.api.nvim_buf_get_name(0) == ""
			and vim.api.nvim_buf_line_count(0) == 1
			and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == ""
		then
			require("snacks").dashboard.open()
		end
	end,
})
