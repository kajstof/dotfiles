" Set language to english (gVim)
set langmenu=en_US.utf8

" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
"set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4

set langmenu=en_US
let $LANG='en_US'
set encoding=utf8

" Add number to lines
set number          " or nu
set relativenumber  " or rnu


if has("gui_running")
    " Set size for gVim
    set lines=50
    set columns=143

    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    if has('win32')
        set guifont=Ubuntu_Mono_derivative_Powerlin:h11
        "set guifont=DejaVu_Sans_Mono_for_Powerline:h9
    else
        set guifont=Ubuntu\ Mono\ 11
    endif
endif

set noswapfile

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin('~/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins tested
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'

" Plugins to test
"Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-surround'
"Plugin 'pangloss/vim-javascript'
"Plugin 'neomake/neomake'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Airline setting theme
let g:airline_theme='powerlineish'
"let g:airline_theme='dracula'
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Set colorscheme
colorscheme darkblue    " hack for dark gruvbox scheme (@TODO fix)
colorscheme gruvbox

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
map <C-n> :NERDTreeToggle<CR>
