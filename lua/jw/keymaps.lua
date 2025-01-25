vim.g.mapleader = " "  -- set space as leader key

-- mimic <C-\> in VSC to open current file in a vertical split side-by-side
vim.api.nvim_set_keymap('n', '<leader>\\', ':vsplit<CR>', { noremap=true })  -- use <leader> to avoid delay
vim.api.nvim_set_keymap('n', '\\\\', '<C-w>c', { noremap=true })


--=== cd specific - to changee directory. All start with <leader>cd
-- quickly go to %LOCALAPPDATA%/nvim to edit the .lua files to configure neovim
vim.api.nvim_set_keymap('n', '<leader>cdnvim', ':cd C:/Users/oven/AppData/Local/nvim/<CR>', {  noremap=true })


--=== Buffer Handling - all start with <leader>b 
-- bufnr('%') is the buffer number of current active buffer VS bufnr('#') is the last accessed buffer VS bufnr() is the one being edited
--vim.api.nvim_set_keymap('n', '<leader>bqa', [[:bufdo if !&modified && bufnr('%') != bufnr() | echo bufnr() | endif<CR>']], { noremap=true, desc='for each buffer: delete itself if not modified' })
vim.api.nvim_set_keymap('n', '<leader>bqa', "<cmd>lua require('jw.util').close_other_buffers()<CR>", { noremap=true, desc='for each buffer: delete itself if not modified' })
vim.api.nvim_set_keymap('n', '<leader>btn', ":tabnew %<CR>", { noremap=true, desc=":tabnew % - move current buffer to a new tab" })
vim.api.nvim_set_keymap('n', '<leader>bsa', ":bufdo vs |:bn<CR>", { noremap=true, desc="for each buffer: vsplit itself out, then bn to activate next buffer" })

--=== LSP specific
local lsp_options = { noremap=true, silent=true }
--= all work in normal mode
vim.api.nvim_set_keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<CR>', lsp_options) 
--vim.api.nvim_set_keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>', lsp_options) 
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', lsp_options) 


--=== Util functions
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua require("jw.util").reveal_cd_in_file_explorer()<CR>', { noremap=true })

--[===[
vim.keymap.set() is a wrapper of vim.api.nvim_set_keymap() and vim.api.nvim_buf_set_keymap().
It allows multi-mode and also default option is noremap=true that can be overriden by remap=true
--]===]
-- windows shortcuts that i am soooo used to
vim.keymap.set({"n","i"}, '<C-s>', '<Esc>:w<CR>')
