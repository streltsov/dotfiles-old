-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<CMD>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', { noremap = true })

-- Term
vim.api.nvim_set_keymap('n', '<C-n>', '<CMD>:ToggleTerm<CR>', { noremap = true })

-- Rnvimr
vim.api.nvim_set_keymap('n', '<leader>r', '<CMD>:RnvimrToggle<CR>', { noremap = true })

-- Coc
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('n', 'gu', '<Plug>(coc-rename)', { silent = true })

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

local terminal = Terminal:new({
  dir = "git_dir",
  direction = "float",
})

function _terminal_toggle()
  terminal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _terminal_toggle()<CR>", {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', '<C-t>', '<CMD>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-f>', '<CMD>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })