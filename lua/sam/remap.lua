vim.keymap.set("n", "<leader>pv", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<F3>", vim.cmd.NERDTreeToggle)

vim.keymap.set("n", "<F2>", vim.cmd.TaskList)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Y", "y$")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-q>", "<cmd>bd<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "v", "n"} , "<UP>", "<nop>")
vim.keymap.set({ "v", "n"} , "<DOWN>", "<nop>")
vim.keymap.set({ "v", "n"} , "<RIGHT>", "<nop>")
vim.keymap.set({ "v", "n"} , "<LEFT>", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- You can split the window in Vim by typing :split or :vsplit.
--" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")

--" Resize split windows using arrow keys by pressing:
--" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
vim.keymap.set("n", "<c-up>", "<c-w>+")
vim.keymap.set("n", "<c-down>", "<c-w>-")
vim.keymap.set("n", "<c-left>", "<c-w>>")
vim.keymap.set("n", "<c-right>", "<c-w><")

-- terminal mode quick switch
vim.keymap.set('t', '<leader><esc>', '<C-\\><C-N>', {silent = true})
vim.keymap.set('t', '<leader><l>',   '<C-\\><C-N><C-w>h', {silent = true})
vim.keymap.set('t', '<leader><j>',   '<C-\\><C-N><C-w>j', {silent = true})
vim.keymap.set('t', '<leader><k>',   '<C-\\><C-N><C-w>k', {silent = true})
vim.keymap.set('t', '<leader><h>',   '<C-\\><C-N><C-w>l', {silent = true})
-- git
vim.keymap.set("n", "<F5>", function()
    vim.cmd("G stage *")
    vim.cmd("G commit ")
end)

vim.keymap.set("n", "<F6>", function()
    vim.cmd("G push")
end)
vim.keymap.set("n", "<C-F6>", function()
    vim.cmd("G stage *")
    vim.cmd("G commit --amend --no-edit")
    vim.cmd("G push  --force-with-lease")
end)


if vim.fn.has('linux') then
    vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
    vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
end
-- coc
vim.keymap.set('i', '<c-space>', function()
    vim.fn["coc#refresh"]()
  end,
  { noremap = true ,silent = true })

--fun
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>lf", "<cmd>CellularAutomaton game_of_life<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
