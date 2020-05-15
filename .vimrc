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

" linting
Plug 'dense-analysis/ale'                 " linting engine

" editing
Plug 'ConradIrwin/vim-bracketed-paste'    " improve pasting from outside vim
Plug 'tpope/vim-commentary'               " block commenting

" search
Plug 'nelstrom/vim-visual-star-search'    " search symbol under cursor or selection
Plug 'junegunn/fzf'                       " fuzzy search of anything
Plug 'junegunn/fzf.vim'                   " see ':h fzf-vim'

" git
Plug 'tpope/vim-fugitive'                 " git integration

" color
Plug 'aonemd/kuroi.vim'
Plug 'dracula/vim'

" TRY THIS OUT WHEN UNIVERSAL CTAGS (MACPORTS) COMES WITH PYTHON38 SUPPORT
" Plug 'majutsushi/tagbar'

" completion engine (try again some other time)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" code completion
Plug 'ycm-core/YouCompleteMe'

call plug#end()

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Colors

set termguicolors
set background=dark

colorscheme kuroi
"colorscheme zenburn
"colorscheme dracula


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Git

nnoremap <Leader>g :Git<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Nerd Tree

map <Leader>f :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Terminal

nnoremap <Leader>t :vert term<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""" General Editing

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

" Close buffers
nnoremap <Leader>w :bp\|bd #<CR>

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Sign Column

set signcolumn=yes


""""""""""""""""""""""""""""""""""""""""""""""""""""""" Status Line

" statusline always shown
set laststatus=2

" tabline always shown
set showtabline=2

" disable native mode status
set noshowmode

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline                  = {'colorscheme':'one'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.component_function = {'filename': 'LightlineFilename'}

let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'

