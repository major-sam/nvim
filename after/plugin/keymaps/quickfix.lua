local wk = require("which-key")
local qk = require("quicker")
wk.add({
	{ "<leader>q", icon = "󰁨", group = "Quickfix" },
	{
		"<leader>qf",
		function()
			qk.toggle()
		end,
		desc = "Toggle Quickfix list",
	},
	{
		"<leader>ql",
		function()
			qk.toggle({ loclist = true })
		end,
		desc = "Toggle Quickfix list",
	},
})
