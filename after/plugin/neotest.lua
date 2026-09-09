require("neotest").setup({
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    dir = "",
    expanded = "╮",
    failed = "",
    file = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    namespace = "",
    non_collapsible = "─",
    notify = "",
    passed = "",
    running = "",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "",
    test = "",
    unknown = "",
    watching = ""
  },
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
