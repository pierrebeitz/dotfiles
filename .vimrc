""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Experimental
Plugin 'dyng/ctrlsf.vim'
Plugin 'ervandew/supertab'
Plugin 'joonty/vdebug'
Plugin 'justinmk/vim-sneak'
Plugin 'plasticboy/vim-markdown'
Plugin 'raimondi/delimitMate'
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'elmcast/elm-vim'
" Plugin 'Shougo/deoplete.nvim'
Plugin 'majutsushi/tagbar'
Plugin 'bitterjug/vim-tagbar-ctags-elm'
call vundle#end()


imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Section: Options {{{1
" ---------------------
colorscheme gruvbox
filetype plugin indent on
runtime macros/matchit.vim     " use % to jump between start/end of methods
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
let g:ackprg = 'ag --vimgrep'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'

let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"

let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

let g:markdown_fenced_languages = ['html', 'json', 'css', 'javascript', 'elm', 'vim']

let g:polyglot_disabled = ['elm']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:sneak#streak = 1

let g:tmux_navigator_no_mappings = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"



" Section: Mappins {{{3
" ---------------------
let mapleader = "\<Space>"

silent! map <leader>kb :NERDTreeToggle<CR>

" [s]trip [s]paces
noremap <leader>ss :%s/\s\+$//e<CR>

" edit vimrc
noremap <leader>ev :e ~/.vimrc<CR>
noremap <leader>ag :Ag<CR>
noremap <c-p> :Files<CR>

noremap <leader>tt :TagbarToggle<CR>

" execute file if we know how
noremap <leader>ee :call ExecuteFile(expand("%"))<cr>

noremap <leader>gds :Git! diff --staged --no-color<cr>
noremap <leader>gd  :Git! diff --no-color<cr>
noremap <leader>gg :Ggrep

" run test runner
noremap <leader>t :call RunTestFile()<cr>
noremap <leader>T :call RunNearestTest()<cr>

noremap <leader>kk :NERDTreeFind<CR>
noremap <leader>cb :center 80<cr>hhv0r-A <esc>40A-<esc>d80<bar>YppVr-kk.

" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e

" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

" start visual block
nmap <C-Up> <C-v><up>
nmap <C-Down> <C-v><down>
noremap  <silent> <C-S> :w<CR>
vnoremap <silent> <C-S> <C-C>:w<CR>
inoremap <silent> <C-S> <C-O>:w<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

inoremap jj <esc>
noremap  <c-q> :bd<CR>
nmap 0 ^

if bufwinnr(1)
  map - <C-W><
  map + <C-W>>
endif

" map . in visual mode
vnoremap . :norm.<cr>

" clear highlighting
nnoremap <silent> <Esc><Esc> :nohl<CR>

" Move around splits with <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLSF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec

nmap     <C-S-*> <Plug>CtrlSFCwordPath


" Section: CUSTOM CMDS {{{4
" ---------------------
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules --exclude=test



" Section: CUSTOM AUTOCMDS {{{5
" ---------------------
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  " open quickfix list when using Ggrep
  autocmd QuickFixCmdPost *grep* cwindow

  autocmd FileType ruby,haml,eruby,yaml,html,javascript,elm,sass,cucumber set ai sw=2 sts=2 et
	autocmd FileType css,sass,scss set omnifunc=csscomplete#CompleteCSS
  autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
  autocmd FileType help nnoremap <silent><buffer> q :q<CR>
  autocmd FileType * if exists("+omnifunc")     && &omnifunc     == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
  autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif

  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " strip trailing spaces on save #whitespace
  " autocmd BufWritePre * :%s/\s\+$//e

  " Leave the return key alone when in command line windows, since it's used to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  autocmd! BufNewFile,BufRead *.md setlocal ft= " *.md is markdown

  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

autocmd BufNewFile,BufRead *.md set spell | set lbr | set nonu

function! ExecuteFile(filename)
  :w
  :silent !clear
  if match(a:filename, '\.rb$') != -1
    exec ":!ruby " . a:filename
  elseif match(a:filename, '\.js$') != -1
    exec ":!node " . a:filename
  elseif match(a:filename, '\.sh$') != -1
    exec ":!bash " . a:filename
  else
    exec ":!echo \"Don't know how to execute: \"" . a:filename
  end
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUN TEST FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!bundle exec cucumber " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    if filereadable("bin/testrb")
      exec ":!bin/testrb " . a:filename
    else
      exec ":!ruby -Itest " . a:filename
    end
  else
    if filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction



" Section: Snippets {{{6
" ---------------------
" * update a lot of files: :args **/*.js | argdo %s/,\(\_\s*[\]})]\)/\1/ge | update




" Section: Weird Stuff {{{7
" ---------------------

" handle shift/ctrl-arrow in tmux
if !has('nvim')
  set term=screen-256color
endif


if &term =~ '^screen'
	" tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif


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

