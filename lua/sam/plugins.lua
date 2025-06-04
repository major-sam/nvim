require("lazy").setup({
  "neovim/nvim-lspconfig",
  "jeetsukumaran/vim-indentwise",
  {
    "voldikss/vim-translator",
    config = function()
      vim.g.translator_target_lang = "ru";
      vim.g.translator_default_engines = {'bing', 'google'};
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
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies =  {
      "someone-stole-my-name/yaml-companion.nvim",
      "nvim-lua/plenary.nvim" }
  },
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
},
  {
    'andrew-george/telescope-themes',
    config = function()
        require('telescope').load_extension('themes')
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    priority = 1000,
    config = function()
      require'nvim-web-devicons'.setup {
        default = true;
        strict = true;
        override_by_filename = {
          ["Dockerfile.*"] = { icon = "", color = "#0034c3", cterm_color = "4", name = "Docker" },
          ["jenkinsfile.*"] = { icon = "", cterm_color = "196", color = "#FF4500", name = "Jenkins" },
          ["Jenkinsfile.*"] = { icon = "", cterm_color = "196", color = "#FF4500", name = "Jenkins" },
          ["JenkinsFile.*"] = { icon = "", cterm_color = "196", color = "#FF4500", name = "Jenkins" },
          ["jenkinsFile.*"] = { icon = "", cterm_color = "196", color = "#ff4500", name = "jenkins" },
        }
      }
    end
  },
  "lewis6991/gitsigns.nvim",
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
        'stevearc/dressing.nvim',
        'nvim-telescope/telescope.nvim',
    },
    cmd = 'Nerdy',
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      { "abeldekat/harpoonline", version = "*" },
    }
  },
  {
    "folke/twilight.nvim",
    opts = { }
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)"
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "html" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        additional_vim_regex_highlighting = false,
        indent = {
          enable = true,
          disable = { "yaml" }
        },
      })
    end

  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require"alpha".setup(require"alpha.themes.startify".config)
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
	tag = "v4.9.0",
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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "jecaro/fugitive-difftool.nvim",
  "tpope/vim-rhubarb",
  "borissov/fugitive-bitbucketserver",
  "nvim-treesitter/nvim-treesitter-context",
  "tpope/vim-repeat",
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup({
        root_key = "S"
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
--  {
--    "nvim-neo-tree/neo-tree.nvim",
--    branch = "v3.x",
--    dependencies = {
--      "nvim-lua/plenary.nvim",
--      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--      "MunifTanjim/nui.nvim",
--      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
--    },
--    config = function ()
--      -- If you want icons for diagnostic errors, you"ll need to define them somewhere:
--      vim.fn.sign_define("DiagnosticSignError",
--        {text = " ", texthl = "DiagnosticSignError"})
--      vim.fn.sign_define("DiagnosticSignWarn",
--        {text = " ", texthl = "DiagnosticSignWarn"})
--      vim.fn.sign_define("DiagnosticSignInfo",
--        {text = " ", texthl = "DiagnosticSignInfo"})
--      vim.fn.sign_define("DiagnosticSignHint",
--        {text = "󰌵", texthl = "DiagnosticSignHint"})
--    end
--  },
  -- LSP Support
  "neovim/nvim-lspconfig",
  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim",

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "petertriho/cmp-git",
      "ray-x/cmp-treesitter",
    },
  },

  -- Snippets
  "L3MON4D3/LuaSnip",
  -- HACK
  "eandrju/cellular-automaton.nvim",
  -- syntax
  -- WARN some varn
  "martinda/Jenkinsfile-vim-syntax",
  "numToStr/Comment.nvim",
  -- Lua
  "machakann/vim-highlightedyank",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  "laytan/cloak.nvim",
  "PhilRunninger/nerdtree-buffer-ops",
  "PhilRunninger/nerdtree-visual-selection",
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
    keys = {
      { "<leader>on","viw<cmd>ObsidianLinkNew<CR>",mode = 'n',desc = "Create new Obsidian link"},
      { "<leader>on","<cmd>ObsidianLinkNew<CR>",mode = 'v',desc = "Create new Obsidian link"},
    },
  },
})
