"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'metakirby5/codi.vim'
call plug#end()

colorscheme gruvbox

set background=dark
set encoding=UTF-8
set relativenumber
set cursorline
set linebreak
set incsearch
set hidden
set splitbelow

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
\   'typescript': {
\       'bin': 'tsun',
\    }
\}

" <NerdTree>
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>
" </NerdTree>

"Change background shortcut
map <Leader>bg :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
map <Leader>n :set invrelativenumber<CR>
map <Leader>p :14sp term://node \| :startinsert<CR>
map <Leader>e :tabnew term://ranger \| :startinsert<CR>
map <Leader>t :14sp term://zsh \| :startinsert<CR>
"map <Leader>t :bel vert term<CR>

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

" " The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
