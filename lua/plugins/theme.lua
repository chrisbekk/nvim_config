-- Color scheme for LuaLine is harmonized with global theme in the OPTS table in the LuaLine config - set theme to same as global theme.
print("LOADING color theme and Lualine from theme.lua...")

local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end

-- =========== THEME INSTALLATION AND CONFIG ==================

return {
-- EVERFOREST THEME 
--    {
--	"https://github.com/sainnhe/everforest",
--	config = function()
--	    vim.cmd.colorscheme "everforest"
--	    enable_transparency()
--	end
--  },
    {
	'RostislavArts/naysayer.nvim',
	priority = 1000,
	lazy = false,
	config = function()
	    vim.cmd.colorscheme('naysayer')
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "naysayer"
	}
    }   
}
