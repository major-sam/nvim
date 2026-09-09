return {
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
        menu = {
          draw = {
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
        default = { 'dictionary', 'buffer', 'git', 'lsp', 'path' },
        providers = {
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            opts = {
              -- options for the blink-cmp-git
              commit = {
                -- You may want to customize when it should be enabled
                -- The default will enable this when `git` is found and `cwd` is in a git repository
                -- enable = function() end
                -- You may want to change the triggers
                -- triggers = { ':' },
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
            min_keyword_length = 1,
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
