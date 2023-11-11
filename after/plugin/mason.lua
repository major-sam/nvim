local lsp_zero = require('lsp-zero')
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
--    ansiblels = function()
--      require("lspconfig").ansiblels.setup {
--        settings = {
--          ansible = {
--            validation = {
--              lint = {
--                enabled = false;
--              }
--            }
--          }
--        }
--      }
--    end,
  }
})
