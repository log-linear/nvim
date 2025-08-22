-- R.nvim options
vim.g.R_fun_data_1 = {
  "select",
  "rename",
  "mutate",
  "filter",
  "group_by",
  "pivot_longer",
  "pivot_wider",
  "unnest_longer",
  "unnest_wider",
  "hoist",
  "separate_wider_delim",
  "complete",
  "drop_na",
  "fill",
}
vim.g.R_fun_data_2 = {
  mutate = { "*" },
  rename = { "*" },
  filter = { "*" },
  group_by = { "*" },
  ggplot = { "aes" },
  with = { "*" },
  summarize = { "*" },
  summarise = { "*" },
  hoist = { "*" },
  separate_wider_delim = { "*" },
  complete = { "*" },
  drop_na = { "*" },
  fill = { "*" },
}

--- Functions to allow scrolling through blink menu
---@param cb fun(cmp: blink.cmp.API)
---@return fun(cmp: blink.cmp.API): boolean
local function wrap_scroll_page(cb)
  return function(cmp)
    if cmp.is_menu_visible() then
      vim.schedule(cb)
      return true
    else
      return false
    end
  end
end

local function scroll_page_up()
  local list = require("blink.cmp.completion.list")
  if #list.items == 0 or list.context == nil then
    return
  elseif list.selected_item_idx == nil then
    return list.select(#list.items)
  else
    local page_size = require("blink.cmp.completion.windows.menu").win:get_height()
    return list.select(math.max(list.selected_item_idx - page_size, 1))
  end
end

local function scroll_page_down()
  local list = require("blink.cmp.completion.list")
  if #list.items == 0 or list.context == nil then
    return
  elseif list.selected_item_idx == nil then
    return list.select(#list.items)
  else
    local page_size = require("blink.cmp.completion.windows.menu").win:get_height()
    return list.select(math.min(list.selected_item_idx + page_size, #list.items))
  end
end

return {
  ----------------------------- Auto-completion --------------------------------
  {
    "saghen/blink.cmp",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    version = "*",
    dependencies = {
      "rcarriga/cmp-dap",
      "R-nvim/cmp-r",
      "kristijanhusak/vim-dadbod-completion",
    },
    event = "InsertEnter",
    opts = {
      appearance = {
        -- sets the fallback highlight groups to nvim-cmp"s highlight groups
        -- useful for when your theme doesn"t support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
        -- set to "mono" for "Nerd Font Mono" or "normal" for "Nerd Font"
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        }
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          dap = {
            name = "dap",
            module = "blink.compat.source",
            enabled = function() return require("cmp_dap").is_dap_buffer() end,
          },
          cmp_r = {
            name = "cmp_r",
            module = "blink.compat.source"
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink"
          },
        }
      },

      keymap = {
        ["<C-y>"] = { "select_and_accept" },
        ["<PageUp>"] = { wrap_scroll_page(scroll_page_up), "fallback" },
        ["<PageDown>"] = { wrap_scroll_page(scroll_page_down), "fallback" },
        ["<C-u>"] = { wrap_scroll_page(scroll_page_up), "fallback" },
        ["<C-d>"] = { wrap_scroll_page(scroll_page_down), "fallback" },
      },
    }
  },
  {
    "saghen/blink.compat",
    version = not vim.g.lazyvim_blink_main and "*",
    lazy = true,
    opts = {}
  },

  ---------------------------- Snippet collection ------------------------------
  { "rafamadriz/friendly-snippets", },
}
