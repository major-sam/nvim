local wk = require("which-key")
local py = require("py-requirements")
local qk = require("quicker")
local ts_builtin = require("telescope.builtin")
local neotest = require("neotest")
-- Helper function to find the local venv path
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
  { "<leader>b", icon = "🔀", group = "Buffers" },
  { "<leader>d", icon = "🐞", group = "debug" },
  { "<leader>f", group = "Find" },
  { "<leader>R", icon = "󰑕", group = "Rename File" },
  { "<leader>T", icon = "󰗊", group = "Translate" },
  { "<leader>g", icon = "", group = "Git" },
  { "<leader>q", icon = "󰁨", group = "Quickfix" },
  { "<leader>s", icon = "🍪", group = "Search & Snaks" },
  { "<leader>S", icon = "󰗅", group = "Surround" },
  { "<leader>v", icon = "󰘥", group = "Help" },
  { "<leader>u", icon = "🔧", group = "Configs " },
  { "<leader>x", icon = "🔧", group = "Trouble" },
  -- Top Pickers & Explorer
  {
    "<leader>f<space>",
    function()
      Snacks.picker.smart()
    end,
    desc = "Smart Find Files",
  },
  {
    "<leader>bB",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
  },
  {
    "<leader>bS",
    function()
      Snacks.scratch.select()
    end,
    desc = "Select Scratch Buffer",
  },
  {
    "<leader>/",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "<leader>:",
    function()
      Snacks.picker.command_history()
    end,
    desc = "Command History",
  },
  {
    "<leader>n",
    function()
      Snacks.picker.notifications()
    end,
    desc = "Notification History",
  },
  {
    "<leader>e",
    function()
      Snacks.explorer()
    end,
    desc = "File Explorer",
  },
  {
    "<F3>",
    function()
      Snacks.explorer()
    end,
    mode = { "n", "x", "v", "s" },
    desc = "File Explorer",
  },
  -- find
  {
    "<leader>fb",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
  },
  {
    "<leader>fc",
    function()
      Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
    end,
    desc = "Find Config File",
  },
  {
    "<leader>ff",
    function()
      Snacks.picker.files()
    end,
    desc = "Find Files",
  },
  {
    "<leader>fg",
    function()
      Snacks.picker.git_files()
    end,
    desc = "Find Git Files",
  },
  {
    "<leader>fp",
    function()
      Snacks.picker.projects()
    end,
    desc = "Projects",
  },
  {
    "<leader>fr",
    function()
      Snacks.picker.recent()
    end,
    desc = "Recent",
  },
  -- git
  {
    "<leader>gb",
    function()
      Snacks.picker.git_branches()
    end,
    desc = "Git Branches",
  },
  {
    "<leader>gl",
    function()
      Snacks.picker.git_log()
    end,
    desc = "Git Log",
  },
  {
    "<leader>gL",
    function()
      Snacks.picker.git_log_line()
    end,
    desc = "Git Log Line",
  },
  {
    "<leader>gs",
    function()
      Snacks.picker.git_status()
    end,
    desc = "Git Status",
  },
  {
    "<leader>gS",
    function()
      Snacks.picker.git_stash()
    end,
    desc = "Git Stash",
  },
  {
    "<leader>gd",
    function()
      Snacks.picker.git_diff()
    end,
    desc = "Git Diff (Hunks)",
  },
  {
    "<leader>gf",
    function()
      Snacks.picker.git_log_file()
    end,
    desc = "Git Log File",
  },
  -- gh
  {
    "<leader>gi",
    function()
      Snacks.picker.gh_issue()
    end,
    desc = "GitHub Issues (open)",
  },
  {
    "<leader>gI",
    function()
      Snacks.picker.gh_issue({ state = "all" })
    end,
    desc = "GitHub Issues (all)",
  },
  {
    "<leader>gp",
    function()
      Snacks.picker.gh_pr()
    end,
    desc = "GitHub Pull Requests (open)",
  },
  {
    "<leader>gP",
    function()
      Snacks.picker.gh_pr({ state = "all" })
    end,
    desc = "GitHub Pull Requests (all)",
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
    "<leader>sB",
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = "Grep Open Buffers",
  },
  {
    "<leader>sg",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "<leader>sw",
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
    "<leader>sb",
    function()
      Snacks.picker.lines()
    end,
    desc = "Buffer Lines",
  },
  {
    "<leader>sc",
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
    "<leader>sd",
    function()
      Snacks.picker.diagnostics()
    end,
    desc = "Diagnostics",
  },
  {
    "<leader>sD",
    function()
      Snacks.picker.diagnostics_buffer()
    end,
    desc = "Buffer Diagnostics",
  },
  {
    "<leader>sh",
    function()
      Snacks.picker.help()
    end,
    desc = "Help Pages",
  },
  {
    "<leader>sH",
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
    "<leader>sp",
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
    "<leader>uC",
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
  -- LSP
  {
    "gd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "Goto Definition",
  },
  {
    "gD",
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = "Goto Declaration",
  },
  {
    "gr",
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "References",
  },
  {
    "gI",
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = "Goto Implementation",
  },
  {
    "gy",
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = "Goto T[y]pe Definition",
  },
  {
    "gai",
    function()
      Snacks.picker.lsp_incoming_calls()
    end,
    desc = "C[a]lls Incoming",
  },
  {
    "gao",
    function()
      Snacks.picker.lsp_outgoing_calls()
    end,
    desc = "C[a]lls Outgoing",
  },
  {
    "<leader>ss",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "LSP Symbols",
  },
  {
    "<leader>sS",
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "LSP Workspace Symbols",
  },
  -- Other
  {
    "<leader>z",
    function()
      Snacks.zen()
    end,
    desc = "Toggle Zen Mode",
  },
  {
    "<leader>Z",
    function()
      Snacks.zen.zoom()
    end,
    desc = "Toggle Zoom",
  },
  {
    "<leader>.",
    function()
      Snacks.scratch()
    end,
    desc = "Toggle Scratch Buffer",
  },
  {
    "<leader>n",
    function()
      Snacks.notifier.show_history()
    end,
    desc = "Notification History",
  },
  {
    "<leader>bd",
    function()
      Snacks.bufdelete()
    end,
    desc = "Delete Buffer",
  },
  {
    "<leader>Rf",
    function()
      Snacks.rename.rename_file()
    end,
    desc = "Rename File",
  },
  {
    "<leader>gB",
    function()
      Snacks.gitbrowse()
    end,
    desc = "Git Browse",
    mode = { "n", "v" },
  },
  {
    "<leader>gg",
    function()
      Snacks.lazygit()
    end,
    desc = "Lazygit",
  },
  {
    "<leader>un",
    function()
      Snacks.notifier.hide()
    end,
    desc = "Dismiss All Notifications",
  },
  {
    "<c-/>",
    function()
      Snacks.terminal()
    end,
    desc = "Toggle Terminal",
  },
  {
    "<c-_>",
    function()
      Snacks.terminal()
    end,
    desc = "which_key_ignore",
  },
  {
    "]]",
    function()
      Snacks.words.jump(vim.v.count1)
    end,
    desc = "Next Reference",
    mode = { "n", "t" },
  },
  {
    "[[",
    function()
      Snacks.words.jump(-vim.v.count1)
    end,
    desc = "Prev Reference",
    mode = { "n", "t" },
  },
  {
    "<leader>N",
    desc = "Neovim News",
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      })
    end,
  },
  { "<leader>bb", ts_builtin.buffers,    desc = "TS show open Buffers" },
  { "<leader>vh", ts_builtin.help_tags,  desc = "TS Documentation tags" },
  { "<leader>y",  [["+y]],               mode = { "n", "v" },                    desc = "yank selected and move to buffer" },
  { "<leader>Y",  [["+Y]],               desc = "yank string and move to buffer" },
  { "<leader>P",  [["_dP]],              mode = { "x" },                         desc = "replace selected and move to buffer" },
  { "<leader>ul", "<cmd>UndotreeToggle", desc = "Toggle undotree" },
  {
    "<leader>qf",
    function()
      qk.toggle()
    end,
    desc = "Toggle Quickfix list",
  },
  {
    "<leader>ql",
    function()
      qk.toggle({ loclist = true })
    end,
    desc = "Toggle Quickfix list",
  },
  {
    "<leader>fs",
    function()
      ts_builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end,
    desc = "Smart Grep in current dir",
  },
  { "<leader><esc>", "<C-\\><C-N>", mode = "t", desc = "Set terminal to normal mode", silent = true },
  { "<leader>l", "<C-\\><C-N><C-w>l", mode = "t", desc = "switch to left tab in terminal mode", silent = true },
  { "<leader>j", "<C-\\><C-N><C-w>j", mode = "t", desc = "switch to bottom tab in terminal mode", silent = true },
  { "<leader>k", "<C-\\><C-N><C-w>k", mode = "t", desc = "switch to upper tab in terminal mode", silent = true },
  { "<leader>h", "<C-\\><C-N><C-w>h", mode = "t", desc = "switch to right tab in terminal mode", silent = true },

  { "<leader>o", icon = "📓", group = "Obsidian" },
  { "<leader>on", "<cmd>ObsidianLinkNew<CR>", mode = "n", desc = "Create new Obsidian link" },
  { "<leader>on", "<cmd>ObsidianLinkNew<CR>", mode = "v", desc = "Create new Obsidian link" },

  { "<leader>p", group = "Python", icon = " " }, -- Optional group icon if you have Nerd Fonts
  { "<leader>pe", icon = "", "<cmd>VenvSelect<cr>", desc = "REPL venv-selector" },
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
        if not args then return end

        require("snacks").terminal(python .. " " .. file .. " " .. args, {
          win = { position = "float", border = "rounded" },
          auto_close = false,
        })
      end)
    end,
    desc = "Run file with args...",
  },
  -- Trouble
  { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
  { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)" },
  {
    "<leader>xl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List (Trouble)" },
  -- Translate
  { "<leader>Tt", "<cmd>Translate<cr>", mode = { "n", "v" }, desc = "Translate" },
  { "<leader>Tr", "<cmd>TranslateR<cr>", mode = { "n", "v" }, desc = "Replace text with Translate" },
  { "<leader>Tw", "<cmd>TranslateW<cr>", mode = { "n", "v" }, desc = "Translate in window" },

  { "<leader>t", icon = "󰙨", group = "Test" },
  {
    "<leader>tt",
    function()
      neotest.run.run()
    end,
    desc = "Run nearest test",
  },
  {
    "<leader>tf",
    function()
      neotest.run.run(vim.fn.expand("%"))
    end,
    desc = "Run current file",
  },
  {
    "<leader>ta",
    function()
      neotest.run.run({ suite = true })
    end,
    desc = "Run all tests",
  },
  {
    "<leader>ts",
    function()
      neotest.summary.toggle()
    end,
    desc = "Toggle summary panel",
  },
  {
    "<leader>td",
    function()
      neotest.run.run({ strategy = "dap" })
    end,
    desc = "Debug nearest test",
  },
  {
    "<leader>to",
    function()
      neotest.output_panel.toggle()
    end,
    desc = "Toggle output Repl",
  },

  { "<leader>du", '<Cmd>lua require"dapui".toggle()<CR>',          desc = "ui toggle" },
  { "<leader>de", '<Cmd>lua require"dapui".eval()<CR>',            desc = "eval" },
  { "<leader>dE", '<Cmd>lua require"dapui".toggle()<CR>',          desc = "float element" },
  { "<leader>dc", '<Cmd>lua require"dap".continue()<CR>',          desc = "continue" },
  { "<leader>dl", '<Cmd>lua require"dap".run_last()<CR>',          desc = "run last" },
  { "<leader>dq", '<Cmd>lua require"dap".terminate()<CR>',         desc = "terminate" },
  { "<leader>dh", '<Cmd>lua require"dap".stop()<CR>',              desc = "stop" },
  { "<leader>dn", '<Cmd>lua require"dap".step_over()<CR>',         desc = "step over" },
  { "<leader>ds", '<Cmd>lua require"dap".step_into()<CR>',         desc = "step into" },
  { "<leader>dS", '<Cmd>lua require"dap".step_out()<CR>',          desc = "step out" },
  { "<leader>db", '<Cmd>lua require"dap".toggle_breakpoint()<CR>', desc = "toggle br" },
  {
    "<leader>dB",
    '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    desc = "set br condition",
  },
  {
    "<leader>dp",
    '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
    desc = "set log br",
  },
  { "<leader>dr", '<Cmd>lua require"dap".repl.open()<CR>',        desc = "REPL open" },
  { "<leader>dk", '<Cmd>lua require"dap".up()<CR>',               desc = "up callstack" },
  { "<leader>dj", '<Cmd>lua require"dap".down()<CR>',             desc = "down callstack" },
  { "<leader>di", '<Cmd>lua require"dap.ui.widgets".hover()<CR>', desc = "info" },
  {
    "<leader>d?",
    '<Cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>',
    desc = "scopes",
  },
  { "<leader>df",  "<Cmd>Telescope dap frames<CR>",           desc = "search frames" },
  { "<leader>dC",  "<Cmd>Telescope dap commands<CR>",         desc = "search commands" },
  { "<leader>dL",  "<Cmd>Telescope dap list_breakpoints<CR>", desc = "search breakpoints" },

  { "<leader>gdo", "<Cmd>DiffviewOpen<CR>",                   desc = "Open Diffview" },
  { "<leader>gdc", "<Cmd>DiffviewClose<CR>",                  desc = "Close Diffview" },
  { "<leader>gdf", "<Cmd>DiffviewFileHistory<CR>",            desc = "Open Diffview history" },
  { "<leader>gdt", "<Cmd>DiffviewToggleFiles<CR>",            desc = "Open Toggle" },
})
