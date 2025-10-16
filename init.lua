require('user');

vim.opt.incsearch = true

--vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"


--vim.opt.nofoldenable = true
vim.opt.foldcolumn = '1'
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- Auto save & load folds with views
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = "*",
	command = "mkview",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	command = "silent! loadview",
})



vim.keymap.set("i", "<CR>", function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn["coc#pum#confirm"]()
	else
		return "\r"
	end
end, { expr = true, silent = true })


vim.opt.relativenumber = false


vim.g.NERDTreeShowHidden = 1
vim.g.coc_enable_watchman = 0

vim.fn.setenv("VIMRUNTIME", nil)
vim.fn.setenv("VIM", nil)
