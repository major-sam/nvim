return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
          args = { "--capture=no" },
          pytest_discover_instances = true,
        },
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
      'nvim-telescope/telescope-dap.nvim',
      'mfussenegger/nvim-dap-python',
      'nvim-dap-virtual-text',
      'nvim-dap-ui',
    },
    config = function()
      local dap = require('dap')
      dap.listeners.after.event_initialized["dapui_config"] = function()
        require('dapui').open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        require('dapui').close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        require('dapui').close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ---@type MasonNvimDapSettings
    opts = {
      -- This line is essential to making automatic installation work
      -- :exploding-brain
      handlers = {},
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "bash",
        "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    -- Consider the mappings at
    -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
}
