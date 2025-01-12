-- User Preferences Go First
require("jw.keymaps")
require("jw.options")

-- Setup lazy.nvim
require("plugins.lazy")

-- Use lazy to configure plugins
require("lazy").setup({
    require("plugins.fileexplorer"),
    require("plugins.fuzzyfinder"),
})
