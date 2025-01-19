--[==[
https://github.com/williamboman/mason-lspconfig.nvim

mason-lspconfig.nvim closes the gaps between mason.nvim and lspconfig by:
  - register a setup hook with lspconfig to ensure lsp servers installed are set up properly
  - provide handy API e.g. :LspInstall
  - auto install/setup a list of lsp servers e.g. python/c++/more
  - translate between lspconfig 'server names' VS mason.nvim 'package names'
--]==]


plugin = {
  "williamboman/mason-lspconfig.nvim",

  -- important to set up the plugins in the following order:
  -- mason.nvim (done via mason.lua)
  -- mason-lspconfig.nvim (done via current file)
  -- setup servers via lspconfig (done via nvim_lspconfig file)
  config = function()

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
        -- alternatively you can use :Mason to install lsp/dap/linter/formatter
        ensure_installed = 
        { 
          "pylsp",  -- lsp that offers go-to-definition/go-to-references/variables-not-used/etc
          "pyright",  -- Formatter: Pyright is a full-featured, PEP-standards-based static type checker for Python
        },
    })

  end,
}


return plugin

