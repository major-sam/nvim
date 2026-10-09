local wk = require("which-key")
wk.add({
	{ "<leader>o", icon = "📓", group = "Obsidian" },
	{ "<leader>on", "<cmd>ObsidianLinkNew<CR>", mode = "n", desc = "Create new Obsidian link" },
	{ "<leader>on", "<cmd>ObsidianLinkNew<CR>", mode = "v", desc = "Create new Obsidian link" },
})
