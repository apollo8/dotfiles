""""""""""""""""""""""""""""""""""""""""""""""""""""""" General VIM

" don't require vi compatibility
set nocompatible

" This option forces Vim to source .vimrc file if it present in working
" directory, thus providing a place to store project-specific configuration.
set exrc

" This option will restrict usage of some commands in non-default .vimrc files;
" commands that write to file or execute shell commands are not allowed and map
" commands are displayed.
set secure

" no files can override this .vimrc
set nomodeline

" backup options
set nobackup
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Vundle and Plugin Options

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required

Plugin 'tpope/vim-fugitive'                 " git integration
Plugin 'dense-analysis/ale'                 " linting engine
Plugin 'preservim/nerdtree'                 " file browsing pane
Plugin 'ConradIrwin/vim-bracketed-paste'    " improve pasting from outside vim
Plugin 'nelstrom/vim-visual-star-search'    " search symbol under cursor or selection
Plugin 'tpope/vim-commentary'               " block commenting
Plugin 'terryma/vim-multiple-cursors'       " multi-location editing
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'                       " fuzzy search
Plugin 'junegunn/fzf.vim'

" color schemes
Plugin 'aonemd/kuroi.vim'
Plugin 'dracula/vim'

" code completion
Bundle 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Status Line

" statusline always shown
set laststatus=2

" lightline options
let g:lightline = { 'colorscheme': 'one' }
set noshowmode


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Colors

set termguicolors
set background=dark

colorscheme kuroi
"colorscheme zenburn
"colorscheme dracula


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Nerd Tree

map <C-o> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""" General Editing

" clear existing autocommands
autocmd!

" Cursor Mode Settings
" 1 -> blinking block
" 2 -> solid block 
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" backspace fix
set backspace=1
set backspace=indent,eol,start

" yank to clipboard
set clipboard=unnamed

" scrolling with mouse wheel
set mouse=a

" tab completion
set wildmenu
set wildmode=longest,list,full

" turn syntax highlighting on
syntax on

" default encoding
set encoding=utf-8

" don't fake line breaks when there aren't
set nowrap
set tw=100

" set indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent

" cursorline
set cursorline

" disable line numbering
set nonumber

" move also between lines
set whichwrap=h,l,~,[,]


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Splits and Buffers

set splitbelow
set splitright

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Cycle through buffers with tab / shift-tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" allow to switch buffers also if current one has unsaved changed
set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Searching

" set incremental search
set incsearch

" make searches case-insensitive, unless they contain upper-case letters
set ignorecase
set smartcase

" highlight search
set hlsearch

"remove search highlight
nnoremap <S-q> :nohlsearch<CR>

"start a search query by pressing \
nnoremap \  :Ag<cR>

"search for word under cursor by pressing |
nnoremap \| :Ag <C-R><C-W><cr>:cw<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Language Specifics

" set auto indentation for C-like code
autocmd FileType c,cpp,slang set cindent

" in Makefiles, actual tabs are needed
autocmd FileType make set noexpandtab shiftwidth=8

" python stuff
let python_highlight_all = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Linting

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0

let g:ale_sign_error = 'E '
let g:ale_sign_info = 'W '
let g:ale_sign_warning = 'I '

