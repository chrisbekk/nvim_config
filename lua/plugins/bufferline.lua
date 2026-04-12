return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.opt.termguicolors = true

      require("bufferline").setup({
        options = {
          mode = "buffers",

          -- minimal look
          separator_style = "none",
          show_close_icon = false,
          show_buffer_close_icons = false,

          -- no icons
          show_buffer_icons = false,
          get_element_icon = function()
            return nil
          end,

          -- buffer numbers
          numbers = "ordinal",

          truncate_names = false,
          tab_size = 18,

          -- subtle diagnostics
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and "E" or "W"
            return " " .. icon .. count
          end,

          offsets = {},
          always_show_bufferline = true,
        },

        highlights = {
          fill = {
            bg = "none",
          },

          background = {
            fg = "#666666",
            bg = "none",
          },

          buffer_selected = {
            fg = "#ffffff",
            bg = "none",
            bold = false,
            italic = false,
          },

          numbers = {
            fg = "#666666",
          },

          numbers_selected = {
            fg = "#ffffff",
          },

          separator = {
            fg = "none",
            bg = "none",
          },

          separator_selected = {
            fg = "none",
            bg = "none",
          },
        },
      })

      -- navigation
      vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", {
        silent = true,
        desc = "Previous buffer",
      })

      vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", {
        silent = true,
        desc = "Next buffer",
      })
    end,
  },
}
