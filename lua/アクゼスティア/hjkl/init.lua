-- Fck mouse!
vim.opt.mouse = ""

-- Fck arrow keys ^_^
for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
	vim.keymap.set({ "n", "v", "i" }, key, "<Nop>")
end
