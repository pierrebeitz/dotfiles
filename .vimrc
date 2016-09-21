""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin 'tpope/somePlugin'                    " GitHub repo
" Plugin 'L9'                                  " from http://vim-scripts.org/vim/scripts.html
" Plugin 'git://git.wincent.com/somePlu-t.git' " Git plugin not hosted on GitHub
" Plugin 'file:///home/gmarik/path/to/plugin'  " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}   " Pass the path to set the runtimepath properly.
" Plugin 'ascenator/L9', {'name': 'newL9'}     " Install L9 and avoid a Naming conflict if you've already installed a different version somewhere else.

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

set nocompatible                  " be iMproved, required
filetype off                      " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dyng/ctrlsf.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/tabular'
"Plugin 'gregsexton/gitv'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
"Plugin 'junegunn/vim-easy-align'
Plugin 'justinmk/vim-sneak'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'morhetz/gruvbox'
Plugin 'raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'severin-lemaignan/vim-minimap'
Plugin 'sheerun/vim-polyglot'
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'yggdroot/indentLine'
Plugin 'elmcast/elm-vim'
call     vundle#end()

nnoremap <leader>gr :Git! diff --staged --no-color<cr>

nnoremap <A-]> >>
nnoremap <A-[> <<
vnoremap <A-]> >gv
vnoremap <A-[> <gv

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" open quickfix list when using Ggrep
autocmd QuickFixCmdPost *grep* cwindow

nnoremap <F5> :GundoToggle<CR>

"let base16colorspace=256
let g:sneak#streak = 1

let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'

let g:miniBufExplBRSplit = 0

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

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

filetype plugin indent on    " required

noremap  <silent> <C-S> :w<CR>
vnoremap <silent> <C-S> <C-C>:w<CR>
inoremap <silent> <C-S> <C-O>:w<CR>
"nnoremap <leader>ss :mksession<CR>

noremap  <c-q> :bd<CR>
nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/

inoremap jj <esc>

set swapfile
set dir=/tmp

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/build/*,*/elm-stuff/*,*/build/*

if bufwinnr(1)
  map - <C-W><
  map + <C-W>>
endif

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
runtime macros/matchit.vim     " use % to jump between start/end of methods
set clipboard=unnamed,unnamedplus      " use the system clipboard
set cursorline                 " highlight current line
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
"set relativenumber                     " show relative line numbers
set number                     " show line numbers
set shiftwidth=2
set showcmd                    " display incomplete commands
set showmatch                  " show bracket matches
set smartcase                  " pay attention to case when caps are used
set splitbelow
set splitright
set t_ti= t_te=                " Prevent Vim from clobbering the scrollback buffer. See
set ts=2                       " set indent to 2 spaces
set vb                         " enable visual bell (disable audio bell)
set wildmode=list:longest,full
syntax on                      " show syntax highlighting


function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

nmap 0 ^

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,elm,sass,cucumber set ai sw=2 sts=2 et

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " remove trailing spaces on save
  autocmd BufWritePre * :%s/\s\+$//e
" autocmd FileType text setlocal textwidth=78
"
"  autocmd! BufRead,BufNewFile *.sass setfiletype sass
"
"  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
"  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
"
"  " Don't syntax highlight markdown because it's often wrong
"  autocmd! FileType mkd setlocal syn=off
"
"  " Leave the return key alone when in command line windows, since it's used
"  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
"
"  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=
augroup END

autocmd BufNewFile,BufRead *.md set spell | set lbr | set nonu
let g:markdown_fenced_languages = ['html', 'json', 'css', 'javascript', 'elm', 'vim']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

silent! map <F3> :NERDTreeFind<CR>
"let g:NERDTreeMapActivateNode="<F3>"
"let g:NERDTreeMapPreview="<F4>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

silent! map <leader>kb :NERDTreeToggle<CR>

" map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" edit vimrc
map <leader>ev :e ~/.vimrc<CR>
map <leader>et :e ~/.todo<CR>
map <leader>fa :Ag<CR>
map <c-p> :Files<CR>

map <leader>tt :TagbarToggle<CR>

" execute file if we know how
map <leader>e :call ExecuteFile(expand("%"))<cr>

map <leader>g :Ggrep

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

" next/previous buffer
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>

noremap <leader>s :Ack

noremap <leader>cb :center 80<cr>hhv0r-A <esc>40A-<esc>d80<bar>YppVr-kk.

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
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <c-c> <esc>              " Can't be bothered to understand ESC vs <c-c> in insert mode
vnoremap . :norm.<cr>         " map . in visual mode



" clear highlighting
nnoremap <silent> <Esc><Esc> :nohl<CR>

" Move around splits with <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

nnoremap H :bp <CR>
nnoremap L :bn <CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-o> :TmuxNavigatePrevious<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if executable('ag')
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore-dir ".git" --ignore "**.swp" --hidden'
"
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"else
"  " Fall back to using git ls-files if Ag is not available
"  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
"endif
"
"let g:ctrlp_mruf_relative = 1
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_cmd = 'CtrlPMixed'


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

nnoremap K <Plug>CtrlSFVwordExec

let g:ackprg = 'ag --vimgrep'
let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-elm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"

let g:ycm_semantic_triggers =  {
  \   'elm' : ['.'],
  \ }

"<Leader>e	Shows the detail of the current error or warning.
"<Leader>d	Shows the type and docs for the word under the cursor.
"<Leader>w	Opens the docs web page for the word under the cursor.

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


augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END


