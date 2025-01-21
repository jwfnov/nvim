--[===[
mason <-> mason-lspconfig <-> nvim-lspconfig

nvim-lspconfig is the actual thing we want to configure for LSP, just mason makes it easier.
So we must install nvim-lspconfig for mason to be useful at all
--]===]


plugin = {
  "neovim/nvim-lspconfig",  -- this tells lazy.nvim to install upon require()

  --- setup the nvim-lspconfig here otherwise they will not be working showing any messages 
  config = function() 
    require("jw.pyright_config").setup()
  end,
}

return plugin
