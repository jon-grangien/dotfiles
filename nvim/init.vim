"  ___      ___ ___  _____ ______      
" |\  \    /  /|\  \|\   _ \  _   \    
" \ \  \  /  / | \  \ \  \\\__\ \  \   
"  \ \  \/  / / \ \  \ \  \\|__| \  \  
"   \ \    / /   \ \  \ \  \    \ \  \ 
"    \ \__/ /     \ \__\ \__\    \ \__\
"     \|__|/       \|__|\|__|     \|__|
"                                      

let s:is_windows = has('win32') || has('win64')

if s:is_windows
  let g:python_host_prog="C:/Python27/python.exe"
  let g:python3_host_prog="C:/Python37-32/python.exe"
endif

set nocompatible              " be iMproved, required
set hidden
filetype off                  " required
set termguicolors
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

set encoding=utf8

call plug#begin('~/.config/nvim/plugs')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'szw/vim-ctrlspace'
Plug 'tpope/vim-fugitive'

Plug 'ctrlpvim/ctrlp.vim' "explore others

if s:is_windows
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'install.cmd'}
else
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
endif

Plug 'jeetsukumaran/vim-buffergator'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Sierra'
Plug 'pangloss/vim-javascript' "is this necessary
Plug 'mxw/vim-jsx'
"Plug 'terryma/vim-multiple-cursors'
Plug 'mxw/vim-jsx'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim' "look up usage
Plug 'scrooloose/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'blueyed/vim-diminactive'
Plug 'severin-lemaignan/vim-minimap'
"Plug 'beyondmarc/glsl.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'easymotion/vim-easymotion'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'
Plug 'prettier/prettier'

" typescript
"Plug 'leafgarland/typescript-vim'
"Plug 'Quray/tsuquyomi'

call plug#end()

filetype plugin indent on    " required

" Function MapToggle 
" Allows remapping a key to toggling a bool option
" http://vim.wikia.com/wiki/Quick_generic_option_toggling
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" remaps
let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap , :
nnoremap j gj
nnoremap k gk
nnoremap <silent> <esc> :noh<cr><esc>

nnoremap <F3>  :NERDTreeToggle<CR>
nnoremap <F4> :NERDTree<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>v gv<Esc>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>pm :CtrlPMixed<CR>
nmap <leader><leader> ``
nmap <Tab> :BuffergatorMruCyclePrev<CR>
nmap <S-Tab> :BuffergatorMruCycleNext<CR>
nmap <leader>o :BuffergatorOpen<CR>
nnoremap <silent> <M-a> :vertical resize +10<CR>
nnoremap <silent> <M-r> :vertical resize -10<CR>
nnoremap <silent> <M-s> :resize +5<CR>
nnoremap <silent> <M-t> :resize -5<CR>
MapToggle <F1> wrap
"nmap <leader>rn <Plug>(coc-rename)
"xmap <leader>fo <Plug>(coc-format-selected)
"nmap <leader>fo <Plug>(coc-format-selected)
"nmap <leader>qf  <Plug>(coc-fix-current)
imap <C-l> <Plug>(coc-snippets-expand)

" Use tab for trigger completion with characters ahead and navigate.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <A-up> :wincmd k<CR>
nmap <silent> <A-down> :wincmd j<CR>
nmap <silent> <A-left> :wincmd h<CR>
nmap <silent> <A-right> :wincmd l<CR>

""""" easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>e <Plug>(easymotion-j)
map <Leader>i <Plug>(easymotion-k)

" colemak movement on regular keyboard
nmap <C-n> gj
nmap <C-e> gk

" CoCList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"" sessions
" make
map <Leader>ss1 :mks! ~/.vimsessions/session1.vim<CR>
map <Leader>ss2 :mks! ~/.vimsessions/session2.vim<CR>
map <Leader>ss3 :mks! ~/.vimsessions/session3.vim<CR>
map <Leader>ss4 :mks! ~/.vimsessions/session4.vim<CR>
map <Leader>ss5 :mks! ~/.vimsessions/session5.vim<CR>
" restore
map <Leader>sr1 :so ~/.vimsessions/session1.vim<CR>
map <Leader>sr2 :so ~/.vimsessions/session2.vim<CR>
map <Leader>sr3 :so ~/.vimsessions/session3.vim<CR>
map <Leader>sr4 :so ~/.vimsessions/session4.vim<CR>
map <Leader>sr5 :so ~/.vimsessions/session5.vim<CR>

"""""neosnippet configuration 
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

"""" ALE config
let g:ale_fixers = {'typescript': ['tslint'], 'javascript': ['prettier', 'eslint']}
let g:ale_linters = {'typescript': ['tslint'], 'javascript': ['eslint']}
" let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1
let g:ale_fix_on_save=1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

let g:ctrlp_custom_ignore = 'node_modules\|^build\|^\.DS_Store\|^\.git\|^\.coffee'
let g:ctrlp_show_hidden = 1

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Commands
command! -nargs=0 Sudow w !sudo tee % > /dev/null
"command! -nargs=0 Format :call CocAction('format')

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
call deoplete#enable()
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
set background=light
"let g:sierra_Twilight = 1
colorscheme PaperColor
let g:airline_theme='papercolor'

"gruvbox
"set background=dark
"let g:gruvbox_italic=1
"colorscheme gruvbox
"let g:airline_theme='gruvbox'


" Terminal colors
"set t_Co=16


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
set linebreak       " break at linebreak if wrap is set
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

