vim.g.mapleader = " "
if vim.fn.has('win32') then
  vim.g.NERDTreeCopyCmd = 'cp -r '
  vim.g.NERDTreeCopyDirCmd = 'cp -r '
  vim.g.NERDTreeRemoveDirCmd = 'rm -r '
end
vim.g.encoding = "utf-8"
vim.g.nobomb = true
vim.g.ls=2

vim.g.perl_host_prog  = 'c:/Strawberry/perl/bin/perl.exe'
vim.g.python_host_prog  = 'c:/Python27/python.exe'
vim.g.python3_host_prog  = 'c:/Python310/python.exe'
vim.g.ruby_host_prog = 'C:/tools/ruby26/bin/ruby.exe'
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.WebDevIconsUnicodeDecorateFileNodesPatternSymbols={
    ['.*[jJ]enkins[fF]ile[-_].*'] = '',
    ['.*[jJ]enkins[fF]ile$'] = '',
    ['.*[dD]ocker[fF]ile[-_].*'] = '' ,
    ['.*[dD]ocker[fF]ile'] = '' ,
}
vim.g.NERDTreePatternMatchHighlightColor = {
    ['.*[jJ]enkins[fF]ile[-_].*'] = "F5C06F",
    ['.*[jJ]enkins[fF]ile$'] = "F5C06F",
    ['.*[dD]ocker[fF]ile[-_].*'] = "689FB6",
    ['.*[dD]ocker[fF]ile$'] = "689FB6",
}
vim.g.NERDTreeExtensionHighlightColor = {
    ['MD'] = "F5C06F"
}
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1

vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '➤'
vim.g.nerdtree_vis_confirm_open = 0
vim.g.nerdtree_vis_confirm_delete = 1
vim.g.nerdtree_vis_confirm_copy = 0
vim.g.nerdtree_vis_confirm_move = 0
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail_improved'
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
vim.g.airline_powerline_fonts = 1
vim.g.WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
vim.g.WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

vim.cmd("set mouse=a")
