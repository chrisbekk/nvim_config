print("LOADING keybinds.lua...")

vim.g.mapleader = " "
local keymap = vim.keymap.set

-- Explorer
keymap("n", "<leader>e", "<cmd>Lexplore<CR>", { silent = true, desc = "Open explorer" })

-- Insert mode
keymap("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Terminal
keymap("n", "<leader>t", "<cmd>botright split | terminal<CR>", { silent = true, desc = "Open terminal" })
keymap("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })
keymap("t", "<leader>q", [[<C-\><C-n><cmd>bd!<CR>]], { silent = true, desc = "Close terminal" })

-- Close current buffer
keymap("n", "<leader>q", "<cmd>bd!<CR>", { silent = true, desc = "Close buffer" })

-- Navigate buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

-- Window navigation in normal mode-
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- - Window navigation in terminal mode
keymap("t", "<C-h>", [[<C-\><C-n><cmd>wincmd h<CR>]], { silent = true, desc = "Move left from terminal" })
keymap("t", "<C-j>", [[<C-\><C-n><cmd>wincmd j<CR>]], { silent = true, desc = "Move down from terminal" })
keymap("t", "<C-k>", [[<C-\><C-n><cmd>wincmd k<CR>]], { silent = true, desc = "Move up from terminal" })
keymap("t", "<C-l>", [[<C-\><C-n><cmd>wincmd l<CR>]], { silent = true, desc = "Move right from terminal" })

-- Netrw-specific mappings-
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function(args)
    local opts = { buffer = args.buf, noremap = true, silent = true }

    vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
    vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
    vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
    vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
  end,
})

-- - LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})
