--[===[
mason <-> mason-lspconfig <-> nvim-lspconfig

nvim-lspconfig is the actual thing we want to configure for LSP, just mason makes it easier.
So we must install nvim-lspconfig for mason to be useful at all
--]===]


plugin = {
  "neovim/nvim-lspconfig",
}


return plugin
