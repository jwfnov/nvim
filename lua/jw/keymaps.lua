vim.g.mapleader = " "  -- set space as leader key

-- mimic <C-\> in VSC to open current file in a vertical split side-by-side
vim.api.nvim_set_keymap('n', '<leader>\\', ':vsplit<CR>', { noremap=true })  -- use <leader> to avoid delay
vim.api.nvim_set_keymap('n', '\\\\', '<C-w>c', { noremap=true })
