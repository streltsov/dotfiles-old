call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

set cursorline
set background=dark
set relativenumber
set linebreak
set incsearch
set tabstop=2 shiftwidth=2 expandtab

"let g:rainbow_active = 1
"syntax enable
"set shiftwidth=2
"set termguicolors
"set noshowmode
"let g:netrw_liststyle= 3

"NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>

"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"let g:prettier#autoformat = 0
"let g:gruvbox_contrast_dark = 'hard'

"Change background shortcut
map <Leader>bg :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
map <Leader>n :set invrelativenumber<CR>
map <Leader>t :bel vert term<CR>

"Airline powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Change cursor shape in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"Select tab with Alt
for c in range(1, 9)
  exec "set <A-".c.">=\e".c
  exec "map \e".c." <A-".c.">"
  let n = c - '0'
  exec "map <M-". n ."> ". n ."gt"
endfor
