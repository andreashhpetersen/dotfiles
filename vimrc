"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 

" Vundle must be installed and handle it self
Plugin 'VundleVim/Vundle.vim' 

" YouCompleteMe. You truly do.
Plugin 'Valloric/YouCompleteMe'

" Nice, light-weight statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Pale Night colorscheme
Plugin 'drewtempelmeyer/palenight.vim'

" Simple commentary plugin
Plugin 'https://github.com/tpope/vim-commentary'

" Awesome docstring plugin
Plugin 'heavenshell/vim-pydocstring'

" Vertical indent lines. Visual stuff, looks good
Plugin 'Yggdroot/indentLine'

" Nerdtree. Filebrowser inside vim. Pretty cool
Plugin 'https://github.com/scrooloose/nerdtree'

" Tagbar, to be explored!
Plugin 'https://github.com/majutsushi/tagbar'

" ALE is the new Syntastic, yo!
Plugin 'w0rp/ale'

" PEP8 support
Plugin 'nvie/vim-flake8'

" F# support in pretty neat way
Plugin 'fsharp/vim-fsharp'

" Surround stuff
Plugin 'https://github.com/tpope/vim-surround'

" Navigation is everything
Plugin 'christoomey/vim-tmux-navigator'

" Is it a bird? Is it a plane? No, it's Supertab!
Plugin 'https://github.com/ervandew/supertab'

" Latex - freakin' hate it
Plugin 'lervag/vimtex'

" Window swapping like crazy
Plugin 'wesQ3/vim-windowswap'

" All the colorschemes of the world
Plugin 'flazz/vim-colorschemes'

" Detect virtualenvs
Plugin 'jmcantrell/vim-virtualenv'

" Add support for tmux line (or something)
Plugin 'edkolev/tmuxline.vim'

" Add git support
Plugin 'tpope/vim-fugitive'

" Can Django BE any better??
Plugin 'tweekmonster/django-plus.vim'

call vundle#end()            
filetype plugin indent on    


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

" Change <Leader> to ,
let mapleader = ","

" Split more naturally
set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""
" Style and look
""""""""""""""""""""""""""""""""""""""""

" Add a bit extra margin to the left
set foldcolumn=1

" Height of the command bar
set cmdheight=2

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
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


""""""""""""""""""""""""""""""""""""""""
" Colorscheme: Pale Night 
""""""""""""""""""""""""""""""""""""""""

" True Colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

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
nnoremap ‹ :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==

inoremap ‹ <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi

vnoremap ‹ :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv



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
" => Plugin: Supertab
""""""""""""""""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabClosePreviewOnPopupClose = 1


""""""""""""""""""""""""""""""""""""""""
" => Plugin: Tagbar
""""""""""""""""""""""""""""""""""""""""

nnoremap <C-t> :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""""
" => Plugin: vim-pydocstring
""""""""""""""""""""""""""""""""""""""""

" Avoid keymapping clashing with tmux navigation
nmap <silent> <C--> <Plug>(pydocstring)

""""""""""""""""""""""""""""""""""""""""
" => Plugin: vim-fsharp
""""""""""""""""""""""""""""""""""""""""

" Toggle syntax checking in F#
function! ToggleFsharpSyntax()
    let s = g:syntastic_fsharp_checkers
    if s == ["syntax"]
        let g:syntastic_fsharp_checkers=[""]
        let g:fsharp_only_check_errors_on_write=1
    else
        let g:syntastic_fsharp_checkers=["syntax"]
        let g:fsharp_only_check_errors_on_write=0
    endif
endfunction

" Map ;s to the toggle syntax function
nmap <silent> ;s :call ToggleFsharpSyntax()<CR>

" Avoid too much lag (syntax check causes insufferable latency)
" let g:fsharp_only_check_errors_on_write=1
" let g:syntastic_fsharp_checkers=[""]

let g:fsharp_fsi_show_auto_open=1



""""""""""""""""""""""""""""""""""""""""
" Plugin: Syntastic
"""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0

" " Quiet some warnings
" let g:syntastic_quiet_messages = { "regex": [
"         \ '\mpossible unwanted space at "{"',
"         \ '\mcommand terminated with space',
"         \ '\myou should enclose the previous parenthesis with `{}',
"         \ '\mperhaps you should insert a',
"         \ ] }

""""""""""""""""""""""""""""""""""""""""
" Plugin: ALE
""""""""""""""""""""""""""""""""""""""""

" Move to next and previous error with Alt-d/a
nmap <silent> ˙ <Plug>(ale_next_wrap)
nmap <silent> ¬ <Plug>(ale_previous_wrap)

""""""""""""""""""""""""""""""""""""""""
" Plugin: YouCompleteMe
""""""""""""""""""""""""""""""""""""""""

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


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


