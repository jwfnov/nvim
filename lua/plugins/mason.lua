--[===[
mason is a package manager but unlike lazy.nvim being a general package manager.
mason is specific for install/manage LSP servers, DAP servers, linters, formatters.
DAP is debugger; Linter checks your code grammar, formatter checks the code formatting e.g. pep8
--]===]



plugin = {
  'williamboman/mason.nvim',

  config = function()
    require("mason").setup()
  end,
}

return plugin
