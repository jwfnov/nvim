-- Setup lazy.nvim
require("plugins.lazy")

-- Use lazy to configure plugins
require("lazy").setup({
    require("plugins.fileexplorer")
})