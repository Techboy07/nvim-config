-- Format on save with vim-prettier
vim.cmd([[
  augroup Prettier
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.yml,*.yaml,*.html,*.md,*.graphql,*.gql setlocal formatexpr=
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.yml,*.yaml,*.html,*.md,*.graphql,*.gql execute 'silent! undojoin | Prettier'
  augroup END
]])

-- Example: use 2 spaces
vim.g["prettier#config#tab_width"] = 2
vim.g["prettier#config#use_tabs"] = 'false'
