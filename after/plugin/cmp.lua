local cmp = require('cmp')
local format = require("cmp_git.format")
local sort = require("cmp_git.sort")

cmp.setup({
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = "git" },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup({
  -- defaults
  filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
  remotes = { "upstream", "origin" },   -- in order of most to least prioritized
  enableRemoteUrlRewrites = false,      -- enable git url rewrites, see https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf
  git = {
    commits = {
      limit = 100,
      sort_by = sort.git.commits,
      format = format.git.commits,
      sha_length = 7,
    },
  },
})
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})
