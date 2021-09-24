" Automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin()
" Gruvbox
Plug 'morhetz/gruvbox'
" Gruvbox Material
Plug 'sainnhe/gruvbox-material'
" Airline
Plug 'vim-airline/vim-airline'
" Polyglot
Plug 'sheerun/vim-polyglot'
" Indent Line
Plug 'Yggdroot/indentLine'
" Git Gutter
Plug 'airblade/vim-gitgutter'
" Icons
Plug 'ryanoasis/vim-devicons'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Codi
Plug 'metakirby5/codi.vim'
" Kite
Plug 'kiteco/vim-plugin'
call plug#end()

colorscheme gruvbox

set background=dark
set encoding=UTF-8
set cursorline
set linebreak
set incsearch
set hidden
set splitbelow
set path+="**"
set nocompatible
filetype plugin on

" Automatic toggling between line number modes
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" netrw

" Toggle Vexplore
map <C-n> :Lexplore<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15


" <COC Shit>
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Tool tip documentation and diagnostics 
nnoremap <silent> K :call CocAction('doHover')<CR>
" </COC Shit>

set shiftwidth=2 softtabstop=2 expandtab autoindent smartindent
"set colorcolumn=80


let g:codi#interpreters = {
\   'javascript': {
\       'bin': 'babel-node',
\   },
\}

"Change background shortcut
map <Leader>bg :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
" Open Node.js repl
map <Leader>p :14sp term://node \| :startinsert<CR>
" Open Haskell repl
map <Leader>h :14sp term://ghci \| :startinsert<CR>
"Open ranger
map <Leader>e :tabnew term://ranger \| :startinsert<CR>
"Open terminal
map <Leader>t :14sp term://zsh \| :startinsert<CR>

"Airline powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Change cursor shape in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"Show markdown syntax
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"Navigate with russian layout
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Close buffer on terminal exit
 augroup terminal_settings
    autocmd!

    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
          \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
          \   call nvim_input('<CR>')  |
          \ endif
  augroup END
