return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    tag = "v4.10.0",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-notify",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "folke/twilight.nvim",
    opts = {}
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    }
  }

}
