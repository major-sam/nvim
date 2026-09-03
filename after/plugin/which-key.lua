local wk = require("which-key")
local qk = require("quicker")
local ts_builtin = require('telescope.builtin')
wk.add({
  { '<leader>b', group = 'Buffers' },
  { '<leader>d', icon = '🐞', group = 'debug' },
  { '<leader>f', group = 'Find' },
  { '<leader>R', icon = '󰑕', group = 'Rename File' },
  --{ '<leader>r', icon = '🎮', group = 'Games' },
  { '<leader>t', icon = '󰗊', group = 'Translate' },
  { '<leader>g', icon = '', group = 'Git' },
  { '<leader>o', icon = '📓', group = 'Obsidian' },
  { '<leader>s', icon = '🍪', group = 'Snaks' },
  { '<leader>v', icon = '󰘥', group = 'Help' },
  { '<leader>u', icon = '🔧', group = 'Configs ' },
  { '<leader>x', icon = '🔧', group = 'Trouble' },
  --{ "<leader>rl", "<cmd>CellularAutomaton game_of_life<CR>", desc = "game of life" },
  --{ "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "make it rain" },
  { '<leader>bb', ts_builtin.buffers, desc = 'TS show Buffers' },
  { '<leader>vh', ts_builtin.help_tags, desc = 'TS Documentation tags' },
  { "<leader>y", [["+y]], mode = { "n", "v" }, desc = "yank selected and move to buffer" },
  { "<leader>Y", [["+Y]], desc = "yank string and move to buffer" },
  { "<leader>p", [["_dP]], mode = { "x" }, desc = "replace selected and move to buffer" },
  { "<leader>ul", '<cmd>UndotreeToggle', desc = 'Toggle undotree' },
  {
    "<leader>q",
    function()
      qk.toggle()
    end,
    desc = "Toggle Quickfix list"
  },
  {
    "<leader>ql",
    function()
      qk.toggle({ loclist = true })
    end,
    desc = "Toggle Quickfix list"
  },
  {
    "<leader>fs",
    function()
      ts_builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end,
    desc = "Smart Grep in current dir"
  },
  -- terminal mode quick switch
  { '<leader><esc>', '<C-\\><C-N>',                                                                               mode = "t",                                            desc = "Set terminal to normal mode",           silent = true },
  { '<leader>l',     '<C-\\><C-N><C-w>l',                                                                         mode = "t",                                            desc = "switch to left tab in terminal mode",   silent = true },
  { '<leader>j',     '<C-\\><C-N><C-w>j',                                                                         mode = "t",                                            desc = "switch to bottom tab in terminal mode", silent = true },
  { '<leader>k',     '<C-\\><C-N><C-w>k',                                                                         mode = "t",                                            desc = "switch to upper tab in terminal mode",  silent = true },
  { '<leader>h',     '<C-\\><C-N><C-w>h',                                                                         mode = "t",                                            desc = "switch to right tab in terminal mode",  silent = true },
  { "<leader>on",    "<cmd>ObsidianLinkNew<CR>",                                                                  mode = 'n',                                            desc = "Create new Obsidian link" },
  { "<leader>on",    "<cmd>ObsidianLinkNew<CR>",                                                                  mode = 'v',                                            desc = "Create new Obsidian link" },

  { "<leader>xx",    "<cmd>Trouble diagnostics toggle<cr>",                                                       desc = "Diagnostics (Trouble)", },
  { "<leader>xX",    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",                                          desc = "Buffer Diagnostics (Trouble)", },
  { "<leader>xs",    "<cmd>Trouble symbols toggle focus=false<cr>",                                               desc = "Symbols (Trouble)" },
  { "<leader>xl",    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",                                desc = "LSP Definitions / references / ... (Trouble)", },
  { "<leader>xL",    "<cmd>Trouble loclist toggle<cr>",                                                           desc = "Location List (Trouble)", },
  { "<leader>xQ",    "<cmd>Trouble qflist toggle<cr>",                                                            desc = "Quickfix List (Trouble)", },
  { "<leader>xq",    "<cmd>Trouble quickfix<cr>",                                                                 desc = "Quickfix List (Trouble)", },

  { "<leader>t",     "<cmd>Translate<cr>",                                                                        mode = { "n", "v" },                                   desc = "Translate" },
  { "<leader>tr",    "<cmd>TranslateR<cr>",                                                                       mode = { "n", "v" },                                   desc = "Replace text with Translate" },
  { "<leader>tw",    "<cmd>TranslateW<cr>",                                                                       mode = { "n", "v" },                                   desc = "Translate in window" },

  { '<leader>du',    '<Cmd>lua require"dapui".toggle()<CR>',                                                      desc = 'ui toggle' },
  { '<leader>de',    '<Cmd>lua require"dapui".eval()<CR>',                                                        desc = 'eval' },
  { '<leader>dE',    '<Cmd>lua require"dapui".toggle()<CR>',                                                      desc = 'float element' },
  { '<leader>dc',    '<Cmd>lua require"dap".continue()<CR>',                                                      desc = 'continue' },
  { '<leader>dl',    '<Cmd>lua require"dap".run_last()<CR>',                                                      desc = 'run last' },
  { '<leader>dq',    '<Cmd>lua require"dap".terminate()<CR>',                                                     desc = 'terminate' },
  { '<leader>dh',    '<Cmd>lua require"dap".stop()<CR>',                                                          desc = 'stop' },
  { '<leader>dn',    '<Cmd>lua require"dap".step_over()<CR>',                                                     desc = 'step over' },
  { '<leader>ds',    '<Cmd>lua require"dap".step_into()<CR>',                                                     desc = 'step into' },
  { '<leader>dS',    '<Cmd>lua require"dap".step_out()<CR>',                                                      desc = 'step out' },
  { '<leader>db',    '<Cmd>lua require"dap".toggle_breakpoint()<CR>',                                             desc = 'toggle br' },
  { '<leader>dB',    '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',          desc = 'set br condition' },
  { '<leader>dp',    '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',   desc = 'set log br' },
  { '<leader>dr',    '<Cmd>lua require"dap".repl.open()<CR>',                                                     desc = 'REPL open' },
  { '<leader>dk',    '<Cmd>lua require"dap".up()<CR>',                                                            desc = 'up callstack' },
  { '<leader>dj',    '<Cmd>lua require"dap".down()<CR>',                                                          desc = 'down callstack' },
  { '<leader>di',    '<Cmd>lua require"dap.ui.widgets".hover()<CR>',                                              desc = 'info' },
  { '<leader>d?',    '<Cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', desc = 'scopes' },
  { '<leader>df',    '<Cmd>Telescope dap frames<CR>',                                                             desc = 'search frames' },
  { '<leader>dC',    '<Cmd>Telescope dap commands<CR>',                                                           desc = 'search commands' },
  { '<leader>dL',    '<Cmd>Telescope dap list_breakpoints<CR>',                                                   desc = 'search breakpoints' },

  { "<leader>gdo",   '<Cmd>DiffviewOpen<CR>',                                                                     desc = 'Open Diffview' },
  { "<leader>gdc",   '<Cmd>DiffviewClose<CR>',                                                                    desc = 'Close Diffview' },
  { "<leader>gdf",   '<Cmd>DiffviewFileHistory<CR>',                                                              desc = 'Open Diffview history' },
  { "<leader>gdt",   '<Cmd>DiffviewToggleFiles<CR>',                                                              desc = 'Open Toggle' }
})
