-- many colorthemes out there, i choose to use catppuccin
-- even with treesitter installing markdown parse, .md files got almost no hightlighting, but after installing cappucin it got the colors

plugin = {
  "catppuccin/nvim", 
  name = "catppuccin", 
  lazy = false,  -- always load it coz it's always used
  priority = 1000,
  config = function()
    --[===[
    --There is no need to call setup if you don't want to change the default options and settings.
    --]===]
    require("catppuccin").setup(
      {
        flavour = "auto",  -- auto(mocha), latte(light), frappe(dark), macchiato(darker), mocha(darkest)
      }
    )

    -- === setting vim colorscheme must be with the config function
    -- setup must be called before loading i.e. before returning to lazy setup. NOTE: colorscheme = "catppuccin" d oes NOT work, which can be verified by :colorscheme being not changed as 'default'hin the config function
    vim.cmd.colorscheme("catppuccin")
  end,
}


return plugin
