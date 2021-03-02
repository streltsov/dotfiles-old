"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'metakirby5/codi.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'Quramy/tsuquyomi'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
call plug#end()

colorscheme gruvbox

set cursorline
set background=dark
set relativenumber
set linebreak
set incsearch
set tabstop=2 shiftwidth=2 expandtab

"ESlint
" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint']
" Fix files with ESLint.
let b:ale_fixers = ['eslint']
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

"Codi
let g:codi#width = 120

"Kite
let g:kite_supported_languages = ['javascript', 'typescript']

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

"NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>

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

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
