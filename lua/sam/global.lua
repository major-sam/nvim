vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.encoding = "utf-8"
vim.g.nobomb = true
vim.g.ls=2

vim.g.perl_host_prog  = 'c:/Strawberry/perl/bin/perl.exe'
vim.g.python_host_prog  = 'c:/Python27/python.exe'
vim.g.python3_host_prog  = 'c:/Python310/python.exe'
vim.g.ruby_host_prog = 'C:/tools/ruby26/bin/ruby.exe'
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- vim.g.WebDevIconsUnicodeDecorateFileNodesPatternSymbols={
--     ['.*[jJ]enkins[fF]ile[-_].*'] = '',
--     ['.*[jJ]enkins[fF]ile$'] = '',
--     ['.*[dD]ocker[fF]ile[-_].*'] = '' ,
--     ['.*[dD]ocker[fF]ile'] = '' ,
-- }
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail_improved'
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
vim.g.airline_powerline_fonts = 1
vim.g.fugitive_bitbucketservers_domains = {'https://bitbucket.baltbet.ru:8445'}

vim.cmd("set mouse=a")
