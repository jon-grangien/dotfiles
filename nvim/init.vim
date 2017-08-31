set nocompatible              " be iMproved, required
set hidden
filetype off                  " required
set termguicolors

set encoding=utf8

call plug#begin('~/.config/autoload/plug.vim')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'szw/vim-ctrlspace'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'blueyed/vim-diminactive'
Plug 'severin-lemaignan/vim-minimap'

call plug#end()

filetype plugin indent on    " required

" remaps
let mapleader = "/"
nnoremap , :
nnoremap j gj
nnoremap k gk
nnoremap ö l
nnoremap l h
nnoremap h /
vnoremap <C-c> "+y
vnoremap ö l 
vnoremap l h
" nnoremap <C-v> "+p
noremap <C-k> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <C-j> ddp
nnoremap <silent> <esc> :noh<cr><esc>

" Use ALT+{a,s,w,d} to navigate windows from any mode
" ö doesn't work or jklö scheme would be better
:tnoremap <M-a> <C-\><C-N><C-w>h
:tnoremap <M-s> <C-\><C-N><C-w>j
:tnoremap <M-w> <C-\><C-N><C-w>k
:tnoremap <M-d> <C-\><C-N><C-w>l
:inoremap <M-a> <C-\><C-N><C-w>h
:inoremap <M-s> <C-\><C-N><C-w>j
:inoremap <M-w> <C-\><C-N><C-w>k
:inoremap <M-d> <C-\><C-N><C-w>l
:nnoremap <M-a> <C-w>h
:nnoremap <M-s> <C-w>j
:nnoremap <M-w> <C-w>k
:nnoremap <M-d> <C-w>l

"nmap <silent> <A-up> :wincmd k<CR>
"nmap <silent> <A-down> :wincmd j<CR>
"nmap <silent> <A-left> :wincmd h<CR>
"nmap <silent> <A-right> :wincmd l<CR>
nnoremap <F3>  :NERDTreeToggle<CR>
nnoremap <F4> :NERDTree<CR>
nnoremap <Leader>e g_
nnoremap <Leader>s 0
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>pm :CtrlPMixed<CR>
nmap <leader>jj :BuffergatorMruCyclePrev<CR>
nmap <leader>kk :BuffergatorMruCycleNext<CR>
nmap <leader><leader> ``
nmap <Tab> :BuffergatorMruCycleNext<CR>
nmap <leader><Tab> :BuffergatorMruCyclePrev<CR>
nmap <leader>o :BuffergatorOpen<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
"imap <Leader><Tab> <Esc>
map <F1> <Esc>
imap <F1> <Esc>

"""""neosnippet configuration 
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)


let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Commands
command! -nargs=0 Sudow w !sudo tee % > /dev/null

" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif

" Not for latex
let g:tex_conceal = ""

set pastetoggle=<F2>

" autostart NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto start deoplete 
let g:deoplete#enable_at_startup = 1

" populate g:airline_symbols dictionary with powerline symbols
let g:airline_powerline_fonts = 1

" enable buffer display when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Latex options
let g:Tex_AutoFolding = 0
let g:Tex_FoldedSections     = ""
let g:Tex_FoldedEnvironments = ""
let g:Tex_FoldedMisc         = ""

" minimap
let g:minimap_highlight='Visual'

""" Color theme
"papercolor
"set background=dark
"colorscheme PaperColor

"gruvbox
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='gruvbox'


"solarized:
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark " or light
"colorscheme solarized
"let g:airline_theme='solarized'

" Quality of life settings
set nowrap		" don't wrap lines
syntax on		" syntax highlight on by default
set number		" enable line numbers by default
set autoindent    	" always set autoindenting on
set copyindent    	" copy the previous indentation on autoindenting
set expandtab				" use spaces
set shiftwidth=2	" auto indent space
set tabstop=2		" tab space
set smarttab		" insert tabs on start of line according to shiftwidth
set shiftround    	" use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase	" case insensitive search
set smartcase		" case insensitive search unless one uppercase char is used
set incsearch     	" show search matches as you type
set history=1000        " remember more commands and search history
set undolevels=1000     " use many levels of undo
set title               " change the terminal's title

" backups are unnecessary with git
set nobackup
set noswapfile

