local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
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
    capabilities = lsp_capabilities,
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
    "taplo",
    "helm_ls",
    "docker_compose_language_service",
    "powershell_es",
    "pylsp" },
  automatic_installation = true,
  handlers = {
    default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        capabilities = lsp_capabilities,
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
