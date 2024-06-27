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
    [ '[dD]ocker[fF]ile[-_].*' ] = 'dockerfile',
    [ '[jJ]enkins[fF]ile[-_].*' ] = 'groovy',
    [ 'main/.ya?ml' ] = 'yaml.ansible'
  },
}
