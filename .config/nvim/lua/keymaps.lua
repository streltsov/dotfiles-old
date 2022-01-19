-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<CMD>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-t>', '<CMD>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-f>', '<CMD>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })

-- Rnvimr
vim.api.nvim_set_keymap('n', '<leader>r', '<CMD>:RnvimrToggle<CR>', { noremap = true })

-- COC
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('n', 'gu', '<Plug>(coc-rename)', { silent = true })

-- ToggleTerm
vim.api.nvim_set_keymap('n', '<C-n>', '<CMD>:ToggleTerm<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _terminal_float_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

