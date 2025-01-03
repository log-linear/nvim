-------------------------- Language-specific plugins ---------------------------
return {
  ------------------------------------ R ---------------------------------------

  {
    "R-nvim/R.nvim",
    ft = { "r", "rmd" },
    config = function ()
      local opts = {
        R_args = { "--quiet", "--no-save" },
        hook = {
          on_filetype = function ()
            vim.keymap.set("n", "<leader>tr", "<Plug>RStart", {})
            vim.keymap.set("n", "<leader>ro", "<Plug>ROBToggle", {})
            vim.keymap.set("n", "<leader>rv", "<Plug>RViewDFa", {})
          end,
        },
        user_maps_only = true,
        Rout_more_colors = false,
        esc_term = false,
        R_app = "radian",
        R_cmd = "R",
        csv_app = "terminal:vd",
      }
      require("r").setup(opts)
    end
  },

  --------------------------------- jupytext -----------------------------------

  {
      'goerz/jupytext.nvim',
      version = '0.2.0',
      opts = {},  -- see Options
  },
}
