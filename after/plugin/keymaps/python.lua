local wk = require("which-key")
local py = require("py-requirements")

local function get_python_cmd()
	local venv_dirs = { ".venv", "venv", "env" }
	local cwd = vim.fn.getcwd()

	for _, dir in ipairs(venv_dirs) do
		local venv_python = cwd .. "/" .. dir .. "/bin/python"
		if vim.fn.executable(venv_python) == 1 then
			return venv_python
		end
	end
	return "python3"
end
wk.add({
	{
		{ "<leader>p", group = "Python", icon = " " }, -- Optional group icon if you have Nerd Fonts
		{ "<leader>pt", group = "Python Test", icon = "󰙨" }, -- Optional group icon if you have Nerd Fonts
		--  { "<leader>pe", icon = "", "<cmd>VenvSelect<cr>", desc = "REPL venv-selector" },
		{ "<leader>pu", icon = "", py.upgrade, desc = "Upgrade requirement under cursor" },

		{ "<leader>pU", icon = "", py.upgrade_all, desc = "Upgrade all requirements" },
		{ "<leader>pK", icon = "", py.show_description, desc = "Show package PyPI description" },
		-- 1. Create a Virtual Environment
		{
			"<leader>pc",
			function()
				local cwd = vim.fn.getcwd()
				local venv_path = cwd .. "/.venv"

				-- Check if .venv already exists to prevent accidental overwrites
				if vim.fn.isdirectory(venv_path) == 1 then
					vim.notify("A virtual environment (.venv) already exists in this directory!", vim.log.levels.WARN)
					return
				end

				-- Create .venv using snacks terminal so you see the progress
				require("snacks").terminal("python3 -m venv .venv && echo '✓ .venv created successfully!'", {
					win = { position = "float", border = "rounded" },
					auto_close = false,
				})
			end,
			desc = "Create .venv",
		},
		-- 2. Run current file with active venv
		{
			"<leader>pr",
			function()
				vim.cmd("write")
				local file = vim.fn.shellescape(vim.fn.expand("%"))
				local python = get_python_cmd()

				require("snacks").terminal(python .. " " .. file, {
					env = {
						PYTHONPATH = "src",
					},
					win = { position = "float", border = "rounded" },
					auto_close = false,
				})
			end,
			desc = "Run file (Auto Venv)",
		},

		-- 3. Run file with arguments and active venv
		{
			"<leader>pa",
			function()
				vim.cmd("write")
				local file = vim.fn.shellescape(vim.fn.expand("%"))
				local python = get_python_cmd()

				vim.ui.input({ prompt = "Enter Python arguments: " }, function(args)
					if not args then
						return
					end

					require("snacks").terminal(python .. " " .. file .. " " .. args, {
						win = { position = "float", border = "rounded" },
						auto_close = false,
					})
				end)
			end,
			desc = "Run file with args...",
		},
		{ "<leader>pv", "<cmd>Python venv pick<cr>", desc = "python.nvim: pick venv" },
		{ "<leader>pi", "<cmd>Python venv install<cr>", desc = "python.nvim: python venv install" },
		{ "<leader>pd", "<cmd>Python dap<cr>", desc = "python.nvim: python run debug program" },

		-- Test Actions
		{ "<leader>ptt", "<cmd>Python test test<cr>", desc = "python.nvim: python run test suite" },
		{ "<leader>ptm", "<cmd>Python test test_method<cr>", desc = "python.nvim: python run test method" },
		{ "<leader>ptf", "<cmd>Python test test_file<cr>", desc = "python.nvim: python run test file" },
		{ "<leader>ptdd", "<cmd>Python test test_debug<cr>", desc = "python.nvim: run test suite in debug mode." },
		{
			"<leader>ptdm",
			"<cmd>Python test test_method_debug<cr>",
			desc = "python.nvim: run test method in debug mode.",
		},
		{ "<leader>ptdf", "<cmd>Python test_file_debug<cr>", desc = "python.nvim: run test file in debug mode." },

		-- VEnv Actions
		{ "<leader>ped", "<cmd>Python venv delete_select<cr>", desc = "python.nvim: select and delete a known venv." },
		{ "<leader>peD", "<cmd>Python venv delete<cr>", desc = "python.nvim: delete current venv set." },

		-- Language Actions
		{
			"<leader>ppe",
			"<cmd>Python treesitter toggle_enumerate<cr>",
			desc = "python.nvim: turn list into enumerate",
		},
		{
			"<leader>pw",
			"<cmd>Python treesitter wrap_cursor<cr>",
			desc = "python.nvim: wrap treesitter identifier with pattern",
		},
		{
			"<leader>pw",
			mode = "v",
			":Python treesitter wrap_cursor<cr>",
			desc = "python.nvim: wrap treesitter identifier with pattern",
		},
	},
})
