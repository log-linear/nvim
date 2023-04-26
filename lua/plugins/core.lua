return {
  -------------------------------- Plugin manager ------------------------------
  { "folke/lazy.nvim",      version = "*", },

  ------------------------------- Package manager ------------------------------
  {
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    config = function() require("mason").setup() end
  },

  ---------------------- lua plugin dependency/library -------------------------
  { "nvim-lua/plenary.nvim" },
}
