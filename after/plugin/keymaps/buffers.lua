local wk = require("which-key")
local ts_builtin = require("telescope.builtin")
wk.add({
	{ "<leader>b", icon = "🔀", group = "Buffers" },
	-- find buffers
	{
		"<leader>bf",
		function()
			Snaks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>bg",
		function()
			Snaks.picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<leader>bb",
		function()
			Snaks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>bS",
		function()
			Snaks.scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
	{
		"<leader>bd",
		function()
			Snaks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{ "<leader>bB", ts_builtin.buffers, desc = "TS show open Buffers" },
})
