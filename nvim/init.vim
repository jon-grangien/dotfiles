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

let mapleader = "\<Space>"
let maplocalleader = "\\"

" Main options
set nocompatible              " be iMproved, required
set hidden
filetype off                  " required
set termguicolors
set encoding=utf8

" config
" set expandtab
" set smarttab
set noexpandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4

" Quality of life settings
set nowrap
syntax on
set number
set autoindent
set linebreak
set copyindent
set shiftround
set ignorecase
set smartcase
set incsearch
set history=1000
set undolevels=1000
set title
set nobackup
set noswapfile
set splitright
set splitbelow

" good for coc list
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
let NVIM_COC_LOG_LEVEL = 'debug'

" cool-ness settings
set pumblend=15

set backupdir=.,$XDG_CONFIG_HOME/nvim/backup,$XDG_DATA_HOME/nvim/backup

let s:is_current_theme_dark = 1

call plug#begin('~/.config/nvim/plugs')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
" Plug 'scrooloose/syntastic'
Plug 'szw/vim-ctrlspace'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jeetsukumaran/vim-buffergator'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'AlessandroYorba/Sierra'
Plug 'pangloss/vim-javascript' "is this necessary
" Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/denite.nvim' "look up usage
Plug 'scrooloose/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'severin-lemaignan/vim-minimap'
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'beyondmarc/glsl.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jparise/vim-graphql'
" Plug 'w0rp/ale'
Plug 'prettier/prettier'
Plug 'mustache/vim-mustache-handlebars'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ludovicchabant/vim-gutentags'
Plug 'gregsexton/MatchTag'
Plug 'unblevable/quick-scope' 
call plug#end()

filetype plugin indent on    " required

" Function MapToggle 
" http://vim.wikia.com/wiki/Quick_generic_option_toggling
function! MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! ToggleLightDark()
	if s:is_current_theme_dark == 1
		let g:airline_theme='papercolor'
		set background=light
		exec 'colorscheme Papercolor'
		let s:is_current_theme_dark = 0
	else
		let g:airline_theme='gruvbox'
		set background=dark
		let g:gruvbox_italic=1
		exec 'colorscheme gruvbox'
		let s:is_current_theme_dark = 1
	endif
endfunction

function! FloatingFZF()

  " creates a scratch, unlisted, new, empty, unnamed buffer
  let buf = nvim_create_buf(v:false, v:true)

  let height = float2nr(&lines * 0.75)
  let width = float2nr(&columns * 0.6)

  let horizontal_position = float2nr((&columns - width) / 2) 
  let vertical_position = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical_position,
        \ 'col': horizontal_position,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" Commands
command! -nargs=0 Sudow w !sudo tee % > /dev/null
command! -nargs=0 Format :call CocAction('format')

let s:ag_secondary_options = ' --one-device --skip-vcs-ignores --smart-case '

command! -bang -nargs=* RG call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" nnoremap <C-q> :RG<cr>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   s:ag_secondary_options,
  \  <bang>0 ? fzf#vim#with_preview('up:60%')
  \        : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0
  \ )

nnoremap , :
nnoremap j gj
nnoremap k gk
nnoremap <silent> <esc> :noh<cr><esc>
MapToggle <F1> wrap
MapToggle <F2> relativenumber
nnoremap <F3>  :NERDTreeToggle<CR>
nnoremap <F4> :NERDTree<CR>
nnoremap <F6> :NERDTreeFind<CR>
nnoremap <F7> :NERDTreeVCS<CR>
nmap <F9> :call ToggleLightDark()<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>v gv<Esc>
nmap <leader>v :vs<CR>
nmap <leader><leader> ``
nmap <A-right> gt
nmap <A-left> gT
nmap <leader>so :so ~/dotfiles/nvim/init.vim<CR>
nnoremap <silent> <leader>l :vertical resize +10<CR>
nnoremap <silent> <leader>h :vertical resize -10<CR>
nnoremap <silent> <leader>j :resize +5<CR>
nnoremap <silent> <leader>k :resize -5<CR>

" colemak movement on regular keyboard
nmap <M-n> h
nmap <M-e> gj
nmap <M-i> gk
nmap <M-o> l
xmap <M-n> h
xmap <M-e> gj
xmap <M-i> gk
xmap <M-o> l

" nav split panes
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" nav buffers
" nmap <silent> <Tab> :BuffergatorMruCyclePrev<CR>
" nmap <silent> <S-Tab> :BuffergatorMruCycleNext<CR>

" Fuzzy finding
nnoremap <leader>r :Rg<CR>

silent! nmap <C-p> :GFiles --exclude-standard --others --cached<CR>
silent! nmap <leader>p :Buffers<CR>
silent! nmap <C-f> :BLines<CR>
silent! nmap <C-m> :Marks<CR>

" cd root location into current buffer's dir
nnoremap <leader>cd :lcd %:p:h<CR>:NERDTreeCWD<CR>:pwd<CR>
nnoremap <leader>cr :Rooter<CR>

nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>

" make sessions
map <Leader>ss1 :mks! ~/.vimsessions/session1.vim<CR>
map <Leader>ss2 :mks! ~/.vimsessions/session2.vim<CR>
map <Leader>ss3 :mks! ~/.vimsessions/session3.vim<CR>
map <Leader>ss4 :mks! ~/.vimsessions/session4.vim<CR>
map <Leader>ss5 :mks! ~/.vimsessions/session5.vim<CR>

" restore sessions
map <Leader>sr1 :so ~/.vimsessions/session1.vim<CR>
map <Leader>sr2 :so ~/.vimsessions/session2.vim<CR>
map <Leader>sr3 :so ~/.vimsessions/session3.vim<CR>
map <Leader>sr4 :so ~/.vimsessions/session4.vim<CR>
map <Leader>sr5 :so ~/.vimsessions/session5.vim<CR>

" COC
nmap <leader>crn <Plug>(coc-rename)
vmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
imap <C-l> <Plug>(coc-snippets-expand)

nmap <leader>cto :CocCommand tsserver.organizeImports<CR>
nmap <leader>cp :CocCommand prettier.formatFile<CR>

nnoremap <leader>cld :<C-u>CocList diagnostics<cr>
nnoremap <leader>o   :<C-u>CocList outline<cr>
nnoremap <leader>sy  :<C-u>CocList -I symbols<cr>
nnoremap <leader>cl  :<C-u>CocListResume<CR>

"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

nnoremap <leader>do :call <SID>show_documentation()<CR>
nnoremap <leader>dd <Plug>(coc-definition)
nnoremap <leader>dr <Plug>(coc-references)
nnoremap <leader>di <Plug>(coc-implementation)

autocmd FileType json syntax match Comment +\/\/.\+$+

" Use tab for trigger completion with characters ahead and navigate.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " Keep cursor column 
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>e <Plug>(easymotion-j)
map <Leader>i <Plug>(easymotion-k)

" Rooter
let g:rooter_manual_only = 1

" ALE config
" let g:ale_fixers = {'typescript': ['tslint'], 'javascript': ['prettier', 'eslint']}
" let g:ale_linters = {'typescript': ['tslint'], 'javascript': ['eslint']}
" let g:ale_completion_enabled=1
" let g:airline#extensions#ale#enabled=1
let g:airline#extensions#coc=1
"let g:ale_fix_on_save=1
" let g:ale_sign_error = '•' " Less aggressive than the default '>>'
" let g:ale_sign_warning = '•'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" git gutter
let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg

" Not for latex
let g:tex_conceal = ""

set pastetoggle=<F2>

" fzf options
let g:fzf_commits_log_options = '--graph --color=always'
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "right"
let NERDSpaceDelims = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" populate g:airline_symbols dictionary with powerline symbols
let g:airline_powerline_fonts = 1

" enable buffer display when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Latex options
let g:Tex_AutoFolding        = 0
let g:Tex_FoldedSections     = ""
let g:Tex_FoldedEnvironments = ""
let g:Tex_FoldedMisc         = ""

" minimap
let g:minimap_highlight='Visual'

" Color theme
"set background=light
"let g:sierra_Twilight = 0
"colorscheme Sierra
"let g:airline_theme='sierra'

" gruvbox
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='gruvbox'

" smoothie
let g:smoothie_update_interval = 40

" quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Terminal colors
"set t_Co=16

"solarized:
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark " or light
"colorscheme solarized
"let g:airline_theme='solarized'

if s:is_windows
	cd C:\Users\jgn\code
endif
