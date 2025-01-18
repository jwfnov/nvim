--[===[
Treesitter is a parer generator that reads the codes to construct a syntax tree so it's also a syntax tree geenrator. Based on syntax tree, it provides:
  - enhanced highligting (better than neotree)
  - code navigation like go to definition
--]===]


-- official github: If you want to pass options to the plugin, please use the config function:
plugin = 
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    -- alternatively you can chain require().setup() but it's cleaner assigning modules to local variables
    local install = require("nvim-treesitter.install")
    local configs = require("nvim-treesitter.configs")     
  
    -- ===setup the modules
    -- =setup the install module to use zig to compile the installation to get over windows error
    install.compilers = { 'zig' }

    -- =setup the configs module
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    configs.setup({
        ensure_installed = { "lua" },
        sync_install = false, 
        highlight = { enable = true },
        indent = { enable = true },  
        --additional_vim_regex_highlighting = { "markdown" },  -- optional
      })
  end
}

return plugin
