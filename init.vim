call plug#begin('~/.nvim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-commentary'
	Plug 'sheerun/vim-polyglot'
	Plug 'junegunn/fzf'
	Plug 'dense-analysis/ale'
	Plug 'jcherven/jummidark.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
	Plug 'Shougo/deoplete.nvim'
 	Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
 	Plug 'carlitux/deoplete-ternjs',
	Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()


if has("syntax")
  syntax on
endif

let g:indentLine_char = '‚îÇ'

let NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''


let g:ale_linters = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint']
\}

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'css': ['prettier'],
\  'jsx': ['eslint']
\}

" let g:ale_fixers = {
" \  'javascript': ['prettier', 'eslint'],
" \  'css': ['prettier'],
" \  'jsx': ['eslint']
" \}

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map c gc
nnoremap d "_d
vnoremap d "_d
nnoremap <C-p> :FZF<CR>
nnoremap <C-k> :noh<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"colorscheme gruvbox
"colorscheme molokai
colorscheme jummidark
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-m> :Rex<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:ale_sign_error = '¬ß'
let g:ale_sign_warning = '#'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

set clipboard=unnamed
set nocompatible
set bg=dark
set background=dark
se mouse=a
set encoding=utf-8
let g:deoplete#enable_at_startup = 1

set rnu
set number
set laststatus=2
set tabstop=2
set shiftwidth=2
set autoindent
set noswapfile


let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
call deoplete#custom#var('enable_smart_case', 1)
let g:deoplete#enable_camel_case = 1
call deoplete#custom#var('enable_refresh_always', 1)
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
call deoplete#custom#var('omni', 'input_patterns', {})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" - persistent"]

augroup vimrc_autocmd
	autocmd!
	" autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


	au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
	"
	" autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  " autocmd BufWinEnter ?* silent! loadview
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

"let g:UltiSnipsExpandTrigger="<C-j>"

set foldmethod=indent "syntax highlighting items specify folds
set foldcolumn=0 "defines 1 col at window left, to indicate folding
set foldlevelstart=99 "start file with all folds opened


" augroup AutoSaveFolds
"   autocmd!
"   " view files are about 500 bytes
"   " bufleave but not bufwinleave captures closing 2nd tab
"   " nested is needed by bufwrite* (if triggered via other autocmd)

"set foldlevel=1
"set foldnestmax=1

