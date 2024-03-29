
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
set nowritebackup
set noswapfile

" refreshing
set updatetime=400
set lazyredraw

" clear existing autocommands
autocmd!

" leader key
let mapleader = "\<Space>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""" vim-plug

call plug#begin()

" general
Plug 'itchyny/lightline.vim'              " status line
Plug 'mengelbrecht/lightline-bufferline'  " buffer line

" navigation
Plug 'preservim/nerdtree'                 " file browsing pane

" editing
Plug 'ConradIrwin/vim-bracketed-paste'    " improve pasting from outside vim
Plug 'tpope/vim-commentary'               " block commenting

" search
Plug 'nelstrom/vim-visual-star-search'    " search symbol under cursor or selection
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy search of anything
Plug 'junegunn/fzf.vim'                   " see ':h fzf-vim'

" git
Plug 'tpope/vim-fugitive'                 " git integration

" color
Plug 'aonemd/kuroi.vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Debugging

let g:vimspector_enable_mappings = 'HUMAN'


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Colors

set termguicolors
syntax on
set background=dark
colorscheme kuroi


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Git

nnoremap <Leader>g :Git<CR>

let g:signify_disable_by_default = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Nerd Tree / FZF Files

map <Leader>f :NERDTreeToggle<CR>
map <Leader>F :FZF<CR>

let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Terminal

nnoremap <Leader>t :vert term<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""" General Editing

" backspace fix
set backspace=indent,eol,start

" yank to clipboard
set clipboard=unnamed

" scrolling with mouse wheel
set mouse=a

" tab completion
set wildmenu
set wildmode=longest,list,full

" Disable function highlighting (affects both C and C++ files)
"let g:cpp_no_function_highlight = 0

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
"let g:cpp_simple_highlight = 0

" see https://github.com/bfrg/vim-cpp-modern
let c_no_curly_error = 1

" default encoding
set encoding=utf-8

" don't fake line breaks when there aren't
set nowrap
set textwidth=100

" set indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" cursorline
set cursorline

" disable line numbering
set nonumber

" move also between lines
set whichwrap=h,l,~,[,]

" always enable sign column
set signcolumn=yes


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

" Close current buffer
nnoremap <Leader>w :bp\|bd #<CR>

" Close all buffers but current one
nnoremap <Leader>e :%bd\|e#\|bd#<CR>

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Status Line

" statusline always shown
set laststatus=2

" tabline always shown
set showtabline=2

" disable native mode status
set noshowmode

" git file path is shown where possible, absolute path otherwise
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline                  = {'colorscheme':'onehalfdark'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.component_function = {'filename': 'LightlineFilename'}

let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'

