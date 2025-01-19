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
    
    --=pylsp
    nvim_lspconfig.pylsp.setup({})  -- goto definitons/references
    
    --=pyright
    local func_setup_pyright = require("plugins.pyright")
    --nvim_lspconfig.pyright.setup({})  -- import not resolved/pep standard
    func_setup_pyright(nvim_lspconfig)

    -- Add a keymap to trigger the .venv folder check and set it as the venv
    -- NOTE: the require must have the path corresponding to your choice of folder structure
    -- TRICK: require twice here, the 2nd one is passing lspconfig into the function so we can use the nested function "set_venv()" which is inside the table returned by func_setup_pyright() so we can call it
    vim.api.nvim_set_keymap('n', '<leader>venv', '<cmd>lua require("plugins.pyright")(require("lspconfig")).set_venv()<CR>', { noremap = true, silent = true, desc = "Set .venv for pyright" })

  end,
}


return plugin
