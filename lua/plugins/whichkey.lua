-- After installing :Neotree and :Telescope, the keymaps are growing so we need fokle/which-key.nvim to remind us the keymaps
-- https://github.com/folke/which-key.nvim
-- after installting, run :checkhealth which-key
-- To use: press <ESC><space> to toogle menu up, q or <ESC> to toogle menu down

plugin = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

return plugin
