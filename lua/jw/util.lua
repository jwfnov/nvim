M = {}

function M.reveal_cd_in_file_explorer()
  local cwd = vim.fn.getcwd()
  local windows_command = "explorer " .. vim.fn.shellescape(cwd)
  print(windows_command)
  vim.fn.system(windows_command)
end


function M.close_other_buffers()
  -- close all buffers excpet current one. Close saved buffers only.
  local bufnr = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= bufnr then
      if not vim.bo[buf].modified then
        vim.api.nvim_buf_delete(buf, { force=false })
      end
    end
  end
end

return M
