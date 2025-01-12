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
	cmd = 'Neotree',  -- ensure neotrim plugin is loaded (so you can used :Neotree command) before any key mappings is used. Whether this line is needed depends on how plugin handles the lazy loading.
	-- after adding the "keys" section, neovim would only lazy-load the command :Neotree and the mapped key wouldn't trigger the load. So it becomes neccessary to add the "cmd='Neotree' before keys section.
	keys = {
		{
			'<leader>nn', ':Neotree<CR>',  -- using <leader>nn instead of <leader>n to hack the default timeoutlen of 1000ms so there wouldn't be a delay displaying the Neotree window
			desc = 'neo-tree->:Neotree',
			silent = true,
		},
		{
			'<leader>nr', ':Neotree reveal<CR>',
			desc = 'neo-tree->:Neotree reveal',
			silent = true,
		},
	},
	--while 'keys' is for whole neovim, opts mappings is for neotree only
	opts = {
		filesystem = {
			window = {
				mappings = {
					['<leader>n'] = 'close_window',
				},
			},
		},
	},
    }

return plugin
