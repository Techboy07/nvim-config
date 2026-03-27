-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dev/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/dev/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/dev/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/dev/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dev/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["hurl.nvim"] = {
    after = { "nui.nvim", "render-markdown.nvim" },
    config = { "\27LJ\2\ný\5\0\0\6\0#\0<6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0\18\1\0\0'\3\17\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\17\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\17\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\17\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\17\0'\4\26\0'\5\27\0B\1\4\1\18\1\0\0'\3\17\0'\4\28\0'\5\29\0B\1\4\1\18\1\0\0'\3\17\0'\4\30\0'\5\31\0B\1\4\1\18\1\0\0'\3 \0'\4!\0'\5\"\0B\1\4\1K\0\1\0\20:HurlRunner<CR>\14<leader>h\6v\29<cmd>HurlVeryVerbose<CR>\15<leader>tV\25<cmd>HurlVerbose<CR>\15<leader>tv\28<cmd>HurlToggleMode<CR>\15<leader>tm\29<cmd>HurlRunnerToEnd<CR>\15<leader>tE\31<cmd>HurlRunnerToEntry<CR>\15<leader>te\26<cmd>HurlRunnerAt<CR>\14<leader>a\24<cmd>HurlRunner<CR>\14<leader>A\6n\bset\vkeymap\bvim\rmappings\1\0\3\15prev_panel\n<C-p>\15next_panel\n<C-n>\nclose\6q\15formatters\bxml\1\5\0\0\ttidy\t-xml\a-i\a-q\thtml\1\4\0\0\rprettier\r--parser\thtml\tjson\1\0\3\tjson\0\bxml\0\thtml\0\1\2\0\0\ajq\1\0\5\tmode\nsplit\22show_notification\1\15formatters\0\ndebug\1\rmappings\0\nsetup\thurl\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dev/.local/share/nvim/site/pack/packer/opt/hurl.nvim",
    url = "https://github.com/jellydn/hurl.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/mason-org/mason.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nui.nvim"] = {
    load_after = {
      ["hurl.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/dev/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  nvim = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-material-icon"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nvim-material-icon",
    url = "https://github.com/DaikyXendo/nvim-material-icon"
  },
  ["nvim-osc52"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nvim-osc52",
    url = "https://github.com/ojroques/nvim-osc52"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15file_types\1\0\1\15file_types\0\1\2\0\0\rmarkdown\nsetup\20render-markdown\frequire\0" },
    load_after = {
      ["hurl.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dev/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-monokai"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/vim-monokai",
    url = "https://github.com/crusoexia/vim-monokai"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/dev/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'render-markdown.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType hurl ++once lua require("packer.load")({'hurl.nvim'}, { ft = "hurl" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
