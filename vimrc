filetype plugin off

" Use Vim settings rather than Vi settings
" Must be first because it changes other options as a side effect
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugin for saving buffers automatically
Plugin 'vim-auto-save'

" Colorscheme plugins
Plugin 'junegunn/seoul256.vim'
Plugin 'romainl/Apprentice'
Plugin 'sjl/badwolf'
Plugin 'arzg/vim-wizard'
Plugin 'joshdick/onedark.vim'

" Plugin for Python development
Plugin 'dense-analysis/ale'
Plugin 'Vimjas/vim-python-pep8-indent'

" markdown preview
Plugin 'kurocode25/mdforvim'

" plugin to send some code/text to a live REPL
Plugin 'jpalardy/vim-slime.git'

" Vim for writing
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'

" Plugins for web development
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leshill/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'skammer/vim-css-color'

" All Plugins must be added above this line
call vundle#end()

""""""""""""""""""""Basic Settings""""""""""""""""""""""""""""
" Enable file type detection and load indent file automatically
filetype plugin indent on
syntax on   " enable syntax
set title   " Set title of the window to the filename
set number  " Set the line numbers
set relativenumber  " Show line number relative to the line
set ruler   " Show line and column number of cursor position
set shell=/bin/bash " Start the bash shell
set modelines=0 " No lines are checked
set tabstop=4   " 4 spaces for the tabs
set shiftwidth=4    " Return 4 spaces 
set softtabstop=4   " 4 spaces for tabs
set expandtab   " Always insert spaces
set smarttab    " Insert blanks according to shift width
set encoding=utf-8  " Use utf-8 encoding
set scrolloff=3 " Keep 3 lines above and below the cursor
set smartindent " Smarter than vanilla indent setting
set showmode    " Show the current working mode
set cursorline  " Always highlight the cursor position
set showcmd " Show command in last line of the screen
set hidden  " Hide a buffer when it is abandoned
set wildmenu    " Enable command line completion
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set noundofile  " Don't save undo history
set ignorecase  " Ignore case of letters in pattern matching
set smartcase   " Ignore case when pattern matches contain lowercase letters only
set incsearch   " Show pattern matches while typing
set hlsearch    " Highlight all search pattern matches
set showmatch   " Briefly show matching brackets 
set textwidth=78    " Maximum width of text
set wrap    " Wraps lines longer than text width
set linebreak   " Wrap lines at a word boundary
set nolist  " Set no list mode
set formatoptions=qrn1  " Sequence of letters for automatic formatting
set spell spelllang=en  " Enable spell checking
set colorcolumn=+2  " Highlight two columns after text width
set omnifunc=syntaxcomplete#Complete " Activate Vim inbuilt omni completion

"""""""""""""""""""""""""""Augroups"""""""""""""""""""""""""
" Commands for language specific settings.
" Web development settings
augroup configgroup
    autocmd!
    autocmd FileType matlab,html,css,js setlocal tabstop=2
    autocmd FileType matlab,html,css,js setlocal shiftwidth=2
    autocmd FileType matlab,html,css,js setlocal softtabstop=2
augroup END

""""""""""""""""""""""""""Mappings""""""""""""""""""""""""""
" map the escape key to 'jk'
inoremap jk <ESC>
" and colon to semi-colon
nnoremap ; :

" map the leader key to 'space'
let mapleader = "\<Space>"

" run python scripts from inside vim "
autocmd Filetype python imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>

"""""""""""""""""""""""""Abbreviations"""""""""""""""""""""
iabbrev date- <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
iabbrev pyb #!/usr/bin/env python3

""""""""""""""""""""Status Line Settings"""""""""""""""""""
" Function for calculating number of words in a file.
" From naperwrimo.org/wiki/index.php?title=Vim_for_Writers
let g:word_count="<unknown>"
function WordCount()
    return g:word_count
endfunction
function UpdateWordCount()
    let lnum = 1
    let n = 0
    while lnum <= line('$')
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    let g:word_count = n
endfunction
" Update the count when the cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

set laststatus=2    " Always display a status line
set statusline+=%<%t    " File name, cut if needed at start
set statusline+=%M  " Modified flag, + sign
set statusline+=%y  " File type
set statusline+=%=  " Separator from left to right justified
set statusline+=\ %{WordCount()}\ words,    " Words in the file
set statusline+=\ %c\ %l/%L\ lines,\ %P " Lines and file %age
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_browse_split = 2
"let g:netrw_altv = 1
let g:netrw_winsize = 25
""""""""""""""""""""Plugin settings"""""""""""""""""
let g:auto_save = 1 " enable AutoSave on vim startup

"""""""""""colorscheme settings""""""""""
syntax on
set background=dark
set t_Co=256
colorscheme wizard

autocmd InsertEnter * colorscheme seoul256
autocmd InsertLeave * colorscheme apprentice

"""""""""""""Emmet""""""""""""""
" Enable emmet just for html/css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Remap the emmet key leader to c-z
let g:user_emmet_leader_key='<c-z>'
""""""""""""Limelight-Goyo"""""""""""""""
augroup markdown
    autocmd!
    autocmd Filetype markdown,md,mkd call SetUpMk()
    autocmd Filetype text,txt call SetUpMk()
augroup END
let g:limelight_conceal_ctermfg = 240
function! SetUpMk()
    Limelight
    " execute 'Goyo' if it's not already active
    if !exists('#goyo')
        Goyo
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" load template file for specific filetype,
" if available
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatic close brackets, braces
" use ctrl+v to escape the mapping when we don't want it
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Commenting blocks of code
augroup comment_blockss
    autocmd!
    autocmd FileType c,cpp,java,scala  let b:comment_leader = '//'
    autocmd FileType sh,ruby,python    let b:comment_leader = '#'
    autocmd FileType conf,fstab,screen let b:comment_leader = '#'
    autocmd FileType tex               let b:comment_leader = '%'
    autocmd FileType vim               let b:comment_leader = '"'
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
