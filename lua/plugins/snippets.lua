return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "honza/vim-snippets",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      mode = "i",
    },
    { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}