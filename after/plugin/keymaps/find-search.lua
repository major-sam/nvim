local wk = require("which-key")
wk.add({
	{ "<leader>s", group = "Search & Grep" },
	{ "<leader>sd", group = "Search Diagnostic" },
	{ "<leader>sc", group = "Staff" },
	-- find
	{
		"<leader>/",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>scf",
		function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Search Config File",
	},
	{
		"<leader>s<space>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>sf",
		function()
			Snacks.picker.files()
		end,
		desc = "Search Files",
	},
	{
		"<leader>sg",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Search Git Files",
	},
	{
		"<leader>sp",
		function()
			Snacks.picker.projects()
		end,
		desc = "Projects",
	},
	{
		"<leader>sr",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent",
	},
	-- Grep
	{
		"<leader>sb",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>sG",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>sv",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
	-- search
	{
		'<leader>s"',
		function()
			Snacks.picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<leader>s/",
		function()
			Snacks.picker.search_history()
		end,
		desc = "Search History",
	},
	{
		"<leader>sa",
		function()
			Snacks.picker.autocmds()
		end,
		desc = "Autocmds",
	},
	{
		"<leader>sch",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>sC",
		function()
			Snacks.picker.commands()
		end,
		desc = "Commands",
	},
	{
		"<leader>sdd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>sdb",
		function()
			Snacks.picker.diagnostics_buffer()
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>shl",
		function()
			Snacks.picker.highlights()
		end,
		desc = "Highlights",
	},
	{
		"<leader>si",
		function()
			Snacks.picker.icons()
		end,
		icon = "󱂸",
		desc = "Icons",
	},
	{
		"<leader>sj",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Jumps",
	},
	{
		"<leader>sk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>sl",
		function()
			Snacks.picker.loclist()
		end,
		desc = "Location List",
	},
	{
		"<leader>sm",
		function()
			Snacks.picker.marks()
		end,
		desc = "Marks",
	},
	{
		"<leader>sM",
		function()
			Snacks.picker.man()
		end,
		desc = "Man Pages",
	},
	{
		"<leader>sP",
		function()
			Snacks.picker.lazy()
		end,
		desc = "Search for Plugin Spec",
	},
	{
		"<leader>sq",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<leader>sR",
		function()
			Snacks.picker.resume()
		end,
		desc = "Resume",
	},
	{
		"<leader>su",
		function()
			Snacks.picker.undo()
		end,
		desc = "Undo History",
	},
	{
		"<leader>scs",
		function()
			Snacks.picker.colorschemes()
		end,
		desc = "Colorschemes",
	},
	{
		"<leader>sw",
		function()
			local cword = vim.fn.expand("<cword>")
			-- Executes :WitSearch <word>
			vim.cmd("WitSearch " .. cword)
		end,
		mode = "n",
		desc = "Web Search",
	},
	{
		"<leader>sw",
		function()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "x", false)
			vim.schedule(function()
				-- Safely extracts lines within the visual block/selection bounds
				local _, srow, scol, _ = unpack(vim.fn.getpos("'<"))
				local _, erow, ecol, _ = unpack(vim.fn.getpos("'>"))
				local lines = vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
				local selection = table.concat(lines, " ")
				if selection ~= "" then
					print(selection)
					vim.cmd("WitSearch " .. selection)
				end
			end)
		end,
		mode = { "v", "x", "s" },
		desc = "Visual Web Search",
	},
	{
		"<leader>sW",
		function()
			local cword = vim.fn.expand("<cword>")
			-- Executes :WitSearch <word>
			vim.cmd("WitSearch " .. cword)
		end,
		mode = "n",
		desc = "Wikipedia Search",
	},
})
