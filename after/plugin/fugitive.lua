vim.keymap.set("n", "<leader>gs", vim.cmd.Git)


vim.keymap.set("n", "<leader>P", function()
    vim.cmd.Git({'pull --rebase'})
end)

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
