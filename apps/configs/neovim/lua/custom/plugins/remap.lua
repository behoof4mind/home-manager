local builtin = require('telescope.builtin')

-- decode base64 on-the-fly and show or decode and add to the buffer
vim.keymap.set("v", "<leader>64", "y:let @+ = system('base64 --decode', @\")<cr><esc>")
vim.keymap.set("v", "<leader><leader>64", "y:echo system('base64 --decode', @\")<cr>")

-- vim.keymap.set("n", "p", "\"_dp")
-- vim.keymap.set("n", "P", "\"_dP")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
