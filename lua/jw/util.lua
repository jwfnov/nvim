M = {}

function M.reveal_cd_in_file_explorer()
  local cwd = vim.fn.getcwd()
  local windows_command = "explorer " .. vim.fn.shellescape(cwd)
  print(windows_command)
  vim.fn.system(windows_command)
end

return M
