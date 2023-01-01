-- Prevent mkview errors on unnamed buffers
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "telescope" then
			return -- Skip mkview for telescope windows
		end
	end,
})
