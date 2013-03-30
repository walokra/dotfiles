" .vimrc

" Make vim more useful 
set nocompatible "cp:    turns off strct vi compatibility
set vb           "turn on the "visual bell" - which is much quieter than the "audio blink"
set noerrorbells " Disable error bells.
set background=dark

colorscheme badwolf
"colorscheme darkburn
"colorscheme molokai

set t_Co=256

" Change mapleader
let mapleader=","

" Tabs and indenting
set autoindent                  " Copy indent from last line when starting new line.
"set smarttab                   "sta:   helps with backspacing because of expandtab
"set expandtab                  "et:    uses spaces instead of tab characters
set tabstop=4                   "ts:    number of spaces that a tab counts  for
set shiftwidth=4                "sw:    number of spaces to use for autoindent
"set ai                         " set auto-indenting on for programming

" Backspace and wrapping
set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
set nowrap                      " defaults to line nowrap, ctrl-p toggles
nmap <silent> <C-P> :set nowrap!<CR>:set nowrap?<CR>

" Programming
so $VIMRUNTIME/syntax/syntax.vim "load syntax files
syntax on                       "syn:   syntax highlighting
set cindent                     "cin:   enables automatic indenting c-style
set cinoptions=(0,l1,j1         "cino:  affects the way cindent reindents lines
set showmatch                   "sm:    flashes matching brackets or parenthasis
set matchtime=3
set listchars=tab:>-,eol:$      "lcs:   makes finding tabs easier during `set list`
" do NOT put a carriage return at the end of the last line! if you are programming
" for the web the default will cause http headers to be sent. that's bad.
set binary noeol

set diffopt=filler              " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite             " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb       " BOM often causes trouble
set esckeys                     " Allow cursor keys in insert mode.

" Folding. zi toggles, spacebar expands
"set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
" set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=syntax " Markers are used to specify folds.
"set foldmethod=marker
noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level

set history=1000 " Increase history from 20 default to 1000

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
"set nu                          " Enable line numbers.
set ruler                       "nu:    Show the cursor position
"set showtabline=2               " Always show tab bar.
"set title                       " Show the filename in the window titlebar.
set cursorline                  " Highlight current line

" Status Line
" hi User1 guibg=#455354 guifg=fg      ctermbg=238 ctermfg=fg  gui=bold,underline cterm=bold,underline term=bold,underline
" hi User2 guibg=#455354 guifg=#CC4329 ctermbg=238 ctermfg=196 gui=bold           cterm=bold           term=bold
" set statusline=[%n]\ %1*%<%.99t%*\ %2*%h%w%m%r%*%y[%{&ff}→%{strlen(&fenc)?&fenc:'No\ Encoding'}]%=%-16(\ L%l,C%c\ %)%P
let g:Powerline_symbols = 'fancy'

set guioptions=grLt

" Miscellanous
set shortmess=atI               " Don't show the intro message when starting vim.
set winminheight=0              "Allow splits to be reduced to a single line.
set viminfo='500,f1,:100,/100   " For a nice, huge viminfo file.

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Menu completion
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu              "wmnu: Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
"set wildmode=longest:full,list:full  "wim:   helps wildmenu auto-completion

" Mappings
" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
" map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Toggle folds (<Space>)
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Rainbow Parenthesis
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" tap F5 to toggle highlighting the search terms on and off
nnoremap <silent><F5> :set hlsearch!<CR>

" tap F3 to toggle line numbers
nnoremap <silent><F3> :set number!<CR>

" rewrap
map q gq}

" Timestamp
map ,t    :.!timestamp^M

" firefox-like tab shortcuts
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>

