
call plug#begin()

Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'one-dark/onedark.nvim'
Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'fedepujol/bracketpair.nvim'
call plug#end()

:set mouse=
:set number
:set nocompatible
:colorscheme onedark

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :terminal<CR>
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/autopair.vim
source $HOME/.config/nvim/plug-config/treesitter.vim
" Map Enter key to select coc.vim snippet
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

