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

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luanip").lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),  -- scroll up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- scroll down
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(-4),
        ["<CR>"] = cmp.mapping.confirm({ select=true }),
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
