vim.g.mapleader = " "  -- set space as leader key

-- mimic <C-\> in VSC to open current file in a vertical split side-by-side
vim.api.nvim_set_keymap('n', '<leader>\\', ':vsplit<CR>', { noremap=true })  -- use <leader> to avoid delay
vim.api.nvim_set_keymap('n', '\\\\', '<C-w>c', { noremap=true })


--=== cd specific - to changee directory. All start with <leader>cd
-- quickly go to %LOCALAPPDATA%/nvim to edit the .lua files to configure neovim
vim.api.nvim_set_keymap('n', '<leader>cdnvim', ':cd C:/Users/oven/AppData/Local/nvim/<CR>', {  noremap=true })


--=== LSP specific
local lsp_options = { noremap=true, silent=true }
--= all work in normal mode
vim.api.nvim_set_keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<CR>', lsp_options) 
--vim.api.nvim_set_keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', lsp_options) 


--[===[
vim.keymap.set() is a wrapper of vim.api.nvim_set_keymap() and vim.api.nvim_buf_set_keymap().
It allows multi-mode and also default option is noremap=true that can be overriden by remap=true
--]===]
-- windows shortcuts that i am soooo used to
vim.keymap.set({"n","i"}, '<C-s>', '<Esc>:w<CR>')
