print("LOADING treesitter.lua...")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({})

      ts.install({
        "lua",
        "vim",
        "vimdoc",
        "query",
        "c",
        "typescript",
        "tsx",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "lua",
          "vim",
          "c",
          "typescript",
          "typescriptreact",
          "tsx",
        },
        callback = function(args)
          vim.treesitter.start(args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
