vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

vim.keymap.set("n", "<leader>P", function()
    vim.cmd.Git({'pull --rebase'})
end, opts)

-- NOTE: It allows me to easily set the branch i am pushing and any tracking
-- needed if i did not set the branch up correctly
-- git
vim.keymap.set("n", "<F5>", function()
    vim.cmd.Git("stage *")
    vim.cmd.Git("commit")
end)

vim.keymap.set("n", "<F6>", function()
    vim.cmd.Git('push --no-force-with-lease')
end)
vim.keymap.set("n", "<C-F6>", function()
    vim.cmd.Git('stage *')
    vim.cmd.Git('commit --amend --no-edit')
    vim.cmd.Git('push --force-with-lease')
end)

if vim.fn.has('linux') then
    vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
    vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
end
--local autocmd = vim.api.nvim_create_autocmd
--autocmd("BufWinEnter", {
--    group = ThePrimeagen_Fugitive,
--    pattern = "*",
--    callback = function()
--        if vim.bo.ft ~= "fugitive" then
--            return
--        end
--
--        local bufnr = vim.api.nvim_get_current_buf()
--        local opts = {buffer = bufnr, remap = false}
--
--        -- rebase always
--    end,
--})
