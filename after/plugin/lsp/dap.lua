local dap = require("dap")

-- 1. Настройка адаптера (укажите правильный путь к исполняемому файлу)
dap.adapters.bash = {
	type = "executable",
	-- Если ставили через Mason:
	command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
	-- Если ставили глобально через npm, замените строку выше на:
	-- command = 'bash-debug-adapter',
	name = "bash",
}

dap.adapters.bashdb = {
	type = "executable",
	-- Если ставили через Mason:
	command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
	-- Если ставили глобально через npm, замените строку выше на:
	-- command = 'bash-debug-adapter',
	name = "bashdb",
}

-- 2. Настройка конфигурации отладки для Bash/Sh файлов
dap.configurations.sh = {
	{
		type = "bashdb",
		request = "launch",
		name = "Launch file",
		showDebugOutput = true,
		-- Путь к самому скрипту bashdb внутри адаптера
		-- Для Mason-установки:
		pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
		pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
		-- Если ставили через npm глобально, пути обычно такие:
		-- pathBashdb = '/usr/lib/node_modules/bash-debug-adapter/extension/bashdb_dir/bashdb',
		-- pathBashdbLib = '/usr/lib/node_modules/bash-debug-adapter/extension/bashdb_dir',

		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = "${workspaceFolder}",
		pathCat = "cat",
		pathBash = "/bin/bash", -- явно указываем bash для выполнения скрипта
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		args = {},
		env = {},
		terminalKind = "integrated",
	},
}
