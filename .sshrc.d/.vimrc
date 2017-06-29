""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" Section: Options {{{1
" ---------------------
filetype plugin indent on
set autowrite
set background=dark
set clipboard=unnamed,unnamedplus      " use the system clipboard
set cursorline                 " highlight current line
set dir=/tmp
set expandtab                  " use spaces, not tab characters
set hidden                     " allow unsaved background buffers and remember marks/undo for them
set hlsearch                   " highlight all search matches
set ignorecase smartcase       " ignore case in search
set lazyredraw                 " redraw only when we need to.
set mouse=a                    " enable mouse support
set nobackup                   " Don't make backups at all
set nocompatible               " don't need to be compatible with old vim
set nofoldenable               " disable code folding
set nojoinspaces               " Insert only one space when joining lines that contain sentence-terminating
set noshowmode                 " disabled vims builtin mode-indicator (lightline ftw)
set nowritebackup              " Don't make backups at all
set number                     " show line numbers
set path+=**                   " for file autocompletion
set shiftwidth=2
set showcmd                    " display incomplete commands
set showmatch                  " show bracket matches
set smartcase                  " pay attention to case when caps are used
set splitbelow
set splitright
set swapfile
set t_ti= t_te=                " Prevent Vim from clobbering the scrollback buffer. See
set ts=2                       " set indent to 2 spaces
set vb                         " enable visual bell (disable audio bell)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/build/*,*/elm-stuff/*,*/build/*
set wildmode=list:longest,full
syntax on                      " show syntax highlighting

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/



" Section: Plugin Options {{{2
" ---------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Section: Mappins {{{3
" ---------------------
let mapleader = "\<Space>"

" [s]trip [s]paces
noremap <leader>ss :%s/\s\+$//e<CR>

" start visual block
nmap <C-Up> <C-v><up>
nmap <C-Down> <C-v><down>
noremap  <silent> <C-S> :w<CR>
vnoremap <silent> <C-S> <C-C>:w<CR>
inoremap <silent> <C-S> <C-O>:w<CR>

inoremap jj <esc>
noremap  <c-q> :bd<CR>
nmap 0 ^

" Move around splits with <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l


if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
