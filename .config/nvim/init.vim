" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim' " <---

Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
" Plug 'git@github.com:github/copilot.vim.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-orgmode/orgmode'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'peitalin/vim-jsx-typescript'
" Plug 'scrooloose/nerdtree'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'metakirby5/codi.vim'
Plug 'ggandor/leap.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'fannheyward/telescope-coc.nvim'  " <---


" List ends here. Plugins become visible to Vim after this call.
call plug#end()


nnoremap <SPACE> <Nop>
map <Space> <Leader>
let mapleader=" "

let g:python3_host_prog = '/usr/local/opt/python@3/bin/python3'

" remember last opened buffers
" set viminfo^=%

colorscheme gruvbox
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! FileName let @+ = expand('%:p')
imap <C-s> <Esc>:w<CR>
map <C-s> :w<CR>

set clipboard+=unnamedplus
set encoding=UTF-8
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set ignorecase
set inccommand=nosplit
set number
set smartcase
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set ts=2 sw=2

let g:rooter_patterns = ['.git']


autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <silent> <space><space> :Commands<CR>
nnoremap <silent> <space>fed :e $MYVIMRC<CR>
nnoremap <silent> <space>fer :source $MYVIMRC<CR>

nnoremap <silent> <space>bp :bp<CR>
nnoremap <silent> <space>bn :bn<CR>
nnoremap <silent> <space>bd :bd<CR>

nnoremap <silent> <space>wh <C-w>h<CR>
nnoremap <silent> <space>wl <C-w>l<CR>
nnoremap <silent> <space>wj <C-w>j<CR>
nnoremap <silent> <space>wk <C-w>k<CR>
nnoremap <silent> <space>wd <C-w>q<CR>
nnoremap <silent> <space>w/ :vsplit<CR>

nnoremap <silent> <space>gb :Git blame<CR>
" nnoremap <space>se :%s/<c-r><c-w>/<c-r><c-w>/g<Left><Left>
" vnoremap <space>se y<Esc>:%s/<c-r>"/<c-r>"/g<Left><Left>
nnoremap <silent> <space>se :CocCommand document.renameCurrentWord<CR>
vnoremap <silent> <space>se :CocCommand document.renameCurrentWord<CR>

" Mappings for CoCList
nnoremap <silent> <space>ca  :<C-u>CocDiagnostics<cr>
nnoremap <silent> <space>el  :<C-u>CocDiagnostics<cr>
"nnoremap <silent> <space><space>  :<C-u>CocList<cr>
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <space>os  :<C-u>CocList outline<cr>
nnoremap <silent> <space>oo  :CocOutline<cr>
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>

nnoremap <silent> <space>aa :call CocAction('runCommand', 'tsserver.executeAutofix')<CR>

nnoremap <silent> <space>ot  :e ~/org/TODOS.org<CR>

nnoremap <silent> <space>sc :noh<CR>

nnoremap <silent> <space>pf <cmd>Telescope find_files<cr>
nnoremap <silent> <space>/  <cmd>Telescope live_grep<cr>
nnoremap <silent> <space>gt :Git t %<CR>

nnoremap <silent> <space>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <space>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <space>*  <cmd>Telescope grep_string<cr>
nnoremap <silent> <space>lr <cmd>Telescope lsp_references<cr>
nnoremap <silent> <space>rs <cmd>Telescope resume<cr>
nnoremap <silent> <space>jj <cmd>Telescope jumplist<cr>
nnoremap <silent> <space>gs :Git<cr>
" nnoremap <silent> <space>p <cmd>Telescope registers<cr>
nnoremap <silent> <C-p>  :<C-u>CocList -A --normal yank<cr>

nnoremap <silent> <space>pt :Neotree<cr>
nnoremap <silent> <space>pp :Neotree filesystem reveal<cr>
nnoremap <silent> <space>gb :Git blame<cr>

function! GitFileAtRef(selected)
  let ref = split(a:selected)[0]
  let file = expand('%')
  let cmd = 'git --no-pager show ' . ref . ':' . file " . ' | vim -'
  execute 'silent !' . cmd
endfunction

" Add a function to search for a file in all git revisions
function! GitRevisions()
  let l:file = fzf#run({
        \ 'source': 'git --no-pager log --pretty=format:"%h %ad %s" --date=short ' .expand('%'),
        \ 'sink': function('GitFileAtRef'),
        \ 'options': '--preview "git show {1}:./'.expand('%').'"'})
  if !empty(l:file)
    execute 'edit '.fnameescape(l:file)
  endif
endfunction

" Map the function to a key combination
nnoremap <Leader>gt :call GitRevisions()<CR>


"" ORG MODE

lua << EOF
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require('nvim-treesitter.configs').setup({
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
})

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/notes.org',
})

require("telescope").setup({
	defaults = {
		path_display = { 'truncate' }
	},
  extensions = {
		-- always use Telescope locations to preview definitions/declarations/implementations etc
    coc = { prefer_locations = true, },
    fzf = { fuzzy = true, case_mode = 'smart_case', },
  },
})
require('telescope').load_extension('coc')
EOF


"" COC

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


inoremap <expr>   <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> [p <Plug>(coc-diagnostic-prev)
nmap <silent> ]p <Plug>(coc-diagnostic-next)
nmap <silent> ]c <Plug>(coc-cursors-word)
nmap <silent> [c <Plug>(coc-cursors-operator)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> ,gg <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> ,gi <Plug>(coc-implementation)
nmap <silent> gr :Telescope coc references<CR>
nmap <silent> ,gr :Telescope coc references<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rw :CocCommand document.renameCurrentWord<CR>
nmap <leader>rr <Plug>(coc-refactor)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>qq  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_snippet_next = '<tab>'

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-y> <Plug>(coc-range-select)
xmap <silent> <C-y> <Plug>(coc-range-select)

lua require('leap').add_default_mappings()

"" NERD TREE
" let g:NERDTreeShowHidden = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeIgnore = []
" let g:NERDTreeStatusline = ''
" " Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Toggle
" nnoremap <silent> <C-b> :NERDTreeToggle<CR>

