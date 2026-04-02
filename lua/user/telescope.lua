local view_group = vim.api.nvim_create_augroup("AutoMkViewSafe", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = view_group,
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local name = vim.api.nvim_buf_get_name(bufnr)
    local buftype = vim.bo[bufnr].buftype
    local modifiable = vim.bo[bufnr].modifiable
    local filetype = vim.bo[bufnr].filetype

    if name == "" then
      return
    end

    if buftype ~= "" then
      return
    end

    if not modifiable then
      return
    end

    if filetype == "TelescopePrompt" then
      return
    end

    pcall(vim.cmd, "silent! mkview")
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = view_group,
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local name = vim.api.nvim_buf_get_name(bufnr)
    local buftype = vim.bo[bufnr].buftype

    if name == "" then
      return
    end

    if buftype ~= "" then
      return
    end

    pcall(vim.cmd, "silent! loadview")
  end,
})
