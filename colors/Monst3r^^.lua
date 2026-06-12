-- Monst3r ^^
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "Monst3r^^"

local c = {
	bg = "#000000",
	bg_dark = "#242942",
	bg_header = "#2a2d44",
	bg_base = "#282b42",
	bg_caret = "#d7fc0d",
	bg_select = "#4C637A",
	bg_search = "#28734B",
	bg_fold = "#2e3149",
	bg_diff_del = "#383845",
	bg_diff_add = "#203635",
	fg = "#bbbbbb",
	fg_dim = "#585F6F",
	fg_comment = "#455358",
	fg_line_nr = "#455358",
	accent = "#578CDA",
	accent_stop = "#688dee",
	accent_comp = "#89d4ec",
	cyan = "#48ffd6",
	yellow = "#d6f50e",
	pink = "#988F9A",
	green = "#f4fa8c",
	blue = "#48ffd6",
	key_green = "#d7fc0d",
	purple = "#8bbdff",
	border = "#000100",
	red = "#FF5555",
}

local h = vim.api.nvim_set_hl

h(0, "Normal", { fg = c.fg, bg = c.bg })
h(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
h(0, "CursorLine", { bg = "#000000" })
h(0, "ColorColumn", { bg = "#e6fa41" })
h(0, "LineNr", { fg = "#3e9b00" })
h(0, "CursorLineNr", { fg = "#d3f817" })
h(0, "SignColumn", { bg = c.bg })
h(0, "Folded", { fg = c.fg_dim, bg = c.bg_fold })
h(0, "FoldColumn", { fg = c.fg_dim })
h(0, "VertSplit", { fg = c.border })
h(0, "WinSeparator", { fg = c.border })
h(0, "Visual", { bg = "#010101" })
h(0, "Search", { bg = c.bg_search, fg = "#fbfbfb" })
h(0, "IncSearch", { bg = c.accent, fg = "#000000" })

-- Syntax
h(0, "Comment", { fg = c.fg_comment, italic = true })
h(0, "Constant", { fg = c.cyan })
h(0, "String", { fg = c.green })
h(0, "Character", { fg = c.green })
h(0, "Number", { fg = c.green })
h(0, "Boolean", { fg = c.pink })
h(0, "Identifier", { fg = "#ffffff" })
h(0, "Function", { fg = c.accent })
h(0, "Statement", { fg = "#ffffff" })
h(0, "Conditional", { fg = c.pink })
h(0, "Repeat", { fg = c.pink })
h(0, "Keyword", { fg = c.pink })
h(0, "Operator", { fg = c.fg_dim })
h(0, "PreProc", { fg = "" })
h(0, "Include", { fg = c.blue })
h(0, "Type", { fg = c.yellow })
h(0, "Structure", { fg = c.yellow })
h(0, "Typedef", { fg = c.yellow })
h(0, "Special", { fg = c.key_green })
h(0, "Delimiter", { fg = c.fg_dim })
h(0, "Underlined", { fg = c.accent, underline = true })
h(0, "Error", { fg = c.red })
h(0, "Todo", { fg = "#000000", bg = c.accent })

-- Tree-sitter
h(0, "@variable", { fg = "#ffffff" })
h(0, "@variable.builtin", { fg = c.pink })
h(0, "@function", { fg = c.cyan })
h(0, "@function.builtin", { fg = c.cyan })
h(0, "@function.call", { fg = c.cyan })
h(0, "@method", { fg = c.green })
h(0, "@keyword", { fg = "#BFFF00" })
h(0, "@keyword.function", { fg = c.pink })
h(0, "@keyword.return", { fg = c.pink })
h(0, "@string", { fg = "#d6f50e" })
h(0, "@string.escape", { fg = c.key_green })
h(0, "@number", { fg = c.cyan })
h(0, "@boolean", { fg = c.pink })
h(0, "@constant", { fg = c.cyan })
h(0, "@constant.builtin", { fg = c.cyan })
h(0, "@type", { fg = c.cyan })
h(0, "@type.name", { fg = "#d6f50e" })
h(0, "@property", { fg = c.key_green })
h(0, "@field", { fg = c.key_green })
h(0, "@declarator", { fg = c.key_green })
h(0, "@comment", { fg = c.fg_comment, italic = true })
h(0, "@punctuation.delimiter", { fg = "#2DFF00" })
h(0, "@operator", { fg = c.fg_dim })

h(0, "DiagnosticError", { fg = c.red })
h(0, "DiagnosticWarn", { fg = c.cyan })
h(0, "DiagnosticInfo", { fg = c.cyan })
h(0, "DiagnosticHint", { fg = c.fg_dim })
h(0, "DiagnosticOk", { fg = c.accent })
h(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
h(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.cyan })
h(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.cyan })
h(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.fg_dim })

h(0, "DiffAdd", { bg = c.bg_diff_add })
h(0, "DiffChange", { bg = c.bg_fold })
h(0, "DiffDelete", { bg = c.bg_diff_del, fg = c.bg_diff_del })
h(0, "DiffText", { bg = c.bg_select })

h(0, "GitSignsAdd", { fg = c.cyan })
h(0, "GitSignsChange", { fg = c.yellow })
h(0, "GitSignsDelete", { fg = c.red })

h(0, "SnacksDashboardNormal", { fg = c.fg, bg = "none" })
h(0, "SnacksDashboardIcon", { fg = c.accent })
h(0, "SnacksDashboardDesc", { fg = c.green })
h(0, "SnacksDashboardKey", { fg = c.pink })
h(0, "SnacksDashboardSpecial", { fg = c.cyan })
h(0, "SnacksDashboardHeader", { fg = c.yellow })

h(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
h(0, "PmenuSel", { fg = "#000000", bg = c.accent })
h(0, "PmenuSbar", { bg = c.bg_fold })
h(0, "PmenuThumb", { bg = c.accent })
h(0, "PmenuKind", { fg = c.cyan, bg = c.bg_dark })
h(0, "PmenuExtra", { fg = c.fg_dim, bg = c.bg_dark })
