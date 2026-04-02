# Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua, Packer.nvim, and CoC for a powerful development experience.

## Features

- **Plugin Management**: Packer.nvim for fast, lazy-loading plugin management
- **LSP Support**: CoC (Conquer of Completion) with language servers via Mason
- **Code Folding**: nvim-ufo with treesitter-based folding
- **HTTP Client**: Hurl.nvim for running curl/HURL files directly in Neovim
- **Snippets**: LuaSnip for snippet expansion
- **Fuzzy Finding**: Telescope for fast file/buffer/search navigation
- **File Explorer**: NERDTree with hidden files support
- **Git Integration**: vim-fugitive for Git operations
- **Status Line**: lualine.nvim for a modern status bar
- **Themes**: Catppuccin Mocha (default), OneDark, and Monokai available
- **Formatting**: Prettier integration with auto-format on save
- **Icons**: DevIcons and Material Icons for file type indicators
- **Auto Tag**: nvim-ts-autotag for automatic HTML/JSX tag closing
- **Clipboard**: OSC52 support for terminal clipboard integration

## Prerequisites

- Neovim 0.11.6+
- Git
- Node.js (for CoC and Prettier)
- Yarn (for Prettier installation)
- ripgrep (for Telescope fuzzy finding)
- A C compiler (for building some plugins)

## Installation

### 1. Install Prerequisites

**On Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install ripgrep build-essential
```

**On macOS with Homebrew:**

```bash
brew install ripgrep
```

**Install Treesitter CLI:**

```bash
npm install -g tree-sitter-cli
```

### 2. Clone the Configuration

```bash
git clone <repository-url> ~/.config/nvim
```

### 3. Install Packer.nvim

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 4. Install Plugins

Open Neovim and run:

```vim
:PackerSync
```

This will install all plugins and compile the packer configuration.

### 5. Configure CoC

Build CoC extensions from source:

```bash
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim
npm ci
```

Install language servers via Mason:

```vim
:Mason
```

Recommended language servers to install:

```vim
:MasonInstall lua-language-server gopls
```

Or install CoC extensions manually:

```vim
:CocInstall coc-json coc-tsserver coc-prettier coc-lua coc-emmet coc-pairs
```

Recommended CoC extensions:

- **coc-emmet**: Emmet support for HTML/CSS/Jade templates
- **coc-pairs**: Auto-close brackets, quotes, and other pairs

### 6. Update Treesitter

```vim
:TSUpdate
```

## Keymaps

### Leader Key

The leader key is set to **Space** (`<leader>` = ` `)

### File Navigation

| Keymap       | Description                   |
| ------------ | ----------------------------- |
| `<leader>n`  | Toggle NERDTree               |
| `<C-n>`      | Open NERDTree                 |
| `<leader>nf` | Find current file in NERDTree |
| `<leader>nn` | Focus NERDTree                |
| `<leader>ff` | Fuzzy find files              |
| `<leader>fg` | Live grep                     |
| `<leader>fb` | Search buffers                |
| `<leader>fh` | Search help tags              |

### Telescope Mappings (within picker)

| Keymap        | Mode | Description                      |
| ------------- | ---- | -------------------------------- |
| `<C-q>`       | i/n  | Send to quickfix list & open     |
| `<C-y>` / `y` | i/n  | Copy file path to clipboard      |
| `<C-n>`       | i/n  | Copy path and reveal in NERDTree |
| `<C-u>`       | i/n  | Scroll preview up                |
| `<C-d>`       | i/n  | Scroll preview down              |

### Window Management

| Keymap      | Description          |
| ----------- | -------------------- |
| `<leader>v` | Vertical split       |
| `<leader>s` | Horizontal split     |
| `<C-Left>`  | Move to left window  |
| `<C-Down>`  | Move to lower window |
| `<C-Up>`    | Move to upper window |
| `<C-Right>` | Move to right window |

### Tab Management

| Keymap      | Description  |
| ----------- | ------------ |
| `<leader>t` | New tab      |
| `<leader>.` | Next tab     |
| `<leader>,` | Previous tab |

### Code Folding

| Keymap | Description     |
| ------ | --------------- |
| `zR`   | Open all folds  |
| `zM`   | Close all folds |

### HTTP Client (Hurl)

| Keymap       | Description                       |
| ------------ | --------------------------------- |
| `<leader>A`  | Run Hurl request                  |
| `<leader>a`  | Run Hurl request at cursor        |
| `<leader>te` | Run Hurl to entry                 |
| `<leader>tE` | Run Hurl to end                   |
| `<leader>tm` | Toggle Hurl mode                  |
| `<leader>tv` | Run Hurl with verbose output      |
| `<leader>tV` | Run Hurl with very verbose output |
| `<leader>hy` | Run Hurl file and yank response   |
| `<leader>hr` | Run Hurl file in split window     |
| `<leader>hv` | Run Hurl file with verbose output |
| `<leader>hh` | Run curl request from cursor URL  |

### Git Operations

| Keymap       | Description                |
| ------------ | -------------------------- |
| `<leader>gs` | Open Git status (Fugitive) |
| `<leader>D`  | Delete current file        |

### Utilities

| Keymap       | Description               |
| ------------ | ------------------------- |
| `<leader>p`  | Save file                 |
| `<leader>f`  | Format file               |
| `<leader>R`  | Reload Neovim config      |
| `<leader>c`  | Copy to system clipboard  |
| `<leader>cc` | Copy line to clipboard    |
| `<C-t>`      | Open terminal             |
| `<C-q>`      | Exit terminal mode safely |

### Snippets (LuaSnip)

| Keymap  | Description                     |
| ------- | ------------------------------- |
| `<C-K>` | Expand snippet                  |
| `<C-L>` | Jump forward in snippet         |
| `<C-J>` | Jump backward in snippet        |
| `<C-E>` | Change choice in choice snippet |

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   ├── plugins/
│   │   └── hurl.lua      # Hurl HTTP client plugin config
│   └── user/
│       ├── init.lua      # Module loader
│       ├── colors.lua    # Theme and appearance
│       ├── material.lua  # Material theme config
│       ├── packer.lua    # Plugin definitions
│       ├── remap.lua     # Keymaps
│       ├── mason.lua     # LSP server management
│       ├── telescope.lua # Fuzzy finder config
│       ├── lualine.lua   # Status line config
│       ├── prettier.lua  # Formatting config
│       ├── ufo.lua       # Code folding config
│       ├── autotag.lua   # Auto tag closing config
│       └── luasnip.lua   # Snippet config (optional)
├── plugin/
│   ├── telescope.lua     # Telescope extensions
│   ├── undotree.lua      # Undo tree config
│   ├── vim-fugitive.lua  # Git integration
│   ├── treesitter.lua    # Treesitter config
│   └── packer_compiled.lua # Packer compiled config
├── snippets/             # User snippets
├── coc-settings.json     # CoC configuration
├── COMMIT.md             # Commit message rules
└── commit-message.txt    # Commit message template
```

## Customization

### Adding a New Plugin

Edit `lua/user/packer.lua`:

```lua
use('author/plugin-name')
```

Then run `:PackerSync` in Neovim.

### Changing Theme

Edit `lua/user/colors.lua`:

```lua
vim.cmd.colorscheme 'catppuccin-mocha'  -- or 'onedark', 'vim-monokai'
```

### Adding Snippets

Add snippet files to the `snippets/` directory:

```snippets
# ~/.config/nvim/snippets/javascript.snippets
snippet log
console.log(${1:data})
endsnippet
```

### Configuring Language Servers

Edit `coc-settings.json` to add or modify language server configurations.

## Installed Plugins

- **wbthomason/packer.nvim** - Plugin manager
- **neoclide/coc.nvim** - LSP client
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting
- **nvim-telescope/telescope.nvim** - Fuzzy finder
- **preservim/nerdtree** - File explorer
- **tpope/vim-fugitive** - Git integration
- **nvim-lualine/lualine.nvim** - Status line
- **kevinhwang91/nvim-ufo** - Code folding
- **jellydn/hurl.nvim** - HTTP client
- **L3MON4D3/LuaSnip** - Snippet engine
- **honza/vim-snippets** - Snippet collection
- **mbbill/undotree** - Undo tree visualization
- **prettier/vim-prettier** - Code formatting
- **windwp/nvim-ts-autotag** - Auto tag closing
- **catppuccin/nvim** - Catppuccin theme
- **navarasu/onedark.nvim** - OneDark theme
- **crusoexia/vim-monokai** - Monokai theme
- **ryanoasis/vim-devicons** - File type icons
- **DaikyXendo/nvim-material-icon** - Material icons
- **ojroques/nvim-osc52** - Clipboard support

## Troubleshooting

### Packer Errors

Run `:PackerClean` followed by `:PackerSync` to reset plugin state.

### CoC Not Working

1. Ensure Node.js is installed
2. Run `:CocInfo` to check CoC status
3. Install required language servers via `:Mason`

### Folding Issues

If folding causes performance issues, adjust in `lua/user/ufo.lua`:

```lua
vim.o.foldenable = false  -- Disable folding
```

### Telescope Not Finding Files

Ensure ripgrep is installed:

```bash
# Check installation
rg --version
```

## License

MIT
