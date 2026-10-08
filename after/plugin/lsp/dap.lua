local dap_python = require('dap-python')
local dapui = require('dap.ui')
local dap = require('dap')
local wk = require('which-key')
local widgets = require "dap.ui.widgets"

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

  if vim.fn.executable(unix_path) == 1 then
    return unix_path
  elseif vim.fn.executable(win_path) == 1 then
    return win_path
  end

  -- 3. Полный фолбек на системный Python
  return "python"
end

local signs = {
  DapBreakpoint          = { text = '🐞', texthl = 'DapBreakpoint', linehl = '', numhl = '' },
  DapBreakpointCondition = { text = '❓', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' },
  DapBreakpointRejected  = { text = '🚫', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' },
  DapStopped             = { text = '🚏', texthl = 'DapStopped', linehl = 'Visual', numhl = '' },
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, sign)
end

-- local dap = dap
-- dap.defaults.fallback.terminal_win_cmd = 'tabnew'
-- dap.defaults.fallback.focus_terminal = true

dap_python.setup(get_current_python())

wk.add({
  { "<leader>d", icon = "🐞", group = "debug" },
  { "<leader>du", function() dapui.toggle() end,          desc = "ui toggle" },
  { "<leader>de", function() dapui.eval() end,            desc = "eval" },
  { "<leader>dE", function() dapui.toggle() end,          desc = "float element" },
  { "<leader>dc", function() dap.continue() end,          desc = "continue" },
  { "<leader>dl", function() dap.run_last() end,          desc = "run last" },
  { "<leader>dq", function() dap.terminate() end,         desc = "terminate" },
  { "<leader>dh", function() dap.stop() end,              desc = "stop" },
  { "<leader>dn", function() dap.step_over() end,         desc = "step over" },
  { "<leader>ds", function() dap.step_into() end,         desc = "step into" },
  { "<leader>dS", function() dap.step_out() end,          desc = "step out" },
  { "<leader>db", function() dap.toggle_breakpoint() end, desc = "toggle br" },
  {
    "<leader>dB",
    function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    desc = "set br condition",
  },
  {
    "<leader>dp",
    function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end,
    desc = "set log br",
  },
  {
    "<leader>dr",
    function()
      dap.repl.open()
    end,
    desc = "REPL open"
  },
  {
    "<leader>dk",
    function()
      dap.up()
    end,
    desc = "up callstack"
  },
  {
    "<leader>dj",
    function()
      dap.down()
    end,
    desc = "down callstack"
  },
  {
    "<leader>di",
    function()
      dap.ui.widgets.hover()
    end,
    desc = "info"
  },
  {
    "<leader>d?",
    function()
      widgets.centered_float(widgets.scopes)
    end,
    desc = "scopes",
  },
  { "<leader>df", "<Cmd>Telescope dap frames<CR>",           desc = "search frames" },
  { "<leader>dC", "<Cmd>Telescope dap commands<CR>",         desc = "search commands" },
  { "<leader>dL", "<Cmd>Telescope dap list_breakpoints<CR>", desc = "search breakpoints" },
})
-- 1. Create a function to register debugging-only keys
local function register_dap_keys()
  wk.add({
    -- Control-based stepping shortcuts (using anonymous functions)
    {
      "<C-n>",
      function() dap.step_over() end,
      desc = "Dap: Step Over (Next)",
      mode = "n"
    },
    {
      "<C-i>",
      function() dap.step_into() end,
      desc = "Dap: Step Into",
      mode = "n"
    },
    {
      "<C-o>",
      function() dap.step_out() end,
      desc = "Dap: Step Out",
      mode = "n"
    },

    -- Optional: Conditional Leader prefix menu
    { "<leader>d", group = "Active Debugger" },
    {
      "<leader>dc",
      function() dap.continue() end,
      desc = "Continue/Pause"
    },
    {
      "<leader>dr",
      function() dap.repl.open() end,
      desc = "Open REPL"
    },
  })
end

-- 2. Create a function to clear the keymaps when debugging stops
local function unregister_dap_keys()
  wk.add({
    -- Passing the keys with hidden/nil properties removes them safely
    { "<C-n>",     hidden = true, mode = "n" },
    { "<C-i>",     hidden = true, mode = "n" },
    { "<C-o>",     hidden = true, mode = "n" },
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
