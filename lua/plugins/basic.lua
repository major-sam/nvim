return{
  'nvim-tree/nvim-web-devicons',
  -- LSP Support
  "neovim/nvim-lspconfig",
  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim",
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {},
    dependencies = {
      "towolf/vim-helm"
    }
  },
  {
    "Kurren123/mssql.nvim",
    opts = {
      -- optional
      keymap_prefix = "<leader>m"
    },
    -- optional
    dependencies = { "folke/which-key.nvim" }
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  'sindrets/diffview.nvim',
  "borissov/fugitive-bitbucketserver",
  "nvim-treesitter/nvim-treesitter-context",
  "tpope/vim-repeat",
  {
    "voldikss/vim-translator",
    config = function()
      vim.g.translator_target_lang = "ru";
      vim.g.translator_default_engines = { 'bing', 'google' };
    end,
    keys = {
      {
        "<leader>t",
        "<cmd>Translate<cr>",
        mode = { "n", "v" },
        desc = "Translate",
      },
      {
        "<leader>tr",
        "<cmd>TranslateR<cr>",
        mode = { "n", "v" },
        desc = "Replace text with Translate",
      },
      {
        "<leader>tw",
        "<cmd>TranslateW<cr>",
        mode = { "n", "v" },
        desc = "Translate in window",
      },
    },
  },
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'stevearc/dressing.nvim',
      'folke/snacks.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Nerdy',
    opts = {
      max_recents = 30,               -- Configure recent icons limit
      add_default_keybindings = true, -- Add default keybindings
      copy_to_clipboard = false,      -- Copy glyph to clipboard instead of inserting
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  "lewis6991/gitsigns.nvim",
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  },
  "laytan/cloak.nvim",
  -- HACK
  "eandrju/cellular-automaton.nvim",
  -- syntax
  -- WARN some varn
  "martinda/Jenkinsfile-vim-syntax",
  "numToStr/Comment.nvim",
  -- Identation visualisation
  "machakann/vim-highlightedyank",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
