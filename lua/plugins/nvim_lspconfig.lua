--[===[
mason <-> mason-lspconfig <-> nvim-lspconfig

nvim-lspconfig is the actual thing we want to configure for LSP, just mason makes it easier.
So we must install nvim-lspconfig for mason to be useful at all
--]===]


plugin = {
  "neovim/nvim-lspconfig",

  --- setup the nvim-lspconfig here otherwise they will not be working showing any messages 
  config = function() 
    --=== set up each lsp server in nvim lspconfig
    local nvim_lspconfig = require("lspconfig")

    nvim_lspconfig.pylsp.setup({})  -- goto definitons/references
    nvim_lspconfig.pyright.setup({})  -- import not resolved/pep standard
  end,
}


return plugin
