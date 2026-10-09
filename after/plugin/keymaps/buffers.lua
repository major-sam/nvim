local wk = require("which-key")
local ts_builtin = require("telescope.builtin")
wk.add({
	{ "<leader>b", icon = "🔀", group = "Buffers" },
	-- find buffers
	{
		"<leader>bf",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>bg",
		function()
			Snacks.picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<leader>bb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>bS",
		function()
			Snacks.scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
	{
		"<leader>bd",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{ "<leader>bB", ts_builtin.buffers, desc = "TS show open Buffers" },
})
