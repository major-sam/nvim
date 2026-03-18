vim.filetype.add {
  filename = {
    ['compose.yml'] = 'yaml.docker-compose',
    ['docker-compose.yml'] = 'yaml.docker-compose',
    ['compose.yaml'] = 'yaml.docker-compose',
    ['docker-compose.yaml'] = 'yaml.docker-compose'
  },
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
  pattern = {
    ['[dD]ocker[fF]ile[-_].*'] = 'dockerfile',
    ['[jJ]enkins[fF]ile[-_].*'] = 'Jenkinsfile',
    ['main/.ya?ml'] = 'yaml.ansible',
    ["compose.*%.ya?ml"] = "yaml.docker-compose",
    ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
  },
}
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
  end,
})
