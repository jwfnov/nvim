-- return a setup() which is a wrapper of doing a number of setups e.g. cmd/settings/keymaps
-- lspconfig config() function can calls this wrapper in one line for cleaner folder structure

M = {}

function M.setup()
  local lspconfig = require("lspconfig")  -- to be called within nvim_lspconfig.lua which has access to require("lspconfig") 

  lspconfig.pyright.setup({
    cmd = {
      "C:\\tools\\nvm\\nodejs\\pyright-langserver.cmd", 
      "--stdio"
    },

    settings = {
      python = {
        -- default python path if not overriden by any .venv
   --     pythonPath = "C:\\Users\\oven\\miniconda3\\envs\\py313\\python.exe",  -- setting this would cause import not resolved for packages not installed in this python env
      },
    },
  
    -- on_attach event is fired only when you open a py file in the buffer
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keybindings
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({async=true}) end, opts)
        vim.keymap.set('n', '<leader>vg', "<cmd>lua require('jw.pyright_util').get_pyright_pythonPath()<CR>", opts)
        vim.keymap.set('n', '<leader>vs', "<cmd>lua require('jw.pyright_util').set_pyright_pythonPath_to_local_venv()<CR>", opts)
        vim.keymap.set('n', '<leader>vr', "<cmd>lua require('jw.pyright_util').reset_pyright_pythonPath_to_global_env()<CR>", opts)
        vim.keymap.set('n', '<F5>', "<cmd>lua require('jw.pyright_util').run_python_file()<CR>", opts)
    end,

  })
end

return M
