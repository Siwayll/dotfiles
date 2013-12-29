"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Thème pour gvim
let p_color="nucolors"
" Thème pour la version console
let p_consCo="hybrid"


" utilisation de Bundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ## Vundles
" Navigateur de fichiers
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
" raccourcis pour gérer les " et '
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
" affichages des couleurs dans leur couleur
Bundle 'lilydjwg/colorizer'
" Navigateur entre les déclarations
"Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
" Barre de status
"Bundle 'maciakl/vim-neatstatus'
Bundle 'bling/vim-airline'
" Contrôle de la syntaxe
Bundle 'scrooloose/syntastic'



filetype on

set t_Co=256
" colorscheme xoria256
" Some themes are only for gvim, not vim
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
            \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
    runtime! plugin/guicolorscheme.vim
    execute "colorscheme ".p_consCo
else
    execute "colorscheme ".p_color
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

" Affichage en permanence de la statusline
set laststatus=2

" Suppression de ce putain de bip
set noeb vb t_vb=
au GUIEnter * set vb t_vb=


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

" Affichage des espaces en fin de ligne et des tabulations
set listchars=tab:→\ ,trail:·
set list

" textwidth limits
autocmd BufRead /tmp/mutt-* set tw=72 " mutt limit to 72 characters

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


" ## Raccourcis

" NERDTree
map <F2> :silent NERDTreeToggle<CR>
" Toggle relative/absolute numbers
map <F3> :call NumberToggle()<CR>
" Navigator
nmap <F8> :TagbarToggle<CR>

""" FocusMode
function! ToggleWritMode()
  if (&laststatus == 2)
    colorscheme summerfruit256
    set number!
    set linebreak
    set laststatus=0
    set noruler
    set spelllang=fr
    set spell
    syn on
  else
    set number
    set linebreak!
    set ruler
    set laststatus=2
    set spell!
    execute "colorscheme ".g:p_color
    syn on
  endif
endfunc
nnoremap <F10> :call ToggleWritMode()<cr>


" ## StatusLine
let g:airline_powerline_fonts=0
let g:airline_left_sep = '_'
let g:airline_right_sep = '_'

let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme="jellybeans"

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
"autocmd! InsertEnter * set number
"autocmd! InsertLeave * set relativenumber

" autorun files
set autowrite
command! -buffer W make

au BufNewFile,BufRead *.md set filetype=markdown

" indentation & write + load
autocmd! FileType ruby set spell! shiftwidth=2 softtabstop=2 tabstop=2 makeprg=ruby\ %
autocmd! FileType python set spell! shiftwidth=4 softtabstop=4 tabstop=4 makeprg=python\ %
autocmd! FileType perl set spell! shiftwidth=4 softtabstop=4 tabstop=4 makeprg=perl\ %
autocmd! FileType java set spell! shiftwidth=4 softtabstop=4 tabstop=4 makeprg=javac\ %
autocmd! FileType lua set spell! shiftwidth=4 softtabstop=4 tabstop=4 makeprg=lua\ %
autocmd! FileType tex set spell! shiftwidth=4 softtabstop=4 tabstop=4 makeprg=pdflatex\ %
autocmd! FileType c,cpp set spell! shiftwidth=4 softtabstop=4 tabstop=4 makeprg=make
autocmd! FileType sh set spell! shiftwidth=2 softtabstop=2 tabstop=2 makeprg=./%
autocmd! BufNewFile,BufRead PKGBUILD set spell! shiftwidth=2 softtabstop=2 tabstop=2 makeprg=makepkg
autocmd! FileType markdown set colorcolumn=0

" indentation only
" no indentation
autocmd! FileType asciidoc set spell! nocindent noautoindent
" 4-space explicit
autocmd! FileType arduino,php,html,xhtml,xml set spell! shiftwidth=4 softtabstop=4 tabstop=4
" 2-space
autocmd! FileType vhdl,javascript,scss,css set spell! shiftwidth=2 softtabstop=2 tabstop=2
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


" Switch entre numérotation relative et absolue
function! NumberToggle()
    if(&relativenumber == 1)
        let &relativenumber = 0
        set number
    else
        let &relativenumber = 1
        set relativenumber
    endif
endfunction



