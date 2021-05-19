""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Julien Chiron
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External sources
source ~/.dotfiles/vim/snippets.vim " All the snippets you need

" Enable filetype plugins
filetype plugin on
filetype indent on

syntax on

set path+=**

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'

call plug#end()
" If the list is modified, run :PluginInstall

" RipGrep
"if executable('rg')
"    let g:rg_derive_root='true'
"endif
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc--exclude-standard']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set list                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
set hidden

" Backspace
set backspace=indent,eol,start

" Split setup
set splitbelow
set splitright


" Set encoding to utf-8
set encoding=utf-8

" disable swapfile and backup
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Colors
set background=dark
colorscheme gruvbox 

" Vi retro compatibility
set nocompatible

" Show line numbering
set number
set relativenumber

" Sets how many lines of history VIM has to remember
set history=700

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu
set wildmode=longest,list,full

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Tab and indent settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

" Show invisible chars
set list
set listchars=tab:→-,precedes:«,extends:»,eol:¬

" Search highlighting
set nohlsearch
set incsearch

" Wrap on column 80
set textwidth=0
set colorcolumn=80

" Highlight current line
set cursorline

set noerrorbells

" NetRW settings
let g:netrw_banner = 0
let g:netrw_listsize = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

map ù %
nnoremap <NL> i<CR><ESC> " break the line

" Edit .vimrc
nnoremap <leader>vr :tabnew<CR>:e ~/.vimrc<CR>

" Vimspector
"
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" Tabs Navigation
nnoremap <leader>tn :tabNext<CR>

" Window Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Buffers Navigation
nnoremap <leader>b :ls<CR>

"nnoremap <leader>pv :wincmd v <bar> :wincmd r <bar> :Ex <bar> :vertical resize 30<CR>

" YCM
nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>yr :YcmRestartServer<CR>

let g:ycm_autoclose_preview_window_after_completion = 1 " Close this damn widndow!
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_extra_conf_globlist = 0 " Don't ask confirmation upon loading
