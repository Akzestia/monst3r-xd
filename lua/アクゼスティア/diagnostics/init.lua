vim.diagnostic.config({
	signs = false,
	underline = true,
	severity_sort = true,
	virtual_text = {
		spacing = 2,
		prefix = function(diagnostic, i, total)
			return i == 1 and ">_< " or ""
		end,
		source = "if_many",
	},
})
