vim.g.mapleader = " "
vim.opt.guicursor = ""
local os_name = ''
vim.opt.nu = true
vim.opt.relativenumber = true
if jit and jit.os then
    os_name = (jit.os):lower()
else
    os_name = (os.getenv('OS')):lower()
end
if string.match(os_name, 'win') then
    vim.opt.shell = powershell
elseif string.match(os_name, 'linux') then
    vim.opt.shell = '/bin/bash'
end
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
vim.opt.undofile = true
if vim.fn.has('win32') then
    vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
elseif vim.fn.has('linux') then
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
else
    vim.opt.undodir = os.getenv("TEMP") .. "/.vim/undodir"
end

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
    ['.*[dD]ocker[fF]ile.*'] = '' ,
}
vim.g.NERDTreeFileExtensionHighlightFullName = 0
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = ' '
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail_improved'
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
vim.g.airline_powerline_fonts = 1
vim.g.WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
vim.g.WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1


vim.opt.langmap = {
    "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
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
