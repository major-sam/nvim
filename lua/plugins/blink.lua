return {
  {
    'saghen/blink.compat',
    -- use v2.* for blink.cmp v1.*
    version = '2.*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = { debug = true },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'saghen/blink.lib',
      -- optional: provides snippets for the snippet source
      'onsails/lspkind.nvim',
      'rafamadriz/friendly-snippets',
      'Kaiser-Yang/blink-cmp-git',
      'Kaiser-Yang/blink-cmp-dictionary',
    },
    build = function()
      -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
      -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
      require('blink.cmp').build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- default
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },
      signature = { enabled = true },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        ghost_text = { enabled = true },
        list = { selection = { auto_insert = true } },
        menu = {
          draw = {
            padding = 0,
            columns = { { "kind_icon", gap = 1 }, { gap = 1, "label" }, { "kind", gap = 2 } },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbol_map[ctx.kind] or ""
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              }
            }
          }
        },
        documentation = { auto_show = true }
      },

      -- (Default) list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        -- add 'git' to the list
        default = { 'lsp', 'snippets', 'dictionary', 'buffer', 'git', 'path' },
        providers = {
          snippets = {
            opts = {
              friendly_snippets = true, -- default

              -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
              -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
              -- the following is just an example, you should only enable the frameworks that you use
              extended_filetypes = {
                markdown = { 'jekyll' },
                sh = { 'shelldoc' }
              }
            }
          },
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            enabled = true,
            --    enabled = function()
            --      return vim.tbl_contains({ 'octo', 'gitcommit', 'markdown' }, vim.bo.filetype)
            --    end,
            opts = {
              kind_icons = {
                openPR = '',
                openedPR = '',
                closedPR = '',
                mergedPR = '',
                draftPR = '',
                lockedPR = '',
                openIssue = '',
                openedIssue = '',
                reopenedIssue = '',
                completedIssue = '',
                closedIssue = '',
                not_plannedIssue = '',
                duplicateIssue = '',
                lockedIssue = '',
              },
              -- options for the blink-cmp-git
              commit = {
                -- You may want to customize when it should be enabled
                -- The default will enable this when `git` is found and `cwd` is in a git repository
                -- enable = function() end
                -- You may want to change the triggers
                -- triggers = { ':' },
              },
              git_centers = {
                github = {
                  -- Those below have the same fields with `commit`
                  -- Those features will be enabled when `git` and `gh` (or `curl`) are found and
                  -- remote contains `github.com`
                  -- issue = {
                  --     get_token = function() return '' end,
                  -- },
                  -- pull_request = {
                  --     get_token = function() return '' end,
                  -- },
                  -- mention = {
                  --     get_token = function() return '' end,
                  --     get_documentation = function(item)
                  --         local default = require('blink-cmp-git.default.github')
                  --             .mention.get_documentation(item)
                  --         default.get_token = function() return '' end
                  --         return default
                  --     end
                  -- }
                },
              },
            },
          },
          dictionary = {
            module = 'blink-cmp-dictionary',
            name = 'Dict',
            -- 💡 Performance impact of min_keyword_length:
            -- - In fallback mode: No impact on performance regardless of value
            -- - With fzf: Higher values may improve performance
            -- - With other commands (rg/grep): Higher values significantly improve performance
            min_keyword_length = 3,
            -- options for blink-cmp-dictionary
            opts = {
              -- put your dictionary files here
              -- dictionary_files = {}
            }
          }
        }
      },
      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"`
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "rust" }
    },
  }
}
