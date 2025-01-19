-- User Preferences Go First
require("jw.keymaps")
require("jw.options")

-- Setup lazy.nvim
require("plugins.lazy")

-- Use lazy to configure plugins
require("lazy").setup({
    require("plugins.fileexplorer"),
    require("plugins.fuzzyfinder"),
    require("plugins.whichkey"),
    require("plugins.treesitter"),
    require("plugins.colortheme"),
    require("plugins.mason"),  -- setup order 1)mason 2)mason-lspconfig 3)nvim-lspconfig
    require("plugins.mason_lspconfig"),  -- setup order 1)mason 2)mason-lspconfig 3)nvim-lspconfig
    require("plugins.nvim_lspconfig"),  -- setup order 1)mason 2)mason-lspconfig 3)nvim-lspconfig
})


