-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Packer plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'prettier/vim-prettier'
  use 'nvim-lualine/lualine.nvim'
end)

-- Auto format on save for supported files
vim.cmd([[
  augroup Prettier
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.yml,*.yaml,*.html,*.md,*.graphql,*.gql setlocal formatexpr=
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.yml,*.yaml,*.html,*.md,*.graphql,*.gql execute 'silent! undojoin | Prettier'
  augroup END
]])

-- Status line
require('lualine').setup()
