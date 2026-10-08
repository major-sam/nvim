local autocmd = vim.api.nvim_create_autocmd
local wk = require("which-key")
wk.add({
  { "<leader>l", icon = "🔧", group = "LSP" },
  { "<leader>lg", icon = "➡️", group = "LSP goto somewere" },
  {
    "K",
    function()
      vim.cmd("Lspsaga hover_doc")
    end,
    desc = "Lspsaga: Документация (Hover)",
    mode = "n",
  },
  {
    "gd",
    function()
      vim.cmd("Lspsaga goto_definition")
    end,
    desc = "Lspsaga: Перейти к определению",
    mode = "n",
  },
  {
    "gp",
    function()
      vim.cmd("Lspsaga peek_definition")
    end,
    desc = "Lspsaga: Подглядеть определение",
    mode = "n",
  },
  {
    "gh",
    function()
      vim.cmd("Lspsaga lsp_finder")
    end,
    desc = "Lspsaga: Поиск определений и ссылок",
    mode = "n",
  },
  {
    "[d",
    function()
      vim.cmd("Lspsaga diagnostic_jump_prev")
    end,
    desc = "Lspsaga: Предыдущая ошибка",
    mode = "n",
  },
  {
    "]d",
    function()
      vim.cmd("Lspsaga diagnostic_jump_next")
    end,
    desc = "Lspsaga: Следующая ошибка",
    mode = "n",
  },
  ---- Goto mappings (g prefix)
  --{ "<leader>lgd", function() vim.lsp.buf.definition() end, desc = "Goto Definition", buffer = event.buf },
  --{ "<leader>lgD", function() vim.lsp.buf.declaration() end, desc = "Goto Declaration", buffer = event.buf },
  --{ "<leader>lgi", function() vim.lsp.buf.implementation() end, desc = "Goto Implementation", buffer = event.buf },
  --{ "<leader>lgo", function() vim.lsp.buf.type_definition() end, desc = "Goto Type Definition", buffer = event.buf },
  --{ "<leader>lgr", function() vim.lsp.buf.references() end, desc = "Goto References", buffer = event.buf },

  -- Leader + Function Key mappings

  -- Visual & Normal mode mapping for formatting

  -- Trouble
  { "<leader>lx", icon = "🔧", group = "Trouble" },
  { "<leader>lxx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  { "<leader>lxX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  { "<leader>lxs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
  {
    "<leader>lxl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  { "<leader>lxL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  { "<leader>lxQ", "<cmd>Trouble qflist toggle<cr>",  desc = "Quickfix List (Trouble)" },
  { "<leader>lxq", "<cmd>Trouble quickfix<cr>",       desc = "Quickfix List (Trouble)" },


  {
    "<leader><F4>",
    function()
      vim.cmd("Lspsaga code_action")
    end,
    desc = "Lspsaga: Действия кода",
  },
  {
    "<leader>la",
    function()
      vim.cmd("Lspsaga code_action")
    end,
    desc = "Lspsaga: Действия кода",
  },
  {
    "<leader><F2>",
    function()
      vim.cmd("Lspsaga rename")
    end,
    desc = "Lspsaga: Переименовать (Smart Rename)",
  },
  {
    "<leader>lr",
    function()
      vim.cmd("Lspsaga rename")
    end,
    desc = "Lspsaga: Переименовать (Smart Rename)",
  },
  {
    "<leader>lo",
    function()
      vim.cmd("Lspsaga outline")
    end,
    desc = "Lspsaga: Показать структуру файла (Outline)",
  },
  {
    "<leader>ld",
    function()
      vim.cmd("Lspsaga show_line_diagnostics")
    end,
    desc = "Lspsaga: Ошибки текущей строки",
  },
  {
    "<leader>li",
    function()
      vim.cmd("Lspsaga show_buf_diagnostics")
    end,
    desc = "Lspsaga: Все ошибки буфера",
  },
  {
    "<leader>lhd",
    function()
      vim.cmd("Lspsaga hover_doc")
    end,
    desc = "Lspsaga: Документация (Hover)",
  },
  {
    "<leader>la",
    function()
      vim.cmd("Lspsaga code_action")
    end,
    mode = "v",
    group = "Lsp Saga",
    desc = "Lspsaga: Действия кода для выделения",
  },
})
autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    ---@diagnostic disable-next-line: unused-local
    local opts = { buffer = event.buf }

    wk.add({
  {
    "<leader>lf",
    function() vim.lsp.buf.format({ async = true }) end,
    desc = "Format Buffer",
    mode = { "n", "x" },
    buffer = event.buf
  },
  {
    "<leader><F3>",
    function() vim.lsp.buf.format({ async = true }) end,
    desc = "Format Buffer",
    mode = { "n", "x" },
    buffer = event.buf
  },
  {
    "<leader>lh",
    function()
      local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
    end,
    desc = "Toggle Inlay Hints",
    buffer = event.buf
  },

    })
  end
})
