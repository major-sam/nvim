local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
vim.opt.runtimepath:append(parser_install_dir)

return{
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
}
