return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "folke/snacks.nvim",
  },
  ft = "python",       --
  keys = {},           -- Open picker on keymap
  opts = {
    picker = "snacks", -- Sets snacks.picker as the default UI
    draw_square_brackets = true,
    options = {},      -- plugin-wide options
    search = {}        -- custom search definitions
  },
}
