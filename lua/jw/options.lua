local o = vim.opt


-- line no
o.number = true
o.relativenumber = true


--Set Indentation for Lua Files
vim.api.nvim_create_autocmd(
	"FileType", 
	{
		pattern = "lua",
		callback = function()
			vim.opt_local.tabstop = 2
			vim.opt_local.shiftwidth = 2
			vim.opt_local.expandtab = true
		end,
	}
)
