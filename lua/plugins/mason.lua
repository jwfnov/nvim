--[===[
mason is a package manager but unlike lazy.nvim being a general package manager.
mason is specific for install/manage LSP servers, DAP servers, linters, formatters.
  - LSP: 
  - DAP: debugger
  - Linter: checks your code grammar, notify you but doesn't fix for you
  - formatter: checks your code formatting e.g. pep8, and tries to fix for up like upon saving
--]===]



plugin = {
  'williamboman/mason.nvim',

  config = function()
    require("mason").setup()
  end,
}

return plugin
