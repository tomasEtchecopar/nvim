local km = vim.keymap.set

km('n', '<Esc>', '<cmd>nohlsearch<CR>')

km('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
km('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

km('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
km('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
km('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
km('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

km('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
km('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
km('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
km('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- colorscheme picker
km("n", "<C-n>", ":Telescope colorscheme<CR>")
