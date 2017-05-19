set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set backspace=2

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'               " leader cl = comment line - leader cu = uncomment line
Plugin 'bling/vim-airline'                      " sweet status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'                 " colorschemes
Plugin 'kchmck/vim-coffee-script'               " coffeescript syntax highlighting
Plugin 'airblade/vim-gitgutter'                 " shows git changes
Plugin 'tpope/vim-fugitive'                     " git commands in vim
Plugin 'yegappan/mru'                           " most recently used files
Plugin 'kien/ctrlp.vim'                         " shift r = change search type
Plugin 'terryma/vim-multiple-cursors'           " sublime style multi cursors
Plugin 'altercation/vim-colors-solarized.git'   " solarized colorscheme
Plugin 'ngmy/vim-rubocop'                       " Ruby linter
Plugin 'vim-scripts/BufOnly.vim'                " Close all other buffers
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'heartsentwined/vim-emblem'
Plugin 'mkarmona/colorsbox'
Plugin 'mbbill/undotree'
Plugin 'janko-m/vim-test'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

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
set background=dark
highlight clear SignColumn "so gitgutter looks right

" trying this color scheme for now
" colorscheme solarized
" colorscheme Tomorrow-Night
" colorscheme gruvbox
" if !has("gui_running")
"   let g:gruvbox_italic=0
" endif
colorscheme colorsbox-stnight

" tell terminal to use 256 colors
set t_Co=256

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
map <Leader>_ :TestNearest<CR>
map <Leader>+ :TestFile<CR>

" copy selection before commenting out :)
map <Leader>Cl y gv <Leader>cl
" just quit damn you
nmap <silent> <Leader>q :q!<CR>
" save
nmap <silent> <Leader>w :w<CR>
" write quit
nmap <silent> <Leader>W :wq<CR>
" switch to shell
nmap <silent> <Leader>z <C-z>
" fast search prompt
nmap <Leader>o :/
" fast search & replace prompt
nmap <Leader>r :%s/\(<c-r>=expand("<cword>")<CR>\)/
" ctrlp tagsearch
nnoremap <leader>. :CtrlPTag<CR>
" redraws the screen and removes any search highlighting.
nnoremap <silent> <Leader>l :nohl<CR><C-l>
" next tab
nnoremap <silent> <Leader>k :tabnext<CR>
" prev tab
nnoremap <silent> <Leader>j :tabprevious<CR>
" new tab
nnoremap <silent> <Leader>t :tabnew<CR>
" move tab left
nnoremap <silent> <Leader>g :execute "tabmove" tabpagenr() -2<CR>
" move tab right
nnoremap <silent> <Leader>h :execute "tabmove" tabpagenr()<CR>
" close all other buffers
nnoremap <silent> <Leader>T :BufOnly<CR>
" git status
nnoremap <silent> <Leader>1 :Gstatus<CR>
" git commit
nnoremap <silent> <Leader>2 :Gcommit<CR>
" git diff
nnoremap <silent> <Leader>3 :Gdiff<CR>
" page down
nnoremap <silent> <Leader>a <C-f>
" page up
nnoremap <silent> <Leader>s <C-b>
" start Rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>5 :RuboCop<CR>
" toggle line number
nnoremap <silent> <Leader>8 :set nonumber!<CR>
" toggle line wrap
nnoremap <silent> <Leader>9 :set nowrap!<CR>
" toggle pretty paste
nnoremap <silent> <Leader>0 :set paste!<CR>
" lazy colon
nnoremap <Leader>; :
" lazy hi-light
nnoremap <Leader>i *
" toggle Nerdtree window
nnoremap <silent><Leader>v :NERDTreeToggle<CR>
" toggle Undotree window
nnoremap <silent> <Leader>e :UndotreeToggle<CR>
" Dash search
nmap <silent> <leader>d <Plug>DashSearch

"non leader mappings

" replay macro
nmap Q @q

" map save to enter key in normal mode
" noremap <CR> :w<CR>

"folding settings
set nofoldenable        "dont fold by default
set foldmethod=indent   "fold based on indent
set foldlevel=1         "this is just what i use

" map common command errors
command! WQ wq
command! Wq wq
command! W w
command! Q q

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

" show a vertical ruler
set colorcolumn=80,120

" display line numbers
set nu

" no pretty paste
set nopaste

" convert all tab into space
set et
ret!

" No tabs in the source file.
" All tab characters are 4 space characters.
set tabstop=2 shiftwidth=2 expandtab

"" Powerline
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
" 2 spaces
autocmd Filetype md             setlocal ts=2 sts=2 sw=2
autocmd Filetype txt            setlocal ts=2 sts=2 sw=2
autocmd Filetype html           setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby           setlocal ts=2 sts=2 sw=2
autocmd Filetype erb            setlocal ts=2 sts=2 sw=2
autocmd Filetype haml           setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml           setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee         setlocal ts=2 sts=2 sw=2
autocmd Filetype scss           setlocal ts=2 sts=2 sw=2
autocmd Filetype css            setlocal ts=2 sts=2 sw=2
autocmd Filetype lua            setlocal ts=2 sts=2 sw=2
" 4 spaces
autocmd Filetype php            setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript     setlocal ts=4 sts=4 sw=4

" autocomplete for ruby and rails
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"" Store more MRU entries
let MRU_Max_Entries = 30

" CTRLP
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = "CtrlPMixed"
let g:ctrlp_match_window = 'botom,order:btt,min:1,max:20,results:20'
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
set wildignore+=*/public/uploads/*,*/.git/*,*/.bundle/*,*/bin/*,*/log/*,*/doc/*
set wildignore+=*/tmp/*,*/.sass-cache/*,*/.jhw-cache/*,*/node_modules/*

"Remove delay after pressing escape and clearing the visual selection
set timeoutlen=1000 ttimeoutlen=0

" Dangerous, remove automatically all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" open all files in folder
":args /path_to_dir/** | tab all

" Rename files (warning: saves new file in cwd)
command! -bar -nargs=1 -bang -complete=file Rename :
  \ let s:file = expand('%:p') |
  \ setlocal modified |
  \ keepalt saveas<bang> <args> |
  \ if s:file !=# expand('%:p') |
  \   call delete(s:file) |
  \ endif |
  \ unlet s:file

" autoload vimrc ;D
" thanks http://stackoverflow.com/a/2403926/1491929
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" epic - auto toggle paste
" thanks! https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
