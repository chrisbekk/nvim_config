local active_theme = "naysayer";

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.opt.termguicolors = true

      local function hl(name)
        local ok, value = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
        return ok and value or {}
      end

      local normal = hl("Normal")
      local tabline = hl("TabLine")
      local tabline_sel = hl("TabLineSel")
      local tabline_fill = hl("TabLineFill")
      local comment = hl("Comment")
      local error_hl = hl("DiagnosticError")
      local warn_hl = hl("DiagnosticWarn")
      local info_hl = hl("DiagnosticInfo")
      local hint_hl = hl("DiagnosticHint")

      local normal_bg = normal.bg
      local normal_fg = normal.fg
      local inactive_bg = tabline.bg or normal_bg
      local inactive_fg = comment.fg or tabline.fg or normal_fg
      local selected_bg = tabline_sel.bg or normal_bg
      local selected_fg = tabline_sel.fg or normal_fg
      local fill_bg = tabline_fill.bg or inactive_bg

      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          always_show_bufferline = true,
          show_close_icon = false,
          show_buffer_close_icons = false,
        },
        highlights = {
          fill = {
            bg = fill_bg,
          },
          background = {
            fg = inactive_fg,
            bg = inactive_bg,
          },
          buffer_selected = {
            fg = selected_fg,
            bg = selected_bg,
            bold = true,
          },
          separator = {
            fg = fill_bg,
            bg = inactive_bg,
          },
          separator_selected = {
            fg = fill_bg,
            bg = selected_bg,
          },
          diagnostic = {
            fg = inactive_fg,
            bg = inactive_bg,
          },
          diagnostic_selected = {
            fg = selected_fg,
            bg = selected_bg,
            bold = true,
          },
          error = {
            fg = error_hl.fg or inactive_fg,
            bg = inactive_bg,
          },
          error_selected = {
            fg = error_hl.fg or selected_fg,
            bg = selected_bg,
            bold = true,
          },
          warning = {
            fg = warn_hl.fg or inactive_fg,
            bg = inactive_bg,
          },
          warning_selected = {
            fg = warn_hl.fg or selected_fg,
            bg = selected_bg,
            bold = true,
          },
          info = {
            fg = info_hl.fg or inactive_fg,
            bg = inactive_bg,
          },
          info_selected = {
            fg = info_hl.fg or selected_fg,
            bg = selected_bg,
            bold = true,
          },
          hint = {
            fg = hint_hl.fg or inactive_fg,
            bg = inactive_bg,
          },
          hint_selected = {
            fg = hint_hl.fg or selected_fg,
            bg = selected_bg,
            bold = true,
          },
        },
      })

      vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true, desc = "Previous buffer" })
      vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
    end,
  },
}
