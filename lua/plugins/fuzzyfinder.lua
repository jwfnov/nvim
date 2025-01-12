-- plugins/fuzzyfinder.lua:
-- we use telescope as our fuzzy finder i.e. file/folder search 
-- Plugin Dependencies:
	-- Rquired:	
		-- plenary.nvim  -- lazy would install it
	-- Suggested:
		-- nvim-treesitter for finder/preview
-- External Dependecies:
	-- Suggested:
		-- ripgrep by downloading the prebuilt binary rg.exe for find_files,live_grep and grep_string
		-- githbu.com/sharkdp/fd, for extended capabilities like finder
-- After installation, run :cheakhealth telescope to see if things are set up properly
-- To use:
	-- :Telescope find_files


plugin = {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8', 
	--optionally branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },

	--lazy=false,  -- this ensure telescope is loaded (so that you can use :Telescope command) even before any keymaps is used, i.e. avoid lazy loading
	cmd = 'Telescope',  -- either use this or lazy=false so that you can use :Telescope command before lazy-loading is triggerd upon any keymaps being used. Note this is not identical to lazy=false coz lazy=false really loads the plugin so you can use :checkheath telescope, but cmd='Telescope' only enables you to use :Telescope command.
	
	-- there are different ways to define keymaps but i chose to use a key table in the plugin config coz i want plugin-specific keymaps to be defined within the corresponding plugin lua file.
	keys = {
		-- keymaps suggeted by official github page
		{'<leader>ff', ':Telescope find_files<CR>', desc='Find files under cwd. Use :cd C:/ to change cwd.'},
		{'<leader>fg', ':Telescope live_grep<CR>', desc='live grep find string in cwd.' },
		{'<leader>fb', ':Telescope buffers<CR>', desc='list buffers' },
		{'<leader>f?', ':Telescope help_tags<CR>', desc='help tags' },  -- official suggets fh, but i make it f? to be consistent with neotree ? for commands. Also coz i need fh for find hidden files
		-- custom keymaps
		{'<leader>fh', ':Telescope find_files hidden=true<CR>', desc='Find files including hidden under cwd.'},
	},

}

return plugin
