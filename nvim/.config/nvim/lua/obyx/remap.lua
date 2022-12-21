vim.g.mapleader = " " -- set leader key

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted lines down

vim.keymap.set("v", "<", "<gv") -- outdent highlighted lines
vim.keymap.set("v", ">", ">gv") -- indent highlighted lines

vim.keymap.set("n", "J", "mzJ`z") -- keep cursor in the same place when joining lines

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor centered when moving down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor centered when moving up

vim.keymap.set("n", "n", "nzzzv") -- keep search terms centered
vim.keymap.set("n", "N", "Nzzzv") -- keep search terms centered

vim.keymap.set("n", "<silent><esc>", "noh<return><esc") -- use ESC to clear search

vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste without losing current buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without losing current buffer

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank to system clipboard

vim.keymap.set("n", "Q", "<nop>") -- unmap ex mode

vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format) -- format current buffer

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word that you're on
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make current file executable
