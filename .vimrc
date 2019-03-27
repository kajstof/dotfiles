" Set language to english (gVim)
set langmenu=en_US.utf8

" System clipboard (Windows)
set clipboard=unnamed,unnamedplus

" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
"syntax on

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
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    if has('win32')
        " Set size for gVim
        set lines=50
        set columns=143

        set guifont=Ubuntu_Mono_derivative_Powerlin:h11
        "set guifont=DejaVu_Sans_Mono_for_Powerline:h9
    else
        set guifont=Ubuntu\ Mono\ 11
    endif
endif

set noswapfile

set rtp+=~/.vim
call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'tomasr/molokai'
"Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
"Plug 'dracula/vim'

" Plugins tested
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'vimwiki/vimwiki'

" Plugins under test
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'

" Plugins to test
"Plug 'junegunn/fzf.vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'neomake/neomake'
"Plug 'majutsushi/tagbar'
"Plug 'godlygeek/tabular'
"Plug 'ervandew/supertab'

call plug#end()

filetype plugin indent on

"Airline setting theme
let g:airline_theme='powerlineish'
"let g:airline_theme='dracula'
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1

" Show hidden files and bookmarks in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set colorscheme
set background=dark
colorscheme molokai

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
map <C-r> :source $MYVIMRC<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :GitGutterLineHighlightsToggle<CR>
