set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'               " leader cl = comment line - leader cu = uncomment line
Plugin 'bling/vim-airline'                      " sweet status bar
Plugin 'flazz/vim-colorschemes'                 " colorschemes
Plugin 'kchmck/vim-coffee-script'               " coffeescript syntax highlighting
Plugin 'airblade/vim-gitgutter'                 " shows git changes
Plugin 'tpope/vim-fugitive'                     " git commands in vim
Plugin 'yegappan/mru'                           " most recently used files
Plugin 'kien/ctrlp.vim'                         " shift r = change search type
Plugin 'terryma/vim-multiple-cursors'           " sublime style multi cursors
Plugin 'altercation/vim-colors-solarized.git'   " solarized colorscheme
" Plugin 'Shougo/neocomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" tell Vim where to look for tag file
set tags=./.tags,.tags;$HOME

" change leader - Must be before remaps that use it
let mapleader = "\<Space>"

" yay
imap jj <Esc>

" Leader AWESOME-O
"
" <Leader>p is mapped to CtrlP
"
" redraws the screen and removes any search highlighting.
nnoremap <silent> <Leader>l :nohl<CR><C-l>
" next tab
nnoremap <Leader>k :tabnext<CR>
" prev tab
nnoremap <Leader>j :tabprevious<CR>
" new tab
nnoremap <Leader>t :tabnew<CR>
" fast search prompt
nmap <Leader>o :/
" fast search & replace prompt
nmap <Leader>r :%s/\(<c-r>=expand("<cword>")<cr>\)/
" just quit damn you
nmap <Leader>q :q!<CR>
" save
nmap <Leader>w :w<CR>
" write quit
nmap <Leader>W :wq<CR>
" ctrlp tagsearch
nnoremap <leader>. :CtrlPTag<cr>
" copy selection before commenting out :)
map <Leader>Cl y gv <Leader>cl
" git status
nnoremap <Leader>1 :Gstatus<CR>
" git commit
nnoremap <Leader>2 :Gcommit<CR>
" git diff
nnoremap <Leader>3 :Gdiff<CR>

"folding settings
set nofoldenable        "dont fold by default
set foldmethod=indent   "fold based on indent
set foldlevel=1         "this is just what i use

" map common command errors
command WQ wq
command Wq wq
command W w
command Q q

set hlsearch        " highlight search
set incsearch       " Search stuff
set ignorecase      " Search stuff
set smartcase       " Search stuff
set autoindent
set nobackup
set nowritebackup
set history=50
set ruler
set cursorline
set showcmd
set laststatus=2
set encoding=utf-8
set clipboard=unnamed
set noswapfile

" show a vertial ruler
set colorcolumn=80

" display line numbers
set nu
" toggle line number
nnoremap <Leader>z :set nonumber!<CR>

" no pretty paste
set nopaste
" toggle pretty paste
nnoremap <Leader>x :set paste!<CR>

" turn off wordwrap
" set nowrap

" convert all tab into space
set et
ret!

"" Spelling
nmap <silent> <Leader>s :set spell!<CR>
set spelllang=en_US

" No tabs in the source file.
" All tab characters are 4 space characters.
set tabstop=4 shiftwidth=4 expandtab

" tell terminal to use 256 colors
" set t_co=256

"Add this to ~/.profile to get 256 color support
"if [ -e /usr/share/terminfo/x/xterm-256color ]; then
"  export TERM='xterm-256color'
"else
"  export TERM='xterm-color'
"fi

"" Solarized
" Make sure to set the terminal pallete to 'Solarized'
" http://ethanschoonover.com/solarized
syntax enable
colorscheme solarized
set background=dark
highlight clear SignColumn "so gitgutter looks right

"" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
" let g:airline_theme='simple'
let g:airline_theme='bubblegum'
" update font settings in terminal profile if using iTerm2 on mac
set guifont=Inconsolata\ for\ Powerline:h14
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  " unicode symbols
  " uncomment if Inconsolata font is not installed
  "let g:airline_left_sep = '»'
  "let g:airline_left_sep = '▶'
  "let g:airline_right_sep = '«'
  "let g:airline_right_sep = '◀'
  "let g:airline_symbols.linenr = '␊'
  "let g:airline_symbols.linenr = '␤'
  "let g:airline_symbols.linenr = '¶'
  "let g:airline_symbols.branch = '⎇'
  "let g:airline_symbols.paste = 'ρ'
  "let g:airline_symbols.paste = 'Þ'
  "let g:airline_symbols.paste = '∥'
  "let g:airline_symbols.whitespace = 'Ξ'
endif

"" GitGutter color settings
" an added line
highlight link GitGutterAdd DifAdd
" GitGutterChange       " a changed line
" GitGutterDelete       " at least one removed line
" GitGutterChangeDelete " a changed line followed by at least one removed line

"" white spaces per file type
" 2 spaes
autocmd Filetype html           setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby           setlocal ts=2 sts=2 sw=2
autocmd Filetype erb            setlocal ts=2 sts=2 sw=2
autocmd Filetype haml           setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml           setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee         setlocal ts=2 sts=2 sw=2
" 4 spaces
autocmd Filetype php            setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript     setlocal ts=4 sts=4 sw=4

" autocomplete for ruby and rails
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"" Store more MRU entries
let MRU_Max_Entries = 20

" CTRLP
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = "CtrlPMixed"
let g:ctrlp_working_path_mode = 'ra'
" Make CtrlP use ag to list the files. SO MUCH FASTER
"let g:ctrlp_user_commnad = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'targets': '\targets\/*$',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" for multicursor
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,.git,*.rbc,*.class
set wildignore+=.svn,vendor/gems/*,*.jpg,*.jpeg,*.jpeg*,*.png,*.gif
set wildignore+=*/public/uploads/*,*/.git/*,*/.bundle/*,*/bin/*,*/log/*
set wildignore+=*/tmp/*,*/.sass-cache/*,*/.jhw-cache/*,*/node_modules/*

"Remove delay after pressing escape and clearing the visual selection
set timeoutlen=1000 ttimeoutlen=0

" Dangerous, remove automatically all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Use neocomplete.vim
"let g:neocomplete#force_omni_input_patterns = {
"\   'ruby' : '[^. *\t]\.\|\h\w*::',
"\}
