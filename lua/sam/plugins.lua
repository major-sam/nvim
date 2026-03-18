local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
vim.opt.runtimepath:append(parser_install_dir)

---@module 'snacks'
require("lazy").setup({
  "neovim/nvim-lspconfig",
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  "jeetsukumaran/vim-indentwise",
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = {
        enabled = true,
        replace_netrw = true
      },
      indent = { enabled = true },
      input = { enabled = true },
      image = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        enabled = true,
        sources = {
          explorer = {},
        }
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
      { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
      { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
      { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
      { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
      { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
      { "<F3>",            function() Snacks.explorer() end,                                       desc = "File Explorer" },
      -- find
      { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
      { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
      { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
      { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
      { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
      -- git
      { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
      { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
      { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
      { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
      { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
      { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
      { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
      -- gh
      { "<leader>gi",      function() Snacks.picker.gh_issue() end,                                desc = "GitHub Issues (open)" },
      { "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end,               desc = "GitHub Issues (all)" },
      { "<leader>gp",      function() Snacks.picker.gh_pr() end,                                   desc = "GitHub Pull Requests (open)" },
      { "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end,                  desc = "GitHub Pull Requests (all)" },
      -- Grep
      { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
      { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
      { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
      { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",   mode = { "n", "x" } },
      -- search
      { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
      { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
      { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
      { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
      { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
      { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
      { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
      { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
      { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
      { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
      { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
      { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
      { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
      { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
      { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
      { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
      { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
      { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
      { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
      { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
      { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
      -- LSP
      { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
      { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
      { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                       desc = "References" },
      { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
      { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
      { "gai",             function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
      { "gao",             function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
      { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
      { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
      -- Other
      { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
      { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
      { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
      { "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
      { "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
      { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
      { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
      { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",                 mode = { "n", "v" } },
      { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
      { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
      { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
      { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
      { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",             mode = { "n", "t" } },
      { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",             mode = { "n", "t" } },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      }
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end

          -- Override print to use snacks for `:=` command
          if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...)
              dd(...)
            end
          else
            vim.print = _G.dd
          end

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
            "<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },
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
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
      "nvim-lua/plenary.nvim" }
  },
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {},
    dependencies = {
      "towolf/vim-helm"
    }
  },
  {
    'nvim-tree/nvim-web-devicons',
    priority = 1000,
    config = function()
      require 'nvim-web-devicons'.setup {
        default = true,
        strict = true,
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
  {
    "folke/twilight.nvim",
    opts = {}
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
    branch = 'main',
    lazy = false,
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup {
        parser_install_dir = parser_install_dir,
        install_dir = parser_install_dir,
      }
      treesitter.install { 'java', 'c', 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'yaml', 'helm' }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'java', 'c', 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'yaml', 'helm' },
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- folds, provided by Neovim (I don't like folds)
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end

  },
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
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  'sindrets/diffview.nvim',
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
  -- LSP Support
  "neovim/nvim-lspconfig",
  {
    "Kurren123/mssql.nvim",
    opts = {
      -- optional
      keymap_prefix = "<leader>m"
    },
    -- optional
    dependencies = { "folke/which-key.nvim" }
  },
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
      { "<leader>on", "viw<cmd>ObsidianLinkNew<CR>", mode = 'n', desc = "Create new Obsidian link" },
      { "<leader>on", "<cmd>ObsidianLinkNew<CR>",    mode = 'v', desc = "Create new Obsidian link" },
    },
  },
})
