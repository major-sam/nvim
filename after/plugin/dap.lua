local dap = require('dap')
local signs = {
  DapBreakpoint          = { text = '🐞', texthl = 'DapBreakpoint', linehl = '', numhl = '' },
  DapBreakpointCondition = { text = '❓', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' },
  DapBreakpointRejected  = { text = '🚫', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' },
  DapStopped             = { text = '🚏', texthl = 'DapStopped', linehl = 'Visual', numhl = '' },
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, sign)
end

dap.defaults.fallback.terminal_win_cmd = 'tabnew'
dap.defaults.fallback.focus_terminal = true

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch',
    name = "Launch file",

    program = "${file}", -- This configuration will launch the current file if used.

  },
}
