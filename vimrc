" Initialize Vundle (plugin manager)
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin Declarations
Plugin 'gmarik/Vundle.vim' " Vundle itself
Plugin 'ycm-core/YouCompleteMe' " Advanced code completion.
Plugin 'octol/vim-cpp-enhanced-highlight' " Enhanced C++ syntax highlighting.
Plugin 'dense-analysis/ale' " Linting and syntax checking.
Plugin 'arrufat/vala.vim' " Vala language support.
Plugin 'fatih/vim-go' " Go language support.
Plugin 'rust-lang/rust.vim' " Rust language support.
Plugin 'scrooloose/nerdcommenter' " Easy code commenting.
Plugin 'flazz/vim-colorschemes' " Collection of color schemes.
Plugin 'airblade/vim-gitgutter' " Shows git diff in the gutter.
Plugin 'yegappan/mru' " Most recently used files list.
Plugin 'kien/ctrlp.vim' " Full path fuzzy file finder.
Plugin 'vim-scripts/BufOnly.vim' " Close all buffers but the current one.
Plugin 'tpope/vim-endwise' " Automatically closes blocks and statements.
Plugin 'mbbill/undotree' " Visualize Vim's undo history.
Plugin 'ap/vim-css-color' " CSS color previewing.

" Load the plugins
call vundle#end()

" Filetype detection
filetype plugin indent on    " required

" Core Settings
set backspace=2
syntax enable
set background=dark
set t_Co=256
if has("termguicolors")
    set termguicolors
endif

" Set color scheme
colorscheme monokai-chris

" Workaround a problem with background color of vim-gitgutter.
" https://github.com/airblade/vim-gitgutter/issues/696
highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SignColumn LineNr

" Additional Core Settings
set history=50                " Maximum number of lines for command-line history.
set ruler                     " Show the cursor position all the time.
set cursorline                " Highlight the current line.
set showcmd                   " Show incomplete commands in the last line of the screen.
set laststatus=2              " Always display the status line at the bottom.
set encoding=utf-8            " Set character encoding to UTF-8 for international support.
set clipboard=unnamed         " Use system clipboard for copy-paste operations.
set noswapfile                " Disable swap file creation to prevent conflicts.
set colorcolumn=80,120        " Highlight columns 80 and 120 to visually indicate code width.
set nu                        " Display line numbers on the left.
set nopaste                   " Disable paste mode to prevent unexpected formatting.
set nowrap                   " Disable line wrapping for long lines.
set et                        " Use expandtab to insert spaces instead of tabs.
set tabstop=2 shiftwidth=2 expandtab  " Set tab behavior: 2 spaces, 2 spaces for indentation, expand tabs to spaces.
let mapleader = "\<Space>"    " Define leader key as the spacebar.

" Key Mappings
imap jj <Esc>                  " Exit insert mode by typing "jj" quickly.
nmap <silent> <Leader>0 :set paste!<CR>        " Toggle paste mode for pasting text.
nmap <silent> <Leader>1 :Gstatus<CR>           " Open Git status window.
nmap <silent> <Leader>2 :Gcommit<CR>           " Open Git commit window.
nmap <silent> <Leader>3 :Gdiff<CR>             " Open Git diff view.
nmap <silent> <Leader>5 :RuboCop<CR>           " Run RuboCop linter for Ruby.
nmap <silent> <Leader>8 :set nonumber!<CR>     " Toggle line numbering.
nmap <silent> <Leader>9 :set nowrap!<CR>       " Toggle line wrapping.
nmap <silent> <Leader>+ :TestFile<CR>          " Run tests for current file.
nmap <silent> <Leader>_ :TestNearest<CR>       " Run tests for nearest test block or function.
nmap <silent> <Leader>a <C-f>                  " File search using Ctrl-F (fuzzy file finder).
nmap <silent> <Leader>Cl y gv <Leader>cl       " Copy current line, yank it, and highlight copied text.
nmap <silent> <Leader>d <Plug>DashSearch       " Initiate Dash search for word under cursor.
nmap <silent> <Leader>e :UndotreeToggle<CR>    " Toggle display of Vim's undo history tree.
nmap <silent> <Leader>g :execute "tabmove" tabpagenr() -2<CR>  " Move to previous tab in Vim.
nmap <silent> <Leader>h :%!clang-format<CR>    " Format current C/C++ code using clang-format.
nmap <silent> <Leader>i *                      " Initiate search for word under cursor.
nmap <silent> <Leader>j :tabprevious<CR>       " Switch to previous tab in Vim.
nmap <silent> <Leader>k :tabnext<CR>           " Switch to next tab in Vim.
nmap <silent> <Leader>l :nohl<CR><C-l>         " Clear search highlighting and redraw the screen.
nmap <silent> <Leader>o :/                     " Initiate forward search with "/" key.
nmap <silent> <Leader>p :CtrlPMixed<CR>        " Activate CtrlP mixed mode for fuzzy file searching.
nmap <silent> <Leader>q :q!<CR>                " Quit Vim without saving changes.
nmap <silent> <Leader>r :%s/\(<c-r>=expand("<cword>")<CR>\)/  " Search and replace for word under cursor.
nmap <silent> <Leader>s <C-b>                  " Scroll screen up by one screenful.
nmap <silent> <Leader>S :sp                   " Split current window horizontally.
nmap <silent> <Leader>t :tabnew<CR>            " Open a new tab in Vim.
nmap <silent> <Leader>T :BufOnly<CR>           " Close all buffers except the current one.
nmap <silent> <Leader>v :NERDTreeToggle<CR>    " Toggle the NERDTree file explorer.
nmap <silent> <Leader>w :w<CR>                 " Save the current file.
nmap <silent> <Leader>W :wq<CR>                " Save the current file and quit Vim.
nmap <silent> <Leader>z <C-z>                 " Suspend Vim and return to the terminal.
nnoremap <Leader>; :                          " Execute a command-line command when leader key followed by a semicolon is pressed.

" Additional custom settings
" Add any custom commands or settings here

let g:ycm_confirm_extra_conf = 0 " turn off the prompts generated by YouCompleteMe (YCM) 

" Disable specific linters (add as needed)
let g:ale_linters = {
    \ 'c': ['clang'],
    \ 'cpp': ['clang'],
    \ 'python': ['pylint'],
    \ 'go': ['golangci-lint'],
    \ 'javascript': ['eslint'],
    \ 'ruby': ['rubocop'],
    \ 'vala': ['valac'],
    \ 'bash': ['shellcheck'],
    \ }

" Set ALE options (customize as needed)
let g:ale_sign_error = '✘'  " Symbol for error signs
let g:ale_sign_warning = '⚠'  " Symbol for warning signs

" Configure ALE for C++ code formatting
let g:ale_cpp_clang_format_executable = 'clang-format'

" Set filetype-specific ALE settings
augroup ale_settings
    autocmd!
    autocmd FileType c,cpp,objc,c-header,cpp-header let b:ale_linters = ['clang']
    autocmd FileType c,cpp,objc,c-header,cpp-header let b:ale_linters_explicit = 1
    autocmd FileType c,cpp,objc,c-header,cpp-header let b:ale_fixers = ['clang-format']
    autocmd FileType bash let b:ale_linters = ['shellcheck'] " ShellCheck for Bash scripts
augroup END

