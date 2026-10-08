local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    ---@diagnostic disable-next-line: unused-local
    local opts = { buffer = event.buf }

    local wk = require("which-key")

    -- Define buffer-local mappings specifically for the active LSP buffer
    wk.add({
      -- Non-prefix mappings
      { "<leader>l", icon = "🔧", group = "LSP" },
      { "<leader>ld", function() vim.lsp.buf.hover() end, desc = "Hover Documentation", buffer = event.buf },
      { "<leader>ls", function() vim.lsp.buf.signature_help() end, desc = "Signature Help", buffer = event.buf },
      { "<leader>lr", function() vim.lsp.buf.rename() end, desc = "Rename Symbol", buffer = event.buf },
      { "<leader>la", function() vim.lsp.buf.code_action() end, desc = "Code Action", buffer = event.buf },
      {
        "<leader>lf",
        function() vim.lsp.buf.format({ async = true }) end,
        desc = "Format Buffer",
        mode = { "n", "x" },
        buffer = event.buf
      },
      -- Goto mappings (g prefix)
      { "<leader>lg", icon = "➡️", group = "LSP goto somewere" },
      { "<leader>lgd", function() vim.lsp.buf.definition() end, desc = "Goto Definition", buffer = event.buf },
      { "<leader>lgD", function() vim.lsp.buf.declaration() end, desc = "Goto Declaration", buffer = event.buf },
      { "<leader>lgi", function() vim.lsp.buf.implementation() end, desc = "Goto Implementation", buffer = event.buf },
      { "<leader>lgo", function() vim.lsp.buf.type_definition() end, desc = "Goto Type Definition", buffer = event.buf },
      { "<leader>lgr", function() vim.lsp.buf.references() end, desc = "Goto References", buffer = event.buf },

      -- Leader + Function Key mappings
      { "<leader><F2>", function() vim.lsp.buf.rename() end, desc = "Rename Symbol", buffer = event.buf },
      { "<leader><F4>", function() vim.lsp.buf.code_action() end, desc = "Code Action", buffer = event.buf },

      -- Visual & Normal mode mapping for formatting
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

      -- Trouble
      { "<leader>lx", icon = "🔧", group = "Trouble" },
      { "<leader>lxx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
      { "<leader>lxX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>lxs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)" },
      {
        "<leader>lxl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      { "<leader>lxL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>lxQ", "<cmd>Trouble qflist toggle<cr>",  desc = "Quickfix List (Trouble)" },
      { "<leader>lxq", "<cmd>Trouble quickfix<cr>",       desc = "Quickfix List (Trouble)" },
    })
  end
})
