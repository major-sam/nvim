local wk = require("which-key")
wk.add({
	{ "<leader>g", icon = "", group = "Git & Diff" }, -- git
	{
		"<F5>",
		function()
			local neogit = require("neogit")
			neogit.cli.add.args("-A").call()
			neogit.open({ "commit" })
		end,
		desc = "Neogit: Stage All & Commit",
	},
	{
		"<F6>",
		function()
			require("neogit").lib.git.push.push()
		end,
		desc = "Neogit: Push",
	},
	{
		"<C-F6>",
		function()
			local neogit = require("neogit")
			neogit.lib.git.stage.all()
			neogit.lib.git.commit.create({ arguments = { "--amend", "--no-edit" } })
			neogit.lib.git.push.push({ arguments = { "--force-with-lease" } })
		end,
		desc = "Neogit: Amend & Force Push",
	},
	{
		"<leader>gb",
		function()
			Snacks.picker.git_branches()
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gB",
		function()
			Snacks.gitbrowse()
		end,
		desc = "Git Browse",
		mode = { "n", "v" },
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>gL",
		function()
			Snacks.picker.git_log_line()
		end,
		desc = "Git Log Line",
	},
	{ "<leader>gg", "<cmd>Neogit<cr>", desc = "NeoGit" },
	{
		"<leader>gG",
		function()
			require("gitgraph").draw({}, { all = true, max_count = 5000 })
		end,
		desc = "GitGraph - Draw",
	},
	{
		"<leader>gs",
		function()
			Snacks.picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<leader>gS",
		function()
			Snacks.picker.git_stash()
		end,
		desc = "Git Stash",
	},
	{
		"<leader>gd",
		function()
			Snacks.picker.git_diff()
		end,
		desc = "Git Diff (Hunks)",
	},
	{
		"<leader>gf",
		function()
			Snacks.picker.git_log_file()
		end,
		desc = "Git Log File",
	}, -- gh
	{
		"<leader>gi",
		function()
			Snacks.picker.gh_issue()
		end,
		desc = "GitHub Issues (open)",
	},
	{
		"<leader>gI",
		function()
			Snacks.picker.gh_issue({ state = "all" })
		end,
		desc = "GitHub Issues (all)",
	},
	{
		"<leader>gp",
		function()
			Snacks.picker.gh_pr()
		end,
		desc = "GitHub Pull Requests (open)",
	},
	{
		"<leader>gP",
		function()
			Snacks.picker.gh_pr({ state = "all" })
		end,
		desc = "GitHub Pull Requests (all)",
	},
	{ "<leader>gdo", "<Cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
	{ "<leader>gdc", "<Cmd>DiffviewClose<CR>", desc = "Close Diffview" },
	{
		"<leader>gdf",
		"<Cmd>DiffviewFileHistory<CR>",
		desc = "Open Diffview history",
	},
	{ "<leader>gdt", "<Cmd>DiffviewToggleFiles<CR>", desc = "Open Toggle" },
})
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<F5>", function()
	vim.cmd.Git("stage *")
	vim.cmd.Git("commit")
end)

vim.keymap.set("n", "<F6>", function()
	vim.cmd.Git("push --no-force-with-lease")
end)
vim.keymap.set("n", "<C-F6>", function()
	vim.cmd.Git("stage *")
	vim.cmd.Git("commit --amend --no-edit")
	vim.cmd.Git("push --force-with-lease")
end)
