local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
autocmd({ "BufEnter" }, {
  pattern = { "*[jJ]enkins[fF]ile[-_]*" },
  command = "set syntax=Jenkinsfile",
})
--autocmd({ "BufEnter" }, {
--  pattern = { "*[dD]ocker[fF]ile[-_]*" },
--  command = "set filetype=dockerfile",
--})
