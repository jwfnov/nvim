-- plugins/fuzzyfinder.lua:
-- we use telescope as our fuzzy finder i.e. file/folder search 
-- Plugin Dependencies:
	-- Rquired:	
		-- plenary.nvim  -- lazy would install it
	-- Suggested:
		-- nvim-treesitter for finder/preview
-- External Dependecies:
	-- Suggested:
		-- ripgrep by downloading the prebuilt binary rg.exe for live_grep and grep_string and find_files
		-- githbu.com/sharkdp/fd, for extended capabilities like finder
-- After installation, run :cheakhealth telescope to see if things are set up properly
-- To use:
	-- :Telescope find_files


plugin = {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8', 
	--optionally branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },

	--cmd = 'Telescope',  -- telescope is smart enough to skip this line, unlike neotree lol where cmd='Neotree' is required for keys table to recognize the :Neotree command.
	-- there are different ways to define keymaps but i chose to use a key table in the plugin config coz i want plugin-specific keymaps to be defined within the corresponding plugin lua file.
	keys = {
		{'<leader>ff', ':Telescope find_files<CR>', desc='find files'},
		{'<leader>fg', ':Telescope live_grep<CR>', desc='live grep' },
		{'<leader>fb', ':Telescope buffers<CR>', desc='list buffers' },
		{'<leader>fn', ':Telescope help_tags<CR>', desc='help tags' },
	},
}

return plugin
