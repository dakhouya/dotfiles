set nocompatible

filetype off


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sickill/vim-monokai'
Plugin 'nightsense/carbonized'

filetype plugin indent on
" All of your plugins must be added before

syntax on
set nocompatible
let mapleader = ","
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees

" Nerdcommenter *****************************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Tabs **************************************************
set softtabstop=4
set shiftwidth=4
set tabstop=8
set expandtab
  

" indenting *********************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
set cursorline

" Searching *******************************************************************
set hlsearch   " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase  " Ignore case when searching lowercase


" Colors **********************************************************************
syntax on " syntax highlighting
colorscheme monokai


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word


" File Stuff ******************************************************************
filetype plugin indent on


" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>


" Invisible characters *********************************************************
set listchars=trail:�,tab:�\ 
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars

" Misc settings ***************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


set hidden
nnoremap ' `
nnoremap ` '
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest,full
set confirm
set autochdir
set title
set showmatch
set guifont=Menlo\ Regular:h11
set whichwrap=b,s,<,>,[,]
set guioptions-=T
set scrolloff=3
set laststatus=2
set virtualedit=all
set backupdir=~/.vim/vimswap
set directory=~/.vim/vimswap
set shortmess=atI

"function! MakeSession()
    "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    "if (filewritable(b:sessiondir) != 2)
        "exe 'silent !mkdir -p ' b:sessiondir
        "redraw!
    "endif
    "let b:filename = b:sessiondir . '/session.vim'
    "exe "mksession! " . b:filename
"endfunction

"function! LoadSession()
    "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    "let b:sessionfile = b:sessiondir . "/session.vim"
    "if (filereadable(b:sessionfile))
        "exe 'source ' b:sessionfile
    "else
        "echo "No session loaded."
    "endif
"endfunction


nmap <Leader>nn :NERDTreeToggle<CR>

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

