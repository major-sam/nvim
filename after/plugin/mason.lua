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

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
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
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})
