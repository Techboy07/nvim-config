-- Ensure LF is used when writing files (prevents CRLF from reappearing)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.js", "*.jsx", "*.mjs",
    "*.ts", "*.tsx",
    "*.css", "*.less", "*.scss",
    "*.json",
    "*.yml", "*.yaml",
    "*.html",
    "*.md",
    "*.graphql", "*.gql",
  },
  callback = function()
    vim.opt_local.fileformat = "unix"
  end,
})

-- Format on save with vim-prettier
vim.cmd([[
  augroup Prettier
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.yml,*.yaml,*.html,*.md,*.graphql,*.gql setlocal formatexpr=
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.yml,*.yaml,*.html,*.md,*.graphql,*.gql execute 'silent! undojoin | Prettier'
  augroup END
]])

-- Make vim-prettier prefer project-local prettier when available
vim.g["prettier#exec_cmd_async"] = 1
vim.g["prettier#exec_cmd_path"] = "./node_modules/.bin/prettier"

-- Prettier options
vim.g["prettier#config#tab_width"] = 2
vim.g["prettier#config#use_tabs"] = false
vim.g["prettier#config#end_of_line"] = "lf"
