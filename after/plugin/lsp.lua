local M = {}
M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Field = "󰄶 ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "󰜰",
  Keyword = "󰌆 ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = "󰘍 ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = " ",
}

local lspconfig = vim.lsp.config
vim.lsp.enable("helm_ls")
-- setup helm-ls
lspconfig("helm_ls", {
	settings = {
		["helm-ls"] = {
			yamlls = {
				path = "yaml-language-server",
			},
		},
	},
})
lspconfig("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = {
          "$VIMRUNTIME",
          "$XDG_DATA_HOME/nvim/lazy",
        },
      },
      diagnostics = {
        globals = {'vim','jit'},
      },
    },
  },
})

-- enable yamlls
vim.lsp.enable("yamlls")
-- optional: configure yamlls options
lspconfig("yamlls", {})
function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

return M
