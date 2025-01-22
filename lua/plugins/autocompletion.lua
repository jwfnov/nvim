--[===[
nvim-cmp is for code auto-completion
--]===]


plugin = {
  "hrsh7th/nvim-cmp",
  
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP source
    "hrsh7th/cmp-buffer",  -- buffer source
    "hrsh7th/cmp-path",  -- path source
    "L3MON4D3/LuaSnip",  -- snippet engine
    "saadparwaiz1/cmp_luasnip",  -- snippet source
  },
  

  config = function()
    local cmp = require("cmp")

    -- Helper function for Tab and Shift+Tab mappings
    get_func = function(func, fallback)
      -- this function returns a function
      return function()
        if cmp.visible() then
          func()
        else
          fallback()
        end
      end
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),  -- scroll up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- scroll down
        ["<C-Space>"] = cmp.mapping.complete(),  -- open completion menu
        ["<C-e>"] = cmp.mapping.abort(),  -- close completion menu
        ["<CR>"] = cmp.mapping.confirm({ select=true }),

        ["<Tab>"] = cmp.mapping(
          get_func(
            cmp.select_next_item, 
            function()
              -- Replace <Tab> with a format Neovim can understand
              local keys = vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
              -- Simulate proessing the Tab key
              vim.api.nvim_feedkeys(keys, "n", true)
            end
          ),
          {'i', 's'}
        ),
        ["<S-Tab>"] = cmp.mapping(
          get_func(
            cmp.select_prev_item, 
            function()
              -- Replace <S-Tab> with a format Neovim can understand
              local keys = vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
              -- Simulate proessing the Shift+Tab key
              vim.api.nvim_feedkeys(keys, "n", true)
            end
          ),
          {'i', 's'}
        ),

      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })

  end,
}


return plugin
