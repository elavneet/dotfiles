call plug#begin()
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'sbdchd/neoformat'
	Plug 'morhetz/gruvbox'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-python/python-syntax'
	Plug 'tomtom/tcomment_vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

let NERDTreeShowBookmarks=1

set clipboard=unnamed
set nocompatible
set backspace=indent,eol,start
let g:python_highlight_builtins = 1
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
set bg=dark
"set term=cons25
se mouse+=a
set encoding=utf-8
"set foldmethod=indent

set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

set rnu
set number
"set bg=dark
set laststatus=2
set tabstop=2
set shiftwidth=2
set autoindent
set noswapfile


augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END

" Keep all folds open when a file is opened
" augroup OpenAllFoldsOnFileOpen
"     autocmd!
"     autocmd BufRead * normal zR
" augroup END

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  ! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  ! execute '%!'. command
  ! execute 'resize '
  ! redraw
  ! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  ! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

"colorscheme wombat256mod
colorscheme gruvbox
noremap <C-n> :NERDTreeToggle<CR>
if has("syntax")
  syntax on
endif
vmap <C-c> :w! ~/Documents/vimbuffer.txt<CR>
nmap <C-c> :.w! ~/Documents/vimbuffer.txt<CR>

hi Normal ctermbg=none

inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>
nnoremap r <Esc>:w<CR>:! python3 %<CR>
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
" imap <M-s> <Esc>:w<kEnter>i
"nnoremap <buffer> <F9> :w <bar> :exec '!python3' shellescape(@%, 1)<cr>

" paste from buffer
map <C-p> :r ~/Documents/TmpBin/vimbuffer.txt<CR>
set t_Co=256
" let g:neoformat_try_formatprg = 1
" augroup NeoformatAutoFormat
"     autocmd!
"     autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
"                                                             \--stdin\
"                                                             \--print-width\ 80\
"                                                             \--single-quote\
"                                                             \--trailing-comma\ es5
"     autocmd BufWritePre *.js,*.jsx Neoformat
" augroup END
" autocmd BufWritePre *.js silent Neoformat
autocmd BufWritePre *.js Neoformat
