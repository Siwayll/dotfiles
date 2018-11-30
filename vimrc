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

" Barre de status
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

Plug 'godlygeek/tabular' " https://vimawesome.com/plugin/tabular

Plug 'jceb/vim-orgmode', {'for':'org'} " https://vimawesome.com/plugin/vim-orgmode
Plug 'tpope/vim-speeddating', {'for':'org'} " https://vimawesome.com/plugin/speeddating-vim
Plug 'mattn/calendar-vim', {'for':'org'}


" Thème
"Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

"  _____       _                 _   _
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

call plug#end()


" orgMod configuration
let maplocalleader = "="
let g:org_todo_keywords = [
            \ ['TODO(t)', '|', 'DONE(d)'],
            \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
            \ ['CANCELED(c)'],
            \ ['ASK(a)', '|', 'SENDED(s)', 'ANSWERED']
            \]

" Paramétrage du theme gruvbox
"let g:gruvbox_italic=1
"set background=dark
"let g:gruvbox_contrast_dark='medium'
"let g:gruvbox_italicize_comments=0

colorscheme challenger_deep

set history=1000
set autochdir

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection, plugins, and indentation

let g:lightline = {
    \ 'colorscheme': 'challenger_deep',
    \ 'active': {
    \   'left'  : [ [ 'mode', 'paste' ] ],
    \   'right' : [ [ 'lineinfo' ], [ 'percent' ] ]
    \ },
\ }

set laststatus=2 " Affichage en permanence de la statusline
set noshowmode

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
set noeb vb t_vb= " Suppression de ce putain de bip
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
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set cindent
set smartindent
set autoindent

" folding manual
set foldmethod=indent

set hlsearch
set incsearch

" Affichage des espaces en fin de ligne et des tabulations
set listchars=tab:→\ ,trail:·
set list

set colorcolumn=80

" ## Mapping !

" NERDTree
map <F2> :silent NERDTreeToggle<CR>
" Toggle relative/absolute numbers
map <F3> :call NumberToggle()<CR>
map <F8> :TagbarToggle<CR>

map j gj
map k gk

let mapleader = "&"
imap <leader>; <Esc>$a;
imap <leader>: <Esc>$a:
imap <leader>. <Esc>$a.
imap <leader>, <Esc>$a,
imap <leader>) <Esc>$a)
imap <leader>- <Esc>$a->
imap <leader>$ $this->
imap <leader>f function

if has('nvim')
    " remap sortie du terminal par <Esc>
    tnoremap <Esc> <C-\><C-n>
endif

if exists(":Tabularize")
    vmap <leader>t= :Tabularize /=<CR>
    vmap <leader>t: :Tabularize /:\zs<CR>
endif

set pastetoggle=<leader>p

set confirm

" when ~/.vimrc is changed, autoload
autocmd! BufWritePost .vimrc source %

" autorun files
set autowrite
command! -buffer W make

au BufNewFile,BufRead *.md set filetype=markdown

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
    set cursorline!
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    set nolbr
    set showmode
    set showcmd
    Limelight!
    set scrolloff=5
    set cursorline
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


