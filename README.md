# Folder Structure
    - /.gitignore
    - /README.md
    - /init.lua
    - /lua/
        - jw/
            - options.lua
            - keymaps.lua
        - plugins/
            - lazy.lua
            - colortheme.lua
            - fileexplorer.lua


# Rules of Keeping Folder Structure Clean
- there is only one init.lua throughout the whole tree
- init.lua is only doing 'require()' (as in importing other .lua files)
- each plugin to be installed/setup by lazy.nvim, must have its own .lua file under /lua/plugins/
    - NOTE: lazy.nvim is itself a plugin so it has its own file too i.e. /lua/plugins/lazy.lua
    - we follow the "structured setup" instead of "single file setup" on official github https://lazy.folke.io/installation
- /lua/jw/ folder contains all user-specific config e.g. keymaps.lua/options.lua

