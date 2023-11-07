vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.shell = pwsh
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true

vim.opt.guifont = "Space_Mono_Nerd_Font:h11"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.encoding = "utf-8"
vim.g.nobomb = true
vim.g.ls=2
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = 'cp -r'

vim.g.python_host_prog  = 'c:/Python27/python.exe'
vim.g.python3_host_prog  = 'c:/Python312/python.exe'
vim.g.ruby_host_prog = 'C:/tools/ruby26/bin/ruby.exe'

vim.g.WebDevIconsUnicodeDecorateFileNodesPatternSymbols={
    ['.*[jJ]enkins[fF]ile.*'] = '',
}

vim.g.loaded_node_provider = 0
vim.opt.list = true
vim.opt.listchars = {
    tab='│·',
    space='·',
    nbsp='·',
    trail="~",
    extends='›',
    precedes='‹'
}

if vim.fn.has("win32") == 1 then
    vim.opt.mouse:append('a')
    vim.opt.shell = pwsh
else
   vim.opt.mouse = vim.opt.mouse - 'a'
end
