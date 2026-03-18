-- NOTE: VISUAL move & ident
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- NOTE: NORMAL join lines
vim.keymap.set("n", "J", "mzJ`z")
-- NOTE: NORMAL up-down navigation with focus
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- NOTE: NORMAL up-down search with focus & hl
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- NOTE: NORMAL yank end of line
vim.keymap.set("n", "Y", "y$")

-- NOTE: VISUAL replace selected and move to buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- NOTE: NORMAL&VISUAL yank to + buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- NOTE: NORMAL&VISUAL delete and keep current buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- NOTE: NORMAL delete buffer
vim.keymap.set("n", "<C-q>", "<cmd>bd<CR>")

-- NOTE: NORMAL disable staff
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "v", "n" }, "<UP>", "<nop>")
vim.keymap.set({ "v", "n" }, "<DOWN>", "<nop>")
vim.keymap.set({ "v", "n" }, "<RIGHT>", "<nop>")
vim.keymap.set({ "v", "n" }, "<LEFT>", "<nop>")

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
vim.keymap.set('t', '<leader><esc>', '<C-\\><C-N>', { silent = true })
vim.keymap.set('t', '<leader><l>', '<C-\\><C-N><C-w>h', { silent = true })
vim.keymap.set('t', '<leader><j>', '<C-\\><C-N><C-w>j', { silent = true })
vim.keymap.set('t', '<leader><k>', '<C-\\><C-N><C-w>k', { silent = true })
vim.keymap.set('t', '<leader><h>', '<C-\\><C-N><C-w>l', { silent = true })


if vim.fn.has('linux') then
  vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
  vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
end

--fun
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>lf", "<cmd>CellularAutomaton game_of_life<CR>");
