set encoding=utf-8

" utilisation de vim plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Navigateur de fichiers
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" raccourcis pour gérer les " et '
Plug 'tpope/vim-surround'
" Autocomplétion via tab
Plug 'ervandew/supertab'
" affichages des couleurs dans leur couleur
Plug 'lilydjwg/colorizer'

" Navigateur entre les déclarations
"Plug 'vim-scripts/taglist.vim'
" http://vimawesome.com/plugin/tagbar
Plug 'majutsushi/tagbar'

" Barre de status
"Plug 'maciakl/vim-neatstatus'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

" Contrôle de la syntaxe des langages de programmation
" http://vimawesome.com/plugin/syntastic
Plug 'scrooloose/syntastic'

" Plugin emmet coding
" http://vimawesome.com/plugin/emmet-vim
Plug 'mattn/emmet-vim'

" DistractionFree
" http://vimawesome.com/plugin/goyo-vim
Plug 'junegunn/goyo.vim'
" Focus sur le paragraphe courant
" https://vimawesome.com/plugin/limelight-vim
Plug 'junegunn/limelight.vim'
" delte buffer without close windows
" https://vimawesome.com/plugin/vim-bbye
Plug 'gwww/vim-bbye'

" Amélioration des commentaires
" https://vimawesome.com/plugin/the-nerd-commenter
Plug 'scrooloose/nerdcommenter'

" Plugin d'interface avec git
"Plug 'tpope/vim-fugitive'

" Thème
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

" _____       _                 _   _
" /  __ \     | |               | | (_)
" | /  \/ ___ | | ___  _ __ __ _| |_ _  ___  _ __
" | |    / _ \| |/ _ \| '__/ _` | __| |/ _ \| '_ \
" | \__/\ (_) | | (_) | | | (_| | |_| | (_) | | | |
"  \____/\___/|_|\___/|_|  \__,_|\__|_|\___/|_| |_|
"
" Language haml sass scss
Plug 'tpope/vim-haml'
"Plug 'kchmck/vim-coffee-script' " CoffeScript
"Plug 'wavded/vim-stylus' " Stylus
"Plug 'evidens/vim-twig' " twig
Plug 'kylef/apiblueprint.vim' " API blueprint
Plug 'posva/vim-vue' " VueJs https://vimawesome.com/plugin/vim-vue-fearless
Plug 'http://git.doublepsi.fr/gen3se/ver8e.vim.git' " Ver8e


" Snippets
" http://vimawesome.com/plugin/ultisnips-forever-and-always
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Minimap
" https://vimawesome.com/plugin/vim-minimap
Plug 'severin-lemaignan/vim-minimap'


call plug#end()

" Paramétrage du theme gruvbox
"let g:gruvbox_italic=1
set background=dark
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italicize_comments=0

colorscheme gruvbox
"colorscheme wal

set history=1000
set autochdir

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection, plugins, and indentation

set hidden " allow hidden buffers

set wildmenu
set wildmode=list:longest,full

set backupdir=~/.local/share/vim
set directory=~/.local/share/vim
set nobackup
set nowritebackup
set noswapfile

set nocompatible

set number " numérotation des lignes
set mouse=r " Let the mouse work in the console
set showmatch
set ruler " Always show cursor
set cursorline " Met en surbrillance la ligne courante

" Affichage en permanence de la statusline
set laststatus=2

" Suppression de ce putain de bip
set noeb vb t_vb=

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

" folding manual
set foldmethod=manual

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

" ## Raccourcis

" NERDTree
map <F2> :silent NERDTreeToggle<CR>
" Toggle relative/absolute numbers
map <F3> :call NumberToggle()<CR>
" Navigator
nmap <F8> :TagbarToggle<CR>

map j gj
map k gk

set pastetoggle=<leader>p

set confirm

" when ~/.vimrc is changed, autoload
autocmd! BufWritePost .vimrc source %

nmap <silent> <leader>s :set nolist!<CR>

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
autocmd! FileType asciidoc set nospell nocindent noautoindent
" 4-space explicit
autocmd! FileType arduino,php,xml set nospell shiftwidth=4 softtabstop=4 tabstop=4
" 2-space
autocmd! FileType vhdl,javascript,scss,css,html,xhtml,yaml,stylus,vue set nospell shiftwidth=2 softtabstop=2 tabstop=2
" 8-space

" emmet coding configuration
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall
autocmd FileType php EmmetInstall

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

" Limelight
let g:limelight_conceal_ctermfg = 240

" Goyo
function! s:goyo_enter()
    silent !tmux set status off
    set lbr
    Limelight
    set noshowmode
    set noshowcmd
    set scrolloff=999
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    set nolbr
    set showmode
    set showcmd
    Limelight!
    set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


