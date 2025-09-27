vim.g.mapleader = ' ';

--vim.keymap.set('n', "<leader><leader>",vim.cmd.Ex);

vim.keymap.set('n', "<leader>n", vim.cmd.NERDTreeToggle);

vim.api.nvim_set_keymap("n", "<leader>D", ":call delete(expand('%')) | bd!<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
vim.keymap.set('n', '<leader>R', ':source $MYVIMRC')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Remap <leader>p to save the file
vim.keymap.set("n", "<leader>p", ":w<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<leader>f", ":call CocActionAsync('format')<CR>", { silent = true })


-- Vertical split
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { silent = true, noremap = true })

-- Horizontal split
vim.keymap.set("n", "<leader>s", ":split<CR>", { silent = true, noremap = true })
