-- Color Scheme
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_improved_warnings = 1
vim.g.gruvbox_color_column = 'green'
vim.g.gruvbox_transparent_bg = 1
vim.cmd'colorscheme gruvbox'

-- don't auto comment new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Ignores case when the pattern contains lowercase letters only
vim.opt.smartcase = true

-- Highlight current line
vim.opt.cursorline = true

-- Set hybrid line number mode
vim.opt.number = true
vim.opt.relativenumber = true

-- To change the number of space characters inserted for indentation
vim.opt.shiftwidth=2

-- Automatically inserts one extra level of indentation in some cases
vim.opt.smartindent = true

-- Stop Vim wrapping lines in the middle of a word
vim.opt.linebreak = true

-- Jumps to search word as you type (annoying but excellent)
vim.opt.incsearch = true

--With :set hidden, opening a new file when the current buffer has unsaved
--changes causes files to be hidden instead of closed
vim.opt.hidden = true

-- Make the new window appear on the right.
vim.opt.splitright = true

-- Make the new window appear below the current window. 
vim.opt.splitbelow = true

-- opt.path+=**
-- opt.termguicolors = true      --  24-bit RGB colors

