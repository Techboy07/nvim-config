vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use('crusoexia/vim-monokai')

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use('honza/vim-snippets')
	use('preservim/nerdtree')

	use("mbbill/undotree")
use ('navarasu/onedark.nvim')

	use('tpope/vim-fugitive')

	use('prettier/vim-prettier', { run = 'yarn install --frozen-lockfile --production' })

	use('mason-org/mason.nvim')

	use('williamboman/mason-lspconfig.nvim')

	use('nvim-lualine/lualine.nvim')

	use('neoclide/coc.nvim', { branch = 'release' })

	use('DaikyXendo/nvim-material-icon')
	use('ryanoasis/vim-devicons')

	use('catppuccin/nvim')

	use('ojroques/nvim-osc52')

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
			requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
end)
