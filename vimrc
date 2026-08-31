"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Completion / snippets / LSP
Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/goyo.vim'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'heavenshell/vim-pydocstring'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linting
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'

" Folding
Plug 'konfekt/fastfold'
Plug 'tmhedberg/simpylfold'

" Restore cursor position and folds per file
Plug 'zhimsel/vim-stay'

" Language support
Plug 'lervag/vimtex'
Plug 'lervag/wiki.vim'
Plug 'lervag/wiki-ft.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'derekwyatt/vim-scala'
Plug 'tweekmonster/django-plus.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Python REPL / cells
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" Essentials
""""""""""""""""""""""""""""""""""""""""

syntax enable
filetype plugin indent on

set relativenumber
set number
set cursorline
set backspace=indent,eol,start

" System clipboard. Needs Vim with +clipboard (X11) or +wayland (install
" vim-gtk3). The fallback pipes yanks to wl-copy / xclip for a Vim built
" with neither (e.g. minimal vim on Wayland/niri).
set clipboard=unnamedplus
if !has('clipboard') && (executable('wl-copy') || executable('xclip'))
    let s:clipcmd = executable('wl-copy') ? 'wl-copy' : 'xclip -selection clipboard'
    augroup SysClipYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y'
            \ | call system(s:clipcmd, join(v:event.regcontents, "\n")) | endif
    augroup END
endif


""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

set encoding=utf8
set history=1000
set hidden
set autoread
set lazyredraw
set splitbelow
set splitright

let mapleader = ','

" No bells
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" No backup / swap (everything lives in git anyway)
set nobackup
set nowritebackup
set noswapfile

" Ignore compiled / VCS junk
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Spell language - spell itself is switched on per filetype (see Autocommands)
set spelllang=en_us
" Fix the last spelling mistake without leaving insert mode
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Save with sudo
cnoreabbrev w!! w !sudo tee > /dev/null %


""""""""""""""""""""""""""""""""""""""""
" UI / colours
""""""""""""""""""""""""""""""""""""""""

set ruler
set showmatch
set matchtime=2
set laststatus=2
set showtabline=2
set cmdheight=1
set wildmenu
set wildmode=longest:full,full

set t_Co=256
" Truecolor when the terminal advertises it (Alacritty, kitty); stays off on urxvt
if has('termguicolors') && $COLORTERM =~# '^\(truecolor\|24bit\)$'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let g:palenight_terminal_italics = 1

" Keep a transparent background across colorscheme reloads
augroup vimrc_colors
    autocmd!
    autocmd ColorScheme palenight hi Normal ctermfg=252 ctermbg=NONE guibg=NONE
augroup END
colorscheme palenight


""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""

set ignorecase
set smartcase
set incsearch
set nohlsearch
nnoremap <silent> <leader><space> :ohlsearch<CR>


""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent
""""""""""""""""""""""""""""""""""""""""

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wrap


""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""

augroup vimrc
    autocmd!
    " Line numbers on help pages
    autocmd FileType help setlocal number relativenumber
    " Spell-check for prose filetypes
    autocmd FileType tex,markdown,gitcommit setlocal spell
    " Close vim if NERDTree is the only window left
    autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | quit | endif
augroup END


""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""

" Edit / reload vimrc
nnoremap <silent><leader>v :e ~/.vimrc<CR>
nnoremap <silent><leader>s :source ~/.vimrc<CR>
nnoremap <silent><leader>1 :source ~/.vimrc \| PlugInstall<CR>

" Buffers
nnoremap gl :ls<CR>
nnoremap gn :bnext<CR>
nnoremap gp :bprevious<CR>
nnoremap gd :bp\|bd #<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Explode a (…) / […] argument list, one item per line
nnoremap <leader>( maci(<Enter><Esc>O<Esc>p:.s/, /,\r/g<Esc>'a=i(
nnoremap <leader>[ maci[<Enter><Esc>O<Esc>p:.s/, /,\r/g<Esc>'a=i[


""""""""""""""""""""""""""""""""""""""""
" Plugin: NERDTree
""""""""""""""""""""""""""""""""""""""""

nnoremap <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""
" Plugin: ALE
""""""""""""""""""""""""""""""""""""""""

let g:ale_disable_lsp = 1  " vim-lsp is the LSP client; ALE only lints / fixes
let g:ale_lint_on_text_changed = 'normal'
let g:ale_tex_chktex_options = '-I -n1 -n3 -n8 -n25 -n36'
let g:ale_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }

" Jump between lint results
nmap <silent> ]a <Plug>(ale_next_wrap)
nmap <silent> [a <Plug>(ale_previous_wrap)


""""""""""""""""""""""""""""""""""""""""
" Plugin: vim-lsp  (servers installed with :LspInstallServer, via vim-lsp-settings)
""""""""""""""""""""""""""""""""""""""""

let g:lsp_diagnostics_enabled = 0          " ALE owns diagnostics
let g:lsp_document_highlight_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap     <buffer> <C-]>       <plug>(lsp-definition)
    nmap     <buffer> <leader>k   <plug>(lsp-hover)
    nmap     <buffer> <leader>rn  <plug>(lsp-rename)
    nmap     <buffer> <leader>rf  <plug>(lsp-references)
    nnoremap <buffer> <C-w><C-]>  :split <bar> LspDefinition<CR>
endfunction

augroup lsp_buffer
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""""""""""""""""""""""""""""""""""""""""
" Plugin: asyncomplete
""""""""""""""""""""""""""""""""""""""""

" Popup appears while typing. Tab / S-Tab cycle it, <C-y> confirms, <C-e> cancels.
let g:asyncomplete_auto_popup = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""""""""""""""""""""""""""""""""""""""""
" Plugin: airline
""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'palenight'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = '|'
let g:airline_symbols.maxlinenr = ' |'

let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#left_sep  = ''
let g:airline#extensions#tabline#right_sep = ''

let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 100,
      \ 'y': 100,
      \ 'z': 50,
      \ 'warning': 80,
      \ 'error': 80,
      \ }


""""""""""""""""""""""""""""""""""""""""
" Plugin: wiki.vim
""""""""""""""""""""""""""""""""""""""""

let g:wiki_root = '~/wiki'
let g:wiki_zotero_root = '~/Zotero/'


""""""""""""""""""""""""""""""""""""""""
" Plugin: vimtex
""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': 'build',
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


""""""""""""""""""""""""""""""""""""""""
" Plugin: UltiSnips
""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'


""""""""""""""""""""""""""""""""""""""""
" Plugin: vim-slime
""""""""""""""""""""""""""""""""""""""""

let g:slime_target = 'tmux'
let g:slime_python_ipython = 1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1


""""""""""""""""""""""""""""""""""""""""
" Plugin: fzf
""""""""""""""""""""""""""""""""""""""""

nnoremap <C-p> :Files<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>g :Commits<CR>
