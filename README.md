# Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua, Packer.nvim, and CoC for a powerful development experience.

## Features

- **Plugin Management**: Packer.nvim for fast, lazy-loading plugin management
- **LSP Support**: CoC (Conquer of Completion) with language servers via Mason
- **Code Folding**: nvim-ufo with treesitter-based folding
- **HTTP Client**: nvim-hurl for running curl/HURL files directly in Neovim
- **Snippets**: LuaSnip for snippet expansion
- **Fuzzy Finding**: Telescope for fast file/buffer/search navigation
- **File Explorer**: NERDTree with hidden files support
- **Git Integration**: vim-fugitive for Git operations
- **Status Line**: lualine.nvim for a modern status bar
- **Themes**: Catppuccin Mocha (default) and OneDark available
- **Formatting**: Prettier integration with auto-format on save
- **Icons**: DevIcons and Material Icons for file type indicators

## Prerequisites

- Neovim 0.8+
- Git
- Node.js (for CoC and Prettier)
- Yarn (for Prettier installation)

## Installation

### 1. Clone the Configuration

```bash
git clone <repository-url> ~/.config/nvim
```

### 2. Install Packer.nvim

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 3. Install Plugins

Open Neovim and run:

```vim
:PackerSync
```

This will install all plugins and compile the packer configuration.

### 4. Configure CoC

Install language servers via Mason:

```vim
:Mason
```

Or install CoC extensions manually:

```vim
:CocInstall coc-json coc-tsserver coc-prettier coc-lua
```

## Keymaps

### Leader Key

The leader key is set to **Space** (`<leader>` = ` `)

### File Navigation

| Keymap | Description |
|--------|-------------|
| `<leader>n` | Toggle NERDTree |
| `<C-n>` | Open NERDTree |
| `<leader>nf` | Find current file in NERDTree |
| `<leader>nn` | Focus NERDTree |
| `<leader>ff` | Fuzzy find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Search buffers |
| `<leader>fh` | Search help tags |

### Window Management

| Keymap | Description |
|--------|-------------|
| `<leader>v` | Vertical split |
| `<leader>s` | Horizontal split |
| `<C-Left>` | Move to left window |
| `<C-Down>` | Move to lower window |
| `<C-Up>` | Move to upper window |
| `<C-Right>` | Move to right window |

### Tab Management

| Keymap | Description |
|--------|-------------|
| `<leader>t` | New tab |
| `<leader>.` | Next tab |
| `<leader>,` | Previous tab |

### Code Folding

| Keymap | Description |
|--------|-------------|
| `zR` | Open all folds |
| `zM` | Close all folds |

### HTTP Client (HURL)

| Keymap | Description |
|--------|-------------|
| `<leader>hy` | Run HURL file and yank response |
| `<leader>hr` | Run HURL file in split window |
| `<leader>hv` | Run HURL file with verbose output |
| `<leader>hh` | Run curl request from cursor URL |

### Git Operations

| Keymap | Description |
|--------|-------------|
| `<leader>gs` | Open Git status (Fugitive) |
| `<leader>D` | Delete current file |

### Utilities

| Keymap | Description |
|--------|-------------|
| `<leader>p` | Save file |
| `<leader>f` | Format file |
| `<leader>R` | Reload Neovim config |
| `<leader>c` | Copy to system clipboard |
| `<leader>cc` | Copy line to clipboard |
| `<C-t>` | Open terminal |
| `<C-q>` | Exit terminal mode safely |
| `<leader>u` | Toggle Undotree |

### Snippets (LuaSnip)

| Keymap | Description |
|--------|-------------|
| `<C-K>` | Expand snippet |
| `<C-L>` | Jump forward in snippet |
| `<C-J>` | Jump backward in snippet |
| `<C-E>` | Change choice in choice snippet |

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   └── user/
│       ├── init.lua      # Module loader
│       ├── colors.lua    # Theme and appearance
│       ├── packer.lua    # Plugin definitions
│       ├── remap.lua     # Keymaps
│       ├── mason.lua     # LSP server management
│       ├── telescope.lua # Fuzzy finder config
│       ├── lualine.lua   # Status line config
│       ├── prettier.lua  # Formatting config
│       ├── ufo.lua       # Code folding config
│       ├── hurl.lua      # HTTP client config
│       └── luasnip.lua   # Snippet config
├── plugin/
│   ├── treesitter.lua    # Treesitter config
│   ├── undotree.lua      # Undo tree config
│   ├── vim-fugitive.lua  # Git integration
│   └── telescope.lua     # Telescope extensions
├── snippets/             # User snippets
├── coc-settings.json     # CoC configuration
└── COMMIT.md             # Commit message rules
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
vim.cmd.colorscheme 'catppuccin-mocha'  -- or 'onedark'
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

## Troubleshooting

### Packer Errors

Run `:PackerClean` followed by `:PackerSync` to reset plugin state.

### CoC Not Working

1. Ensure Node.js is installed
2. Run `:CocInfo` to check CoC status
3. Install required language servers via `:Mason`

### Folding Issues

If folding causes performance issues, adjust in `init.lua`:

```lua
vim.o.foldenable = false  -- Disable folding
```

## License

MIT
