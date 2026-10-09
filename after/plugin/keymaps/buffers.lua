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
	-- Top Pickers & Explorer
	{
		"<leader>f<space>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>bB",
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
	{ "<leader>bb", ts_builtin.buffers, desc = "TS show open Buffers" },
})
