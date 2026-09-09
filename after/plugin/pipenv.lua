require('pipenv').setup({
  -- Output window options (`:Pipenv!`)
  output = {
    float = true, -- Set to `false` if you don't want a floating window
    split = 'right', -- right|left|above|below (only matters if `float` is `false`)
    border = 'single', -- none|single|double|rounded|solid|shadow (only matters if `float` is `true`)
    height = 0.85, -- A number between `0` and `1` (percentage) or a fixed height (only matters if `float` is `true`)
    width = 0.85, -- A number between `0` and `1` (percentage) or a fixed width (only matters if `float` is `true`)
    zindex = 100, -- The `zindex` value of the output window (only matters if `float` is `true`)
  },
  env = { -- See the `Pipenv Environment Variables` section
    -- install = {},
    -- virtual_env = {},
    -- file_location = {},
    -- security = {},
    -- behavior = {},
  },
  spinner = {
    enabled = true,
    -- See https://github.com/xieyonn/spinner.nvim for more info about these options
    opts = {
      hl_group = 'Special',
      kind = 'cursor',
      pattern = 'dots13',
      zindex = 100,
      -- attach = {},
      -- col = 0,
      -- fmt = function(event) return '' end,
      -- initial_delay_ms = 10,
      -- ns = 0,
      -- on_update_ui = function(event) end,
      -- placeholder = false,
      -- row = 0,
      -- ttl_ms = 100,
      -- ui_scope = 'Foo',
      -- winblend = 10,
    },
  },
})
