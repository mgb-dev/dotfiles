-- Set <Space> as global leader key
vim.g.mapleader = " "

local map = vim.keymap.set

-- [[ User Keymaps ]]

-- [[ Spell Keymaps]]
map("n", "<leader>sj", "]s", { desc = "[S]pell next" })
map("n", "<leader>sk", "[s", { desc = "[S]pell previous" })
map("n", "<leader>ss", "z=", { desc = "[S]pell [S]ugest" })

map("n", "<M-f>", "<C-^>", { desc = "[Alt]ernate [F]ile" })
map("n", "<leader>ee", vim.cmd.Ex, { desc = "[E]xplorer Open" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Highlighted text DOWN" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Highlighted text UP" })

-- [[ Prime Keymaps ]]

map("n", "+", "<nop>")
map("v", "+", "<nop>")
map("x", "<leader>p", '"_dP', { desc = "Paste into void register" })
map("n", "<leader>y", '"+y', { desc = "Copy to `System Clipboard`" })
map("v", "<leader>y", '"+y', { desc = "Copy to `System Clipboard`" })
map("n", "<leader>Y", '"+Y', { desc = "Copy to `System Clipboard`" })
map("n", "<leader>d", '"_d', { desc = "Delete to void register" })
map("v", "<leader>d", '"_d', { desc = "Delete to void register" })
