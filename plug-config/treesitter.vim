" Enable nvim-treesitter by adding its directory to the runtimepath
set runtimepath+=~/.vim/pack/dist/start/nvim-treesitter/
" Load the nvim-treesitter plugin
packadd nvim-treesitter

" Set up nvim-treesitter configurations using Lua
lua << EOF
  -- Import the nvim-treesitter configurations module
  require'nvim-treesitter.configs'.setup {
    -- List of parser names to ensure are installed
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    -- Install parsers asynchronously
    sync_install = v:false,
    -- Automatically install missing parsers
    auto_install = v:true,
    -- List of parsers to ignore installing
    ignore_install = { },

    -- Syntax highlighting settings
    highlight = {
      -- Enable tree-sitter-based highlighting
      enable = v:true,
      -- List of languages to disable highlighting for
      disable = ["c", "rust"],
      -- Disable running :h syntax and tree-sitter at the same time
      additional_vim_regex_highlighting = v:false,
    },
     rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  }
EOF

