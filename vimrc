"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" YouCompleteMe. You truly do.
Plug 'Valloric/YouCompleteMe'

" Snippets
Plug 'SirVer/ultisnips'

" Nice, light-weight statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Pale Night colorscheme
Plug 'drewtempelmeyer/palenight.vim'

" Simple commentary plugin
Plug 'https://github.com/tpope/vim-commentary'

" Awesome docstring plugin
Plug 'heavenshell/vim-pydocstring'

" Vertical indent lines. Visual stuff, looks good
Plug 'Yggdroot/indentLine'

" Nerdtree. Filebrowser inside vim. Pretty cool
Plug 'https://github.com/scrooloose/nerdtree'

" ALE is the new Syntastic, yo!
Plug 'w0rp/ale'

" PEP8 support
Plug 'nvie/vim-flake8'

" F# support in pretty neat way
Plug 'fsharp/vim-fsharp'

" Surround stuff
Plug 'https://github.com/tpope/vim-surround'

" Navigation is everything
Plug 'christoomey/vim-tmux-navigator'

" Is it a bird? Is it a plane? No, it's Supertab!
Plug 'https://github.com/ervandew/supertab'

" Latex - freakin' hate it
Plug 'lervag/vimtex'

" Window swapping like crazy
" Plug 'wesQ3/vim-windowswap'

" All the colorschemes of the world
" Plug 'flazz/vim-colorschemes'

" Detect virtualenvs
Plug 'jmcantrell/vim-virtualenv'

" Add support for tmux line (or something)
Plug 'edkolev/tmuxline.vim'

" Add git support
Plug 'tpope/vim-fugitive'

" Distraction free mode
Plug 'junegunn/goyo.vim'

" Can Django BE any better??
Plug 'tweekmonster/django-plus.vim'

" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Folding
Plug 'konfekt/fastfold'
Plug 'tmhedberg/simpylfold'

Plug 'sheerun/vim-polyglot'

" iPython integration
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" ReasonML support
Plug 'reasonml-editor/vim-reason-plus'

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    " the path to python3 is obtained through executing `:echo exepath('python3')` in vim
    let g:python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6"
endif

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" Essentials
""""""""""""""""""""""""""""""""""""""""

" You gotta have syntax
syntax enable

" Show current line number but set all other relative to this
set relativenumber
set number

" And also for help pages
autocmd FileType help setlocal number
autocmd FileType help setlocal relativenumber

" Highlight current line
set cursorline

" Make y, d an p work with clipboard
set clipboard=unnamed

" Make backspace work properly
set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Sets how many lines of history VIM has to remember
set history=300

" A buffer becomes hidden when it is abandoned
set hid

" Enable filetype plugins
filetype plugin on
filetype indent on

" Change <Leader> to ...
let mapleader = ','

" Split more naturally
set splitbelow
set splitright

" Save with sudo
cmap w!! w !sudo tee > /dev/null %


""""""""""""""""""""""""""""""""""""""""
" Style and look
""""""""""""""""""""""""""""""""""""""""

" Height of the command bar
set cmdheight=1

"Always show current position
set ruler

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Always show the status line
set laststatus=2

" Always show tabline
set showtabline=2

" Colorscheme
set t_Co=256
colorscheme palenight

" Turn background off
hi Normal ctermfg=252 ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""
" Colorscheme: Pale Night 
""""""""""""""""""""""""""""""""""""""""

" The bless of italics
let g:palenight_terminal_italics=1

""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Higligt search results
set hlsearch
set nohlsearch

" Makes search act like search in modern browsers
set incsearch 


""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""

" Alt + jk (‹∆) to move lines in file
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Working with buffers
nnoremap gl :ls<CR>
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gd :bd<CR>


""""""""""""""""""""""""""""""""""""""""
" Nice to have
""""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
set wildmenu

" Set to auto read when a file is changed from the outside
set autoread

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Indents
set ai 		" Auto indent
set si 		" Smart indent
set wrap 	" Wrap lines



""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""
" => Virtualenv support
""""""""""""""""""""""""""""""""""""""""

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif


""""""""""""""""""""""""""""""""""""""""
"  => Filetype: F#
""""""""""""""""""""""""""""""""""""""""

" Send to interactive with ctrl-i
noremap <C-i> ,i


""""""""""""""""""""""""""""""""""""""""
" => Plugin: Nerdtree
""""""""""""""""""""""""""""""""""""""""

" Open Nerdtree with <C-n>
map <C-o> :NERDTreeToggle<CR>

" Close vim if Nerdtree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""
" => Plugin: Tagbar
""""""""""""""""""""""""""""""""""""""""

" Open tagbar and let it have focus at the tag under the cursor
nnoremap <C-t> :TagbarOpen fjc<CR>

" Use global show line configurations
let g:tagbar_show_linenumbers = -1
let g:tagbar_autopreview = 1

""""""""""""""""""""""""""""""""""""""""
" => Plugin: vim-pydocstring
""""""""""""""""""""""""""""""""""""""""

" Avoid keymapping clashing with tmux navigation
nmap <silent> <C--> <Plug>(pydocstring)

""""""""""""""""""""""""""""""""""""""""
" => Plugin: vim-fsharp
""""""""""""""""""""""""""""""""""""""""

nmap <Leader>i :FsiRead
let g:fsharp_fsi_show_auto_open=1
let g:syntastic_fsharp_checkers=['']


""""""""""""""""""""""""""""""""""""""""
" Plugin: ALE
""""""""""""""""""""""""""""""""""""""""

let g:ale_lint_on_text_changed='normal'

" Move to next and previous error with Alt-d/a
nmap <silent> ˙ <Plug>(ale_next_wrap)
nmap <silent> ¬ <Plug>(ale_previous_wrap)

""""""""""""""""""""""""""""""""""""""""
" Plugin: YouCompleteMe
""""""""""""""""""""""""""""""""""""""""

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" let g:ycm_global_ycm_extra_conf="$HOME/.vim/.ycm_extra_conf.py"


""""""""""""""""""""""""""""""""""""""""
" => Plugin: Supertab
""""""""""""""""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabClosePreviewOnPopupClose = 1

" Cycle through buffers with " and |
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


""""""""""""""""""""""""""""""""""""""""
" Plugin: airline
""""""""""""""""""""""""""""""""""""""""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='base16'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''

let g:airline_symbols.linenr = '|'
let g:airline_symbols.maxlinenr = ' |'


let g:airline#extensions#tabline#enabled    = 1
let g:airline#extensions#tabline#left_sep   = ''
let g:airline#extensions#tabline#right_sep  = ''

let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 100,
      \ 'y': 100,
      \ 'z': 50,
      \ 'warning': 80,
      \ 'error': 80,
      \ }


""""""""""""""""""""""""""""""""""""""""
" Plugin: ALE
""""""""""""""""""""""""""""""""""""""""

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=kspell
  set bg=light
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>


""""""""""""""""""""""""""""""""""""""""
" Plugin: reason-plus
""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/usr/local/bin/reason-language-server']
    \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""""""""""""
" Plugin: vim-polyglot
""""""""""""""""""""""""""""""""""""""""

let g:polyglot_disabled = ['latex']


""""""""""""""""""""""""""""""""""""""""
" Plugin: vimtex
""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


""""""""""""""""""""""""""""""""""""""""
" Plugin: UltiSnips
""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


""""""""""""""""""""""""""""""""""""""""
" Plugin: vim-slime
""""""""""""""""""""""""""""""""""""""""

let g:slime_target = 'tmux'

" fix past issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

