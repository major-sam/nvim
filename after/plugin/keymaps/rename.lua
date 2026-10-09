local wk = require("which-key")
wk.add({
	{ "<leader>r", icon = "󰑕", group = "Rename File" },
	{
		"<leader>rf",
		function()
			Snacks.rename.rename_file()
		end,
		desc = "Rename File",
	},
})
