print("LOADING telescope.lua...")

return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
	    local builtin = require('telescope.builtin')
	    -- SEARCH FILE NAMES
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	    -- SEARCH KEYWORD IN FILES
	    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	    -- SEARCH CURRENT BUFFER
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	    -- 
	    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end
}
