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

" if has('win32')
"     set shell=c:\Program\ Files\\Git\\bin\\bash.exe
" endif

set noswapfile

set rtp+=~/.vim
call plug#begin('~/.vim/plugged')

" Color schemes
" Plug 'tomasr/molokai'
" Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'

" Plugins tested
Plug 'bling/vim-airline'                " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " A tree explorer plugin for vim.
" Plug 'xuyuanp/nerdtree-git-plugin'      " A plugin of NERDTree showing git status
" Plug 'tpope/vim-fugitive'               " fugitive.vim: A Git wrapper so awesome, it should be illegal 
Plug 'airblade/vim-gitgutter'           " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'tpope/vim-commentary'             " commentary.vim: comment stuff out
Plug 'tpope/vim-surround'               " surround.vim: quoting/parenthesizing made simple
" Plug 'honza/vim-snippets'               " vim-snipmate default snippets (Previously snipmate-snippets)
" Plug 'leafgarland/typescript-vim'       " Typescript syntax files for Vim
Plug 'vimwiki/vimwiki'                  " Personal Wiki for Vim

" Plugins under test
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.
" Plug 'ctrlpvim/ctrlp.vim'               " Active fork of kien/ctrlp.vim. Fuzzy file, buffer, mru, tag, etc finder
" Plug 'vim-syntastic/syntastic'          " Syntax checking hacks for vim
" Plug 'rust-lang/rust.vim'               " Vim configuration for Rust
" has('python')
    " Plug 'OmniSharp/omnisharp-vim'          " Vim omnicompletion (intellisense) and more for c#
    " Plug 'SirVer/ultisnips'                 " UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
" endif

" Plugins to test
"Plug 'junegunn/fzf.vim'                 " A command-line fuzzy finder
"Plug 'edkolev/tmuxline.vim'             " Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
"Plug 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim
"Plug 'neomake/neomake'                  " Asynchronous linting and make framework for Neovim/Vim
"Plug 'w0rp/ale'                         " Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
"Plug 'tpope/vim-repeat'                 " repeat.vim: enable repeating supported plugin maps with '.'
"Plug 'godlygeek/tabular'                " Vim script for text filtering and alignment
"Plug 'plasticboy/vim-markdown'          " Markdown Vim Mode
"Plug 'ervandew/supertab'                " Perform all your vim insert mode completions with Tab
"Plug 'easymotion/vim-easymotion'        " Vim motions on speed
"Plug 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim
"Plug 'yggdroot/indentline'              " A vim plugin to display the indention levels with thin vertical lines
"Plug 'tpope/vim-sensible'               " sensible.vim: Defaults everyone can agree on
"Plug 'majutsushi/tagbar'                " Vim plugin that displays tags in a window, ordered by scope
"Plug 'scrooloose/nerdcommenter          " Vim plugin for intensely orgasmic commenting
"Plug 'brooth/far.vim'                   " Find And Replace Vim plugin
" Color schemes

call plug#end()

"Airline setting theme
"let g:airline_theme='powerlineish'
"let g:airline_theme='molokai'
"let g:airline_theme='dracula'
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1

" Show hidden files and bookmarks in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"set statusline+=%{FugitiveStatusline()}

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
" colorscheme molokai
" colorscheme dracula
colorscheme onedark

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

map <Leader>v :tabe $MYVIMRC<CR>
map <Leader>r :source $MYVIMRC<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>g :GitGutterLineHighlightsToggle<CR>
noremap <Leader>t :botright vertical terminal<CR>

let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
