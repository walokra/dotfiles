" Use the Solarized Dark theme
set background=dark
colorscheme solarized
"colorscheme badwolf
"colorscheme darkburn
"colorscheme molokai
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" autoload plugins
"call pathogen#infect()
"filetype plugin indent on

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Backspace and wrapping
set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
"set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
"set nowrap                      " defaults to line nowrap, ctrl-p toggles
"nmap <silent> <C-P> :set nowrap!<CR>:set nowrap?<CR>

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Programming
so $VIMRUNTIME/syntax/syntax.vim "load syntax files
syntax on                       "syn:   syntax highlighting
"set cindent                     "cin:   enables automatic indenting c-style
"set cinoptions=(0,l1,j1         "cino:  affects the way cindent reindents lines
"set showmatch                   "sm:    flashes matching brackets or parenthasis
"set matchtime=3
"set listchars=tab:>-,eol:$      "lcs:   makes finding tabs easier during `set list`

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Search
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set incsearch                   " Highlight dynamically as pattern is typed.
set hlsearch                    "hls:   highlights search results; ctrl-n or :noh to unhighlight
"set nohlsearch                 "do not highlight words when searching for them. it's distracting.
set wrapscan                    " Searches wrap around end of file
nmap <silent> <C-N> :silent noh<CR>

" HUD and Status info
set showmode                    "smd:   shows current vi mode in lower left
set showcmd                     "sc:    shows typed commands
set cmdheight=1                 "ch:    make a little more room for error messages
set scrolloff=3                 "so:    places a couple lines between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple lines between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
set number                      "nu: 	Enable line numbers.
set ruler                       "nu:    Show the cursor position
"set showtabline=2               " Always show tab bar.
set title                       " Show the filename in the window titlebar.
set cursorline                  " Highlight current line

" Status Line
" hi User1 guibg=#455354 guifg=fg      ctermbg=238 ctermfg=fg  gui=bold,underline cterm=bold,underline term=bold,underline
" hi User2 guibg=#455354 guifg=#CC4329 ctermbg=238 ctermfg=196 gui=bold           cterm=bold           term=bold
" set statusline=[%n]\ %1*%<%.99t%*\ %2*%h%w%m%r%*%y[%{&ff}→%{strlen(&fenc)?&fenc:'No\ Encoding'}]%=%-16(\ L%l,C%c\ %)%P
"let g:Powerline_symbols = 'fancy'

" statusline fix
"hi statusline ctermbg=Black

"set guioptions=grLt

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Mappings

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
" map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" tap F5 to toggle highlighting the search terms on and off
nnoremap <silent><F5> :set hlsearch!<CR>
" tap F3 to toggle line numbers
"nnoremap <silent><F3> :set number!<CR>
" tap Ctrl-L to toggle line numbers
nnoremap <C-L> :set number!<CR>
