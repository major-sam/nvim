local function get_current_python()
    -- 1. Сначала проверяем, активировал ли venv-selector окружение (через vim.env)
    if vim.env.VIRTUAL_ENV then
        local unix_venv_python = vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
        local win_venv_python = vim.fs.joinpath(vim.env.VIRTUAL_ENV, "Scripts", "python.exe")

        if vim.fn.executable(unix_venv_python) == 1 then return unix_venv_python end
        if vim.fn.executable(win_venv_python) == 1 then return win_venv_python end
    end

    -- 2. Если venv-selector еще не запускался, ищем локальный .venv в корне проекта самостоятельно
    local cwd = vim.fn.getcwd()
    local unix_path = vim.fs.joinpath(cwd, ".venv", "bin", "python")
    local win_path = vim.fs.joinpath(cwd, ".venv", "Scripts", "python.exe")

    if vim.fn.executable(unix_path) == 1 then return unix_path
    elseif vim.fn.executable(win_path) == 1 then return win_path
    end

    -- 3. Полный фолбек на системный Python
    return "python"
end
require("py-requirements").setup({
    python = get_current_python, -- Просто передаем нашу функцию
    file_patterns = { "requirements.txt", "pyproject.toml" },
})

