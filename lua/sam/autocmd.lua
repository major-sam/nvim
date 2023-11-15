local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
autocmd({ "BufEnter" }, {
  pattern = { "*[jJ]enkins[fF]ile[-_]*" },
  callback = function()
    vim.cmd( "set syntax=Jenkinsfile")
    require("jenkinsfile_linter").validate()
  end
})
autocmd({ "BufEnter" }, {
  pattern = { "*[dD]ocker[fF]ile[-_]*" },
  command = "set filetype=dockerfile",
})
autocmd({ "BufWritePre" }, {
  pattern = { "*[jJ]enkins[fF]ile[-_]*" },
  callback = function()
    require("jenkinsfile_linter").validate()
  end
})
autocmd({ "BufEnter" }, {
  pattern = {
    "*/main.yaml",
    "*/main.yml"
  },
  callback = function()
    vim.cmd("set ft=yaml.ansible")
  end
})
