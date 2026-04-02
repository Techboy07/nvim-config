local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function get_telescope_path()
  local entry = action_state.get_selected_entry()
  local path = entry.path or entry.filename or entry.value or entry.ordinal or ""

  if type(path) ~= "string" then
    path = tostring(path)
  end

  return path
end


local function copy_telescope_path(prompt_bufnr)
  local path = get_telescope_path()
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end

local function copy_path_and_nerdtree_find(prompt_bufnr)
  local path = get_telescope_path()

  if path == "" then
    return
  end

  vim.fn.setreg("+", path)
  actions.close(prompt_bufnr)

  -- force split to the right
  local prev = vim.opt.splitright:get()
  vim.opt.splitright = true

  vim.cmd("vsplit")
  -- restore previous setting
  vim.opt.splitright = prev

  -- ensure we are in the new right window
  vim.cmd("wincmd l")

  vim.cmd("edit " .. vim.fn.fnameescape(path))

  vim.cmd("NERDTreeFind")

  print("Copied and revealed: " .. path)
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-y>"] = copy_telescope_path,
        ["<C-n>"] = copy_path_and_nerdtree_find,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
      n = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["y"] = copy_telescope_path,
        ["<C-n>"] = copy_path_and_nerdtree_find,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
    },
  },
})
