return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    link = {
      style = "markdown"
    },
    legacy_commands = false,
    workspaces      = {
      {
        name = "vault-home",
        path = "~/obsidian/vault-home/",
        strict = true
      },
      {
        name = "vault1",
        path = "~/obsidian/vault1/",
        strict = true
      }
    }
  }
}
