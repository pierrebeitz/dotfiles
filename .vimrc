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

" To ignore plugin indent changes, instead use:
" filetype plugin on

set nocompatible                  " be iMproved, required
filetype off                      " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'ElmCast/elm-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/html5.vim'
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

" deleted: .vim/bundle/vim-coffee-script
" deleted: .vim/bundle/vim-rails

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1



call     vundle#end()
filetype plugin indent on    " required

noremap  <silent> <C-S> :w<CR>
vnoremap <silent> <C-S> <C-C>:w<CR>
inoremap <silent> <C-S> <C-O>:w<CR>
"nnoremap <leader>ss :mksession<CR>

noremap  <c-q> :bd<CR>
noremap  <s-left> :bp<CR>
noremap  <s-right> :bn<CR>
nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/

let g:gitgutfer_override_sign_column_highlight = 0


"space open/closes folds
nnoremap <space> za
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
set clipboard=unnamedplus      " use the system clipboard
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
set relativenumber                     " show relative line numbers
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
"  autocmd! CmdwinEnter * :unmap <cr>
"  autocmd! CmdwinLeave * :call MapCR()
"
"  " *.md is markdown
"  autocmd! BufNewFile,BufRead *.md setlocal ft=
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUSLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}%=[%L,%p%%][%l,%c]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set dark background and color scheme
set background=dark
colorscheme base16-railscasts
if &diff
	colorscheme default
endif

" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
highlight Error        ctermbg=0   ctermfg=1
highlight Todo         ctermbg=0   ctermfg=1
highlight MatchParen   ctermbg=green ctermfg=blue


highlight GitGutterAdd          ctermbg=NONE
highlight GitGutterChange       ctermbg=NONE
highlight GitGutterDelete       ctermbg=NONE
highlight GitGutterChangeDelete ctermbg=NONE

highlight MBEChanged ctermbg=darkblue


" highlight the status bar when in insert mode
au InsertLeave * hi StatusLine ctermbg=232 ctermfg=2
au InsertEnter * hi StatusLine ctermfg=232 ctermbg=2

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","           " set leader key to comma
" map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" Clipboard
map <leader>cc :w !xsel -i -b<CR>
map <leader>pp :r !xsel -p<CR>

" close buffer
map <leader>w <c-w>c<CR>

" edit vimrc
map <leader>ev :e ~/.vimrc<CR>
map <leader>et :e ~/.todo<CR>

map <leader>tt :TagbarToggle<CR>

" execute file if we know how
map <leader>e :call ExecuteFile(expand("%"))<cr>
map <leader>n :call RenameFile()<cr>

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

" next/previous buffer
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>

noremap <leader>s :Ack 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <c-l> <space>=><space>   " insert a hash rocket with <c-l>
imap <c-c> <esc>              " Can't be bothered to understand ESC vs <c-c> in insert mode
vnoremap . :norm.<cr>         " map . in visual mode

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore-dir ".git" --ignore "**.swp" --hidden'

  set grepprg=ag\ --nogroup\ --nocolor

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_mruf_relative = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cmd = 'CtrlPMixed'



" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" clear highlighting
nnoremap <silent> <Esc><Esc> :nohl<CR>

" Move around splits with <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-o> :TmuxNavigatePrevious<cr>


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTI-PURPOSE TAB KEY (AUTO-COMPLETE)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  else
"    return "\<c-p>"
"  endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

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

let g:ackprg = 'ag --vimgrep'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
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


"let g:NERDTreeDirArrows = 1
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

silent! map <leader>kb :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
"let g:NERDTreeMapActivateNode="<F3>"
"let g:NERDTreeMapPreview="<F4>"


let g:elm_format_autosave = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
  \  'colorscheme': 'wombat',
  \  'active': {
  \    'left': [ [ 'mode', 'paste' ],
  \              [ 'fugitive', 'filename' ] ]
  \  },
	\  'component_function': {
  \    'fugitive': 'LightLineFugitive',
  \    'filename': 'LightLineFilename'
  \  },
  \  'separator': { 'left': '', 'right': '' },
  \  'subseparator': { 'left': '', 'right': '' }
  \}

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


"branch SymbolDefaultpowerlinevim--	''
"linecolumn SymbolDefaultpowerlinevim--	''

augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

