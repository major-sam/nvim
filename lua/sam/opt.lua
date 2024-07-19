-- vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.smartindent = true
vim.opt.cmdheight = 1
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
print(vim.loop.os_uname().sysname)
if vim.loop.os_uname().sysname == 'Windows_NT' then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
else
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
  vim.opt.shell = os.getenv('SHELL')
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

vim.opt.conceallevel = 2
vim.opt.list = true

vim.opt.listchars = {
    tab='| ',
    space=' ',
    nbsp='·',
    trail="~",
    extends='›',
    precedes='‹'
}

