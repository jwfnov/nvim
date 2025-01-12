plugin = 
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
	cmd = 'Neotree',  -- ensure neotrim plugin is loaded properly before any key mappings is used. But note: Some plugin do not need this line e.g. telescope can directly use the :Telescope command in the keys table. So Whether this line is needed depends on how plugin handles the lazy loading.
	-- after adding the "keys" section, neovim would only lazy-load the command :Neotree and the mapped key wouldn't trigger the load. So it becomes neccessary to add the "cmd='Neotree' before keys section.
	keys = {
		{
			'\\', ':Neotree<CR>',
			desc = 'Open Noetree',
			silent = true,
		},
		{
			'<C-\\>', ':Neotree reveal<CR>',
			desc = 'Open Noetree reveal current file',
			silent = true,
		},
	},
	--while 'keys' is for whole neovim, opts mappings is for neotree only
	opts = {
		filesystem = {
			window = {
				mappings = {
					['\\'] = 'close_window',
				},
			},
		},
	},
    }

return plugin
