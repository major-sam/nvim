
vim.keymap.set("n", "<F10>", function()
  require("jenkinsfile_linter").validate()
end)
