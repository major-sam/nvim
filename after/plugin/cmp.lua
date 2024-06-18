local cmp = require'cmp'

cmp.setup({
  snippet = {
    --  -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      --    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      --    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      --    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
      { name = 'buffer' },
    })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
      { name = 'buffer' },
    })
})

--require("cmp_git").setup({
--  -- defaults
--  filetypes = { "gitcommit", "octo" },
--  remotes = { "upstream", "origin" }, -- in order of most to least prioritized
--  enableRemoteUrlRewrites = false, -- enable git url rewrites, see https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf
--  git = {
--    commits = {
--      limit = 100,
--      sort_by = require("cmp_git.sort").git.commits,
--      format = require("cmp_git.format").git.commits,
--    },
--  },
--  github = { },
--  gitlab = {
--  },
--  trigger_actions = {
--    {
--      debug_name = "git_commits",
--      trigger_character = ":",
--      action = function(sources, trigger_char, callback, params, git_info)
--        return sources.git:get_commits(callback, params, trigger_char)
--      end,
--    },
--    {
--      debug_name = "gitlab_issues",
--      trigger_character = "#",
--      action = function(sources, trigger_char, callback, params, git_info)
--        return sources.gitlab:get_issues(callback, git_info, trigger_char)
--      end,
--    },
--    {
--      debug_name = "gitlab_mentions",
--      trigger_character = "@",
--      action = function(sources, trigger_char, callback, params, git_info)
--        return sources.gitlab:get_mentions(callback, git_info, trigger_char)
--      end,
--    },
--    {
--      debug_name = "gitlab_mrs",
--      trigger_character = "!",
--      action = function(sources, trigger_char, callback, params, git_info)
--        return sources.gitlab:get_merge_requests(callback, git_info, trigger_char)
--      end,
--    },
--    {
--      debug_name = "github_issues_and_pr",
--      trigger_character = "#",
--      action = function(sources, trigger_char, callback, params, git_info)
--        return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
--      end,
--    },
--    {
--      debug_name = "github_mentions",
--      trigger_character = "@",
--      action = function(sources, trigger_char, callback, params, git_info)
--        return sources.github:get_mentions(callback, git_info, trigger_char)
--      end,
--    },
--  },
--})
--
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  capabilities = capabilities
}
