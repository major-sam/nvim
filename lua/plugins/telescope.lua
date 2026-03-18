return {
  {
    'andrew-george/telescope-themes',
    config = function()
      require('telescope').load_extension('themes')
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
      "nvim-lua/plenary.nvim" }
  },
}
