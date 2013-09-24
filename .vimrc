"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" utilisation de Bundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vundles
"
" github repos
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'

filetype on

set t_Co=256
" colorscheme xoria256
" Some themes are only for gvim, not vim
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
            \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
    runtime! plugin/guicolorscheme.vim
    "GuiColorScheme hybrid
    GuiColorScheme desert
    "GuiColorScheme superman
    "GuiColorScheme Muon
else
    "colorscheme nucolors
    colorscheme desert
    "colorscheme Muon
endif

let g:hybrid_use_Xresources = 1

set history=1000

set autochdir

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection, plugins, and indentation

nnoremap " `
nnoremap ` '
set hidden " allow hidden buffers
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest,full

set backupdir=~/.local/share/vim
set directory=~/.local/share/vim
set nobackup
set nowritebackup
set noswapfile

set nocompatible
set number
"set relativenumber " Show the line number
set mouse=r " Let the mouse work in the console
set showmatch
set ruler " Always show cursor
set cursorline

" display current mode and partially typed commands
set showmode
set showcmd

" case-insensitive searches, unless caps are involved
set ignorecase
set smartcase

set foldmethod=indent
set foldlevel=99

set shortmess=atI

set autoread

set equalalways

set magic
set so=7

set clipboard=unnamed

" tabs -> spaces
" default 4-space dd
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set cindent
set smartindent
set autoindent

set hlsearch
set incsearch

highlight Pmenu ctermbg=238 gui=bold

" textwidth limits
autocmd BufRead /tmp/mutt-* set tw=72 " mutt limit to 72 characters
"autocmd BufRead *.txt set tw=78 " text files limit to 78 characters

" vertical line at 80th column
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

" java-specific
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

let mapleader=","
let g:mapleader=","
let g:tex_flavor="pdflatex"
"let g:tex_flavor="latex"

let g:GPGUseAgent=0
let g:GPGPrefArmor=1
let g:GPGDefaultRecipients=["Albert Chang <albert.chang@gmx.com>"]

" NERDTree
map <F2> :silent NERDTreeToggle<CR>
" Toggle relative/absolute numbers
"map <F3> :call NumberToggle()<CR>
" Hypergit
"map <F4> :silent ToggleGitMenu<CR>

set pastetoggle=<leader>p

set confirm

" when ~/.vimrc is changed, autoload
autocmd! BufWritePost .vimrc source %

" arduino syntax highlighting
autocmd! BufNewFile,BufRead *.pde,*.ino setlocal ft=arduino

"autocmd! BufNew,BufRead :call UMiniBufExplorer
"let g:miniBufExplorerMoreThanOne=0
"let g:miniBufExplMapWindowNavVim = 1

let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CloseOnEnd = 0

" omnicompletion
"set omnifunc=syntaxcomplete#Complete
"set completeopt=menuone,menu,longest,preview
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Automatically toggle between relative and absolute numbers
autocmd! InsertEnter * set number
autocmd! InsertLeave * set relativenumber

" autorun files
set autowrite
command! -buffer W make

" indentation & write + load
autocmd! FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2 makeprg=ruby\ %
autocmd! FileType python set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=python\ %
autocmd! FileType perl set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=perl\ %
autocmd! FileType java set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=javac\ %
autocmd! FileType lua set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=lua\ %
autocmd! FileType tex set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=pdflatex\ %
autocmd! FileType c,cpp set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=make
autocmd! FileType sh set shiftwidth=2 softtabstop=2 tabstop=2 makeprg=./%
autocmd! BufNewFile,BufRead PKGBUILD set shiftwidth=2 softtabstop=2 tabstop=2 makeprg=makepkg

" indentation only
" no indentation
autocmd! FileType asciidoc set nocindent noautoindent
" 4-space explicit
autocmd! FileType javascript,arduino,php,html,xhtml,css,xml set shiftwidth=4 softtabstop=4 tabstop=4
" 2-space
autocmd! FileType vhdl set shiftwidth=2 softtabstop=2 tabstop=2
" 8-space

" auto-chmod
autocmd BufWritePost * call NoExtNewFile()

function! NoExtNewFile()
    if getline(1) =~ "^#!.*/bin/"
        if &filetype == ""
            filetype detect
        endif
        silent !chmod a+x <afile>
    endif
endfunction

" http://stackoverflow.com/questions/4016649/vim-word-completion-navigating-with-j-and-k#4016817

" use templates
autocmd! BufNewFile * call LoadTemplate()
" jump between %VAR% placeholders in Insert mode with <Ctrl-p>
inoremap <C-p> <ESC>/%\u.\{-1,}%<cr>c/%/e<cr>

function! LoadTemplate()
    silent! 0r ~/.vim/skel/tmpl.%:e

    " Highlight %VAR% placeholders with the Todo color group
    syn match Todo "%\u\+%" containedIn=ALL
endfunction

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunction
