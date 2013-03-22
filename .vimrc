if has("gui_running")
	set background=dark
	colorscheme solarized
    set lines=56 columns=120
endif

set gfn=Ubuntu\ Mono\ 11

filetype plugin on
filetype indent on
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch
set number "show line numbers

" Tab related
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set wrap

" Toolbar / tabs
if version >= 700
    "set showtabline to show when more than one tab
    set showtabline=1
    "set tab labels to show at most 20 characters
    set guitablabel=%-0.20t%M
endif

" don't show the toolbar in the GUI (only the menu)
set guioptions-=T

" don't show tear-off menus
set guioptions-=t

" Key Maps
nnoremap ` :noh<return>
vnoremap Y "+y
nnoremap P "+p
vnoremap g/ y/<C-R>"<CR>
nnoremap <C-Tab> :bnext<CR> 
nnoremap <C-S-Tab> :bprevious<CR> 

imap jj <Esc>

"javascript
au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-f> function () {<esc>hhi
