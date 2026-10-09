local wk = require("which-key")
local ts_builtin = require("telescope.builtin")
wk.add({
	{ "<leader>h", icon = "󰘥", group = "Help" },
	{ "<leader>hv", ts_builtin.help_tags, desc = "TS Documentation tags" },
	{
		"<leader>hp",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
})
