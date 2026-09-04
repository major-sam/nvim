local signs = {
  DapBreakpoint          = { text = '🐞', texthl = 'DapBreakpoint', linehl = '', numhl = '' },
  DapBreakpointCondition = { text = '❓', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' },
  DapBreakpointRejected  = { text = '🚫', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' },
  DapStopped             = { text = '🚏', texthl = 'DapStopped', linehl = 'Visual', numhl = '' },
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, sign)
end

local dap = require('dap')
dap.defaults.fallback.terminal_win_cmd = 'tabnew'
dap.defaults.fallback.focus_terminal = true


dap_python = require('dap-python')

local cwd = vim.fn.getcwd()
if string.lower(jit.os) == 'windows' then
  if vim.fn.executable(cwd .. '/venv/Scripts/python.exe') == 1 then
    dap_python.setup(cwd .. './venv/Scripts/python.exe')
  elseif vim.fn.executable(cwd .. '/venv/Scripts/python.exe') == 1 then
    dap_python.setup(cwd .. './.venv/Scripts/python.exe')
  else
    dap_python.setup(vim.g.python3_host_prog)
  end;
else
  print ('linux')
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    dap_python.setup(cwd .. '/venv/bin/python')
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    dap_python.setup(cwd .. '/.venv/bin/python')
  else
    dap_python.setup('python3')
  end;
end;
if string.lower(jit.os) == 'windows' then
  require("dap-python").setup(vim.g.python3_host_prog)
else
end;
