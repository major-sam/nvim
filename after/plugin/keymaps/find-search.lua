local wk = require("which-key")
wk.add({
  { "<leader>s",  group = "Search & Grep" },
  { "<leader>sd", group = "Search Diagnostic" },
  { "<leader>sc", group = "Staff" },
  -- find
  {
    "<leader>/",
    function()
      Snaks.picker.grep()
    end,
    icon = "󰈞",
    desc = "Grep",
  },
  {
    "<leader>scf",
    function()
      Snaks.picker.files({ cwd = vim.fn.stdpath("config") })
    end,
    desc = "Search Config File",
  },
  {
    "<leader>s<space>",
    function()
      Snaks.picker.smart()
    end,
    desc = "Smart Find Files",
  },
  {
    "<leader>sf",
    function()
      Snaks.picker.files()
    end,
    desc = "Search Files",
  },
  {
    "<leader>sg",
    function()
      Snaks.picker.git_files()
    end,
    desc = "Search Git Files",
  },
  {
    "<leader>sp",
    function()
      Snaks.picker.projects()
    end,
    desc = "Projects",
  },
  {
    "<leader>sr",
    function()
      Snaks.picker.recent()
    end,
    desc = "Recent",
  },
  -- Grep
  {
    "<leader>sb",
    function()
      Snaks.picker.lines()
    end,
    desc = "Buffer Lines",
  },
  {
    "<leader>sG",
    function()
      Snaks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "<leader>sv",
    function()
      Snaks.picker.grep_word()
    end,
    desc = "Visual selection or word",
    mode = { "n", "x" },
  },
  -- search
  {
    '<leader>s"',
    function()
      Snaks.picker.registers()
    end,
    desc = "Registers",
  },
  {
    "<leader>s/",
    function()
      Snaks.picker.search_history()
    end,
    desc = "Search History",
  },
  {
    "<leader>sa",
    function()
      Snaks.picker.autocmds()
    end,
    desc = "Autocmds",
  },
  {
    "<leader>sch",
    function()
      Snaks.picker.command_history()
    end,
    desc = "Command History",
  },
  {
    "<leader>sC",
    function()
      Snaks.picker.commands()
    end,
    desc = "Commands",
  },
  {
    "<leader>sdd",
    function()
      Snaks.picker.diagnostics()
    end,
    desc = "Diagnostics",
  },
  {
    "<leader>sdb",
    function()
      Snaks.picker.diagnostics_buffer()
    end,
    desc = "Buffer Diagnostics",
  },
  {
    "<leader>shl",
    function()
      Snaks.picker.highlights()
    end,
    desc = "Highlights",
  },
  {
    "<leader>si",
    function()
      Snaks.picker.icons()
    end,
    icon = "󱂸",
    desc = "Icons",
  },
  {
    "<leader>sj",
    function()
      Snaks.picker.jumps()
    end,
    desc = "Jumps",
  },
  {
    "<leader>sk",
    function()
      Snaks.picker.keymaps()
    end,
    desc = "Keymaps",
  },
  {
    "<leader>sl",
    function()
      Snaks.picker.loclist()
    end,
    desc = "Location List",
  },
  {
    "<leader>sm",
    function()
      Snaks.picker.marks()
    end,
    desc = "Marks",
  },
  {
    "<leader>sM",
    function()
      Snaks.picker.man()
    end,
    desc = "Man Pages",
  },
  {
    "<leader>sP",
    function()
      Snaks.picker.lazy()
    end,
    desc = "Search for Plugin Spec",
  },
  {
    "<leader>sq",
    function()
      Snaks.picker.qflist()
    end,
    desc = "Quickfix List",
  },
  {
    "<leader>sR",
    function()
      Snaks.picker.resume()
    end,
    desc = "Resume",
  },
  {
    "<leader>su",
    function()
      Snaks.picker.undo()
    end,
    desc = "Undo History",
  },
  {
    "<leader>scs",
    function()
      Snaks.picker.colorschemes()
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
})
