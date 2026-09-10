local capabilities = require('blink.cmp').get_lsp_capabilities()

require("mason").setup({
  PATH = "append",
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = capabilities,
  })
end
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "groovyls",
    "rust_analyzer",
    "jsonls",
    "bashls",
    "dockerls",
    "sqlls",
    "yamlls",
    "jinja_lsp",
    "helm_ls",
    "docker_compose_language_service",
    "powershell_es",
    "pylsp" },
  automatic_installation = true,
  handlers = {
    default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = {
                'vim',
                'use',
              },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })
    end,
  },
})
