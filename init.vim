call plug#begin('~/.nvim/plugged')
	Plug 'scrooloose/nerdtree'
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	Plug 'morhetz/gruvbox'
	Plug 'tomtom/tcomment_vim'
	Plug 'sheerun/vim-polyglot'
	"Plug 'ryanoasis/vim-devicons'
	Plug 'tpope/vim-surround'
	Plug 'junegunn/fzf'
	Plug 'tomasr/molokai'
	Plug 'dense-analysis/ale'
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
	Plug 'ervandew/supertab'
	Plug 'Shougo/deoplete.nvim'
 	Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
 	Plug 'carlitux/deoplete-ternjs',
	Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()


if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif



let NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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


nnoremap <C-p> :FZF<CR>
nnoremap <C-k> :noh<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:ale_sign_error = '#'
let g:ale_sign_warning = '?'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set clipboard=unnamed
set nocompatible
set bg=dark
se mouse+=a
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
"let g:deoplete#enable_smart_case = 1
call deoplete#custom#var('enable_smart_case', 1)
let g:deoplete#enable_camel_case = 1
"let g:deoplete#enable_refresh_always = 1
call deoplete#custom#var('enable_refresh_always', 1)
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
call deoplete#custom#var('omni', 'input_patterns', {})
" let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" - persistent"]

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" let g:deoplete#enable_at_startup = 1ÔúÇ
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" " let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " omnifuncs
" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" augroup end
" " tern
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif
"


" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
"   \ 'tern#Complete',
"   \ 'jspc#omni'
" \]
" set completeopt=longest,menuone,preview
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

colorscheme gruvbox
"colorscheme molokai
noremap <C-n> :NERDTreeToggle<CR>
if has("syntax")
  syntax on
endif


augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

let javaScript_fold=1 "activate folding by JS syntax
"set foldlevelstart=0 "start file with all folds opened
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=0 "defines 1 col at window left, to indicate folding
"set foldlevel=1
set foldnestmax=1

" autocmd BufEnter *.js execute("%foldc")

" au! WinEnter,WinLeave * call CheckFoldColumnSetting()

function! CheckFoldColumnSetting()
	set foldcolumn=0
endfunction
