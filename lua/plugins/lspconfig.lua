return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Example: configuring a server with custom settings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Enable the language server(s)
      vim.lsp.enable({ "lua_ls", "ts_ls" })
    end,
  },
}
