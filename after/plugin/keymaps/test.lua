local wk = require("which-key")
wk.add({
	{ "<leader>t", icon = "󰙨", group = "Test" },
	{
		"<leader>tt",
		function()
			neotest.run.run()
		end,
		desc = "Run nearest test",
	},
	{
		"<leader>tf",
		function()
			neotest.run.run(vim.fn.expand("%"))
		end,
		desc = "Run current file",
	},
	{
		"<leader>ta",
		function()
			neotest.run.run({ suite = true })
		end,
		desc = "Run all tests",
	},
	{
		"<leader>ts",
		function()
			neotest.summary.toggle()
		end,
		desc = "Toggle summary panel",
	},
	{
		"<leader>td",
		function()
			neotest.run.run({ strategy = "dap" })
		end,
		desc = "Debug nearest test",
	},
	{
		"<leader>to",
		function()
			neotest.output_panel.toggle()
		end,
		desc = "Toggle output Repl",
	},
})
