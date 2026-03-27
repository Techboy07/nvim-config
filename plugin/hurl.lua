return {
	"jellydn/hurl.nvim",
	requires = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown" },
			config = function()
				require("render-markdown").setup({
					file_types = { "markdown" },
				})
			end,
		},
	},
	ft = { "hurl" },

	config = function()
		require("hurl").setup({
			debug = false,
			show_notification = false,
			mode = "split",

			formatters = {
				json = { "jq" },
				html = { "prettier", "--parser", "html" },
				xml = { "tidy", "-xml", "-i", "-q" },
			},

			mappings = {
				close = "q",
				next_panel = "<C-n>",
				prev_panel = "<C-p>",
			},
		})

		local keymap = vim.keymap.set
		keymap("n", "<leader>A", "<cmd>HurlRunner<CR>")
		keymap("n", "<leader>a", "<cmd>HurlRunnerAt<CR>")
		keymap("n", "<leader>te", "<cmd>HurlRunnerToEntry<CR>")
		keymap("n", "<leader>tE", "<cmd>HurlRunnerToEnd<CR>")
		keymap("n", "<leader>tm", "<cmd>HurlToggleMode<CR>")
		keymap("n", "<leader>tv", "<cmd>HurlVerbose<CR>")
		keymap("n", "<leader>tV", "<cmd>HurlVeryVerbose<CR>")
		keymap("v", "<leader>h", ":HurlRunner<CR>")
	end,
}
