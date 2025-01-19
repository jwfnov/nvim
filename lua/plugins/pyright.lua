--[===[
pyright is installed by mason, but why is it having its own pyright.lua file? Becoz...
ISSUE: 
  I got the "import not resolved" error from pyright just becoz it doesn't know my venv to find the relevant packages.
SOLUTION:
  find the venv path in cwd and tell pyright, inside the nvim-lspconfig setup
--]===]


--===Define a function that this lua file will return
local function func_setup_pyright(lspconfig)

  local util = require('lspconfig.util')

  -- Function to find the virtual environment
  local function find_venv()
    local venv = util.path.join(vim.fn.getcwd(), '.venv')
    if util.path.exists(venv) then
      return venv
    end
    return nil
  end

  -- Function to set the virtual environment for pyright
  local function set_venv()
    local venv = find_venv()
    if venv then
      print("pyright detected .venv folder: " .. venv)
      local python_path = util.path.join(venv, 'Scripts', 'python.exe')  -- Windows
      -- local python_path = util.path.join(venv, 'bin', 'python')  -- macOS/Linux

      -- Update pyright configuration
      lspconfig.pyright.setup({
        settings = {
          python = {
            pythonPath = python_path,
          },
        },
      })

      -- Restart the LSP client to apply the new configuration
      vim.lsp.stop_client(vim.lsp.get_active_clients({ name = 'pyright' }))
      vim.lsp.start_client(lspconfig.pyright.setup({}))
      print("pyright is now using the virtual environment at: " .. python_path)
    else
      print("No .venv folder found in the current directory.")
    end
  end

  ---[===[
  -- Configure pyright initially
  lspconfig.pyright.setup({
    on_new_config = function(new_config, _)
      local venv = find_venv()
      if venv then
        print("pyright detected .venv folder: " .. venv)
        new_config.settings = new_config.settings or {}
        new_config.settings.python = new_config.settings.python or {}
        new_config.settings.python.pythonPath = util.path.join(venv, 'Scripts', 'python.exe')  -- Windows
        -- new_config.settings.python.pythonPath = util.path.join(venv, 'bin', 'python')  -- macOS/Linux
      end
    end,
  })
  --]===]

  -- Export functions
  return {
    set_venv = set_venv,
  }
end

return func_setup_pyright
