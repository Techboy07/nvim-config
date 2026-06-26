-- 1. Shut down Treesitter parsing and highlighting for this buffer
vim.treesitter.stop()

-- 2. Explicitly force standard, regex-based Vim markdown highlighting
vim.bo.syntax = 'on'
