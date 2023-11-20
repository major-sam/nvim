-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Basic
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })
  use { "ellisonleao/gruvbox.nvim" }
  use {
    'nvim-treesitter/nvim-treesitter', tag = 'v0.9.1',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,}
-- noice
  use {"folke/noice.nvim", tag = 'v2.0.0',
    requires = {
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
  -- use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");
  use "laytan/cloak.nvim"
  use "tpope/vim-surround"
  use 'tpope/vim-repeat'
  use 'vim-scripts/tasklist.vim'
  -- nerdtree
  use 'ryanoasis/vim-devicons'
  use 'scrooloose/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use "philrunninger/nerdtree-visual-selection"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'airblade/vim-gitgutter'
  -- lsp
  use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  -- Fun
  use "eandrju/cellular-automaton.nvim"
-- syntax
  use {
    "yorik1984/zola.nvim",
    requires = {
      "Glench/Vim-Jinja2-Syntax",
      "cespare/vim-toml",             -- for Neovim ⩽ 0.6.0
    }
  }
  --  use 'mfussenegger/nvim-ansible'
  --  use 'pearofducks/ansible-vim'
  use 'martinda/Jenkinsfile-vim-syntax'
  use {'neoclide/coc.nvim', branch = 'release'}

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use "lukas-reineke/indent-blankline.nvim"
  use "machakann/vim-highlightedyank"
  use "RRethy/vim-illuminate"
  use {
    "m4xshen/hardtime.nvim",
    require= { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  }
  use {
    "folke/todo-comments.nvim", require = {
      "nvim-lua/plenary.nvim"
    }
  }
  use "xiyaowong/transparent.nvim"
-- end
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
end)
