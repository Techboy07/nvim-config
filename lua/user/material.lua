require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}


vim.o.guifont = "JetBrainsMono Nerd Font:h14"

vim.o.encoding = "utf-8"

vim.g.airline_powerline_fonts = 1;

-- Enable for NERDTree
vim.g.webdevicons_enable_nerdtree = 1
-- Enable for unite, vimfiler, etc. (if you use them)
vim.g.webdevicons_enable_unite = 1
vim.g.webdevicons_enable_vimfiler = 1

 require'nvim-web-devicons'.get_icon(filename, extension, options)
