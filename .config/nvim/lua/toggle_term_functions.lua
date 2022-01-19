local Terminal  = require('toggleterm.terminal').Terminal

local terminal_float = Terminal:new({
  dir = "git_dir",
  direction = "float",
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})
 
function _terminal_float_toggle()
  terminal_float:toggle()
end

function _lazygit_toggle()
  lazygit:toggle()
end
