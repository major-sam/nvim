require("neotest").setup({
	log_level = vim.log.levels.DEBUG,
	discovery = {
		enabled = true,
		concurrent = 1, -- Limit concurrent processes to avoid deadlocks
	},
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		dir = "",
		expanded = "╮",
		failed = "",
		file = "",
		final_child_indent = " ",
		final_child_prefix = "╰",
		namespace = "",
		non_collapsible = "─",
		notify = "",
		passed = "",
		running = "",
		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
		skipped = "",
		test = "",
		unknown = "",
		watching = "",
	},
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = { "--log-level", "DEBUG" },
			runner = "pytest",
			python = "python",
			pytest_discover_instances = true,
		}),
		require("neotest-plenary"),
	},
})
