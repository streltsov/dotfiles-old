call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'

call plug#end()

syntax enable
colorscheme gruvbox

set background=dark
set termguicolors
"set shiftwidth=2
set noshowmode
"set expandtab
set relativenumber

let g:netrw_liststyle= 3

"Ale
let b:ale_linters = ['eslint']
let g:ale_linters_explicit = 1

"NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#autoformat = 0

"Change background shortcut
map <Leader>bg :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

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
