" if Vundle is not installed, get it here:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'              " C+d opens/closes NT - shift a = full screen NT
Plugin 'scrooloose/nerdcommenter'         " ,cl = comment line - ,cu = uncomment line
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'                   " shift r = change search type
Plugin 'Shougo/neocomplete.vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'yegappan/mru'
Plugin 'altercation/vim-colors-solarized.git'


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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"

" map common command errors
command WQ wq
command Wq wq
command W w
command Q q

" show a vertial ruler
set colorcolumn=120

" display line numbers
set nu

" turn off wordwrap
set nowrap

" convert all tab into space
set et
ret!

" No tabs in the source file.
" All tab characters are 4 space characters. 
set tabstop=4 shiftwidth=4 expandtab

" change leader
let mapleader = ","

" tell terminal to use 256 colors
set t_Co=256

"Add this to ~/.profile to get 256 color support
"if [ -e /usr/share/terminfo/x/xterm-256color ]; then                                                                    
"  export TERM='xterm-256color'                                                                                          
"else                                                                                                                    
"  export TERM='xterm-color'                                                                                             
"fi  

colorscheme Monokai

" white spaces per file type
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype erb setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" tell nerdtree to close after file opens
" let NERDTreeQuitOnOpen = 1

" remap nerdtree toggle
nmap <silent> <C-D> :NERDTreeToggle<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'targets': '\targets\/*$',
  \ }
