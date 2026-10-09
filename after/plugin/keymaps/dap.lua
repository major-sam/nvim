local dapui = require("dap.ui")
local dap = require("dap")
local wk = require("which-key")
local widgets = require("dap.ui.widgets")
wk.add({
	{ "<leader>d", icon = "🔀", group = "debug" },
})
wk.add({

	mode = "n",
	prefix = "<leader>d",
	group = "debug",
}, {
	{
		"u",
		function()
			dapui.toggle()
		end,
		desc = "ui toggle",
	},
	{
		"e",
		function()
			dapui.eval()
		end,
		desc = "eval",
	},
	{
		"E",
		function()
			dapui.toggle()
		end,
		desc = "float element",
	},
	{
		"c",
		function()
			dap.continue()
		end,
		desc = "continue",
	},
	{
		"l",
		function()
			dap.run_last()
		end,
		desc = "run last",
	},
	{
		"q",
		function()
			dap.terminate()
		end,
		desc = "terminate",
	},
	{
		"h",
		function()
			dap.stop()
		end,
		desc = "stop",
	},
	{
		"n",
		function()
			dap.step_over()
		end,
		desc = "step over",
	},
	{
		"s",
		function()
			dap.step_into()
		end,
		desc = "step into",
	},
	{
		"S",
		function()
			dap.step_out()
		end,
		desc = "step out",
	},
	{
		"b",
		function()
			dap.toggle_breakpoint()
		end,
		desc = "toggle br",
	},
	{
		"B",
		function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "set br condition",
	},
	{
		"p",
		function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end,
		desc = "set log br",
	},
	{
		"r",
		function()
			dap.repl.open()
		end,
		desc = "REPL open",
	},
	{
		"k",
		function()
			dap.up()
		end,
		desc = "up callstack",
	},
	{
		"j",
		function()
			dap.down()
		end,
		desc = "down callstack",
	},
	{
		"i",
		function()
			dap.ui.widgets.hover()
		end,
		desc = "info",
	},
	{
		"?",
		function()
			widgets.centered_float(widgets.scopes)
		end,
		desc = "scopes",
	},
	{ "f", "<Cmd>Telescope dap frames<CR>", desc = "search frames" },
	{ "C", "<Cmd>Telescope dap commands<CR>", desc = "search commands" },
	{ "L", "<Cmd>Telescope dap list_breakpoints<CR>", desc = "search breakpoints" },
})
-- 1. Create a function to register debugging-only keys
local function register_dap_keys()
	wk.add({
		-- Control-based stepping shortcuts (using anonymous functions)
		{
			"<C-n>",
			function()
				dap.step_over()
			end,
			desc = "Dap: Step Over (Next)",
			mode = "n",
		},
		{
			"<C-i>",
			function()
				dap.step_into()
			end,
			desc = "Dap: Step Into",
			mode = "n",
		},
		{
			"<C-o>",
			function()
				dap.step_out()
			end,
			desc = "Dap: Step Out",
			mode = "n",
		},

		-- Optional: Conditional Leader prefix menu
		{
			"c",
			function()
				dap.continue()
			end,
			desc = "Continue/Pause",
		},
		{
			"r",
			function()
				dap.repl.open()
			end,
			desc = "Open REPL",
		},
	})
end

-- 2. Create a function to clear the keymaps when debugging stops
local function unregister_dap_keys()
	wk.add({
		-- Passing the keys with hidden/nil properties removes them safely
		{ "<C-n>", hidden = true, mode = "n" },
		{ "<C-i>", hidden = true, mode = "n" },
		{ "<C-o>", hidden = true, mode = "n" },
		{ "<leader>d", hidden = true },
	})

	-- Fallback to ensure the global Neovim mappings are unmapped completely
	pcall(vim.keymap.del, "n", "<C-n>")
	pcall(vim.keymap.del, "n", "<C-i>")
	pcall(vim.keymap.del, "n", "<C-o>")
end

-- 3. Bind functions to DAP Event Listeners
dap.listeners.after.event_initialized["keymaps"] = function()
	register_dap_keys()
end

dap.listeners.before.event_terminated["keymaps"] = function()
	unregister_dap_keys()
end

dap.listeners.before.event_exited["keymaps"] = function()
	unregister_dap_keys()
end
