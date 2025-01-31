-- return a lua table of util functions that can be used by pyright_config.lua


F = {}  -- F for util functions


function F.get_cwd_venv()
  -- return the the path of .venv folder in current working directory
  local cwd = vim.fn.getcwd()
  local uri_cwd_venv = cwd .. "\\.venv"
  if vim.fn.isdirectory(uri_cwd_venv) == 1 then
    return uri_cwd_venv .. "\\Scripts\\python.exe"
  else
    return nil
  end
end


function F.get_pyright_pythonPath()
  -- get the pythonPath of pyright and print it

  --local pyright_config = require("lspconfig").pyright.get_config()  -- get_config() is nil for my nvim-lspconfig version
  local python_path = require("lspconfig").pyright.manager.config.settings.python.pythonPath 
  if python_path == nil then
    print("pyright pythonPath not set yet")
    return nil
  end

  print("pyright pythonPath: " .. python_path)
  return python_path
end


function F.set_pyright_pythonPath(python_path)
  -- set the pythonPath of pyright
  require("lspconfig").pyright.manager.config.settings.python.pythonPath = python_path
  vim.cmd("LspRestart")  -- NOTE: must restart for newly set venv to be functional to avoid "import not resolved" warning
  print("pyright pythonPath set to: " .. python_path)
end


function F.set_pyright_pythonPath_to_local_venv()
  local_venv = F.get_cwd_venv()
  if local_venv == nil then
    print("no local venv found")
    return nil  --"no local venv found"  -- return nil would give pyright error exit code 1 signal 15?
  else
    F.set_pyright_pythonPath(local_venv)
  end
end


function F.reset_pyright_pythonPath_to_global_env()
  global_env = "C:\\Users\\oven\\miniconda3\\envs\\py313\\python.exe"
  F.set_pyright_pythonPath(global_env)
end


function F.run_python_file()
  -- bottomright split with term, and execute current py file with pyright_pythonPath arg  
  pyright_pythonPath = F.get_pyright_pythonPath()
  if pyright_pythonPath then
    local curr_py_file = vim.fn.expand("%:p")  -- get full path
    vim.cmd('botright vsplit | term ' .. pyright_pythonPath .. ' ' .. curr_py_file)
  end
end


return F
