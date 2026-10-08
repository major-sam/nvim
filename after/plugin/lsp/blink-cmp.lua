local wk = require("which-key")
wk.add({
  mode = { "i" },
  { "<C-x>",      group = "Blink Completion" },
  -- Прописываем подсказки для вложенных команд
  { "<C-x><C-x>", desc = "Blink:Show Suggestions" },
  { "<C-x><C-h>", desc = "Blink:Hide Popup" },
  { "<C-x><C-y>", desc = "Blink:Accept Suggestion" },
  { "<C-x><C-f>", desc = "Blink:Scroll Docs Down" },
  { "<C-x><C-b>", desc = "Blink:Scroll Docs Up" },
})
