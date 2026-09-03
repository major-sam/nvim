return{
  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    tag = "v3.9.0",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/*/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/*/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter"
    },
  },
}
