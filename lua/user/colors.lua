-- Settings
-- vim.o.mouse = ""               -- disable mouse
vim.o.number = true            -- show line numbers
vim.o.compatible = false       -- same as 'set nocompatible'
-- Colorscheme
vim.cmd.colorscheme 'catppuccin-mocha'
vim.o.compatible = false
vim.o.background = "dark"
-- Keymaps
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", ":terminal<CR>", { silent = true })

-- Map Enter key to confirm completion/snippet in coc.vim
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and vim.api.nvim_replace_termcodes("<C-y>", true, true, true) or vim.api.nvim_replace_termcodes("<CR>", true, true, true)
end, { expr = true, silent = true })

require("nvim-web-devicons").setup {
  default = true
}

