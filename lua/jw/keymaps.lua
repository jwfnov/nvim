vim.g.mapleader = " "  -- set space as leader key

-- mimic <C-\> in VSC to open current file in a vertical split side-by-side
vim.api.nvim_set_keymap('n', '<leader>\\', ':vsplit<CR>', { noremap=true })  -- use <leader> to avoid delay
vim.api.nvim_set_keymap('n', '\\\\', '<C-w>c', { noremap=true })


-- quickly go to %LOCALAPPDATA%/nvim to edit the .lua files to configure neovim
vim.api.nvim_set_keymap('n', '<leader>cdnvim', ':cd C:/Users/oven/AppData/Local/nvim/<CR>', {  noremap=true })


-- windows shortcuts that i am soooo used to
vim.api.nvim_set_keymap({'n','i'}, '<C-s>', '<Esc>:w<CR>', { noremap=true })
