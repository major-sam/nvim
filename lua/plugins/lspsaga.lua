return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- Настройки Lspsaga (по желанию)
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
  },
}
