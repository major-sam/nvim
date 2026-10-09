local wk = require("which-key")
wk.add({
	{ "<leader>T", icon = "󰗊", group = "Translate" },

	-- Translate
	{ "<leader>Tt", "<cmd>Translate<cr>", mode = { "n", "v" }, desc = "Translate" },
	{ "<leader>Tr", "<cmd>TranslateR<cr>", mode = { "n", "v" }, desc = "Replace text with Translate" },
	{ "<leader>Tw", "<cmd>TranslateW<cr>", mode = { "n", "v" }, desc = "Translate in window" },
})
