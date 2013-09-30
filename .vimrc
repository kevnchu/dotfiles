set nocompatible

" Pathogen
execute pathogen#infect()

if has("gui_running")
	set background=dark
	colorscheme solarized
    set lines=56 columns=120
    au VimResized * wincmd =
    se guioptions=agim
    " for some reason this keymap causes issues in terminal vim.
    nnoremap <esc> :noh<return><esc>
endif

set gfn=Ubuntu\ Mono\ 13

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

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


" CtrlP plugin
"set runtimepath^=~/.vim/bundle/ctrlp.vim
set noautochdir
let g:ctrlp_working_path_mode = 'a'

" use manual folding
set fdm=manual

" Key Maps
nmap <F1> <nop>
nmap j gj
nmap k gk
nnoremap ` <nop>
vnoremap Y "+y
nnoremap P "+p
vnoremap g/ y/<C-R>"<CR>
nnoremap <C-Tab> :bnext<CR> 
nnoremap <C-S-Tab> :bprevious<CR> 
map Q <Nop>

imap jj <Esc>

" remap ctrl s to save.
nnoremap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

"ruby
au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2

"javascript
au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-c> // TODO <esc>
au FileType javascript imap <c-x> // XXX <esc>
au FileType javascript imap <c-f> function () {<esc>hhi
au FileType javascript map <LocalLeader>/ :call GenerateDOCComment()<cr>

function! GenerateDOCComment()
    let l    = line('.')
    let i    = indent(l)
    let pre  = repeat(' ',i)
    let text = getline(l)
    let params   = matchstr(text,'([^)]*)')
    let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
    echomsg params
    let vars = []
    let m    = ' '
    let ml = matchlist(params,paramPat)
    while ml!=[]
        let [_,var;rest]= ml
        let vars += [pre.' * @param {} '.var]
        let ml = matchlist(rest,paramPat,0)
    endwhile
    let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
    call append(l-1,comment)
    call cursor(l+1,i+3)
endfunction
