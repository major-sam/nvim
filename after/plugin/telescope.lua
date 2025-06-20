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
  --extensions = {
  --  file_browser = {
  --    theme = "ivy",
  --    grouped = true,
  --    initial_mode = "normal",
  --    -- disables netrw and use telescope-file-browser in its place
  --    hijack_netrw = true,
  --    display_stat = { date = true, size = true, mode = false },
  --    collapse_dirs = true,
  --    git_status = true,
  --    add_dirs = true,
  --    depth = 2,
  --    auto_depth = 3,
  --    use_fd = true,
  --    mappings = {
  --      ["i"] = {
  --        ["C-."] = fb_actions.change_cwd,
  --      },
  --      ["n"] = {
  --        ["."] = fb_actions.change_cwd,
  --      },
  --    },
  --  },
  --}
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
-- vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
-- vim.keymap.set("n", "<F3>", ":Telescope file_browser<CR>")

vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  { desc = "Open harpoon window" })
