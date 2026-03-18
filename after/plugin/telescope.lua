-- local fb_actions = require "telescope._extensions.file_browser.actions"
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<c-d>"] = actions.delete_buffer,
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
      n = {
        ["<c-d>"] = actions.delete_buffer,
        ["dd"] = actions.delete_buffer,
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<leader>sq"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
}

-- require("telescope").load_extension("file_browser")
require("telescope").load_extension("yaml_schema")
require('telescope').load_extension('nerdy')
require('telescope').load_extension('themes')

vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
