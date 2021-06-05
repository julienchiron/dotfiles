""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:                                                                 "
"   This is the .vimrc file                                                    "
"                                                                              "
" Maintainer:                                                                  "
"   Julien Chiron                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External sources
source ~/.dotfiles/vim/snippets.vim " All the snippets you need

" Enable filetype plugins
filetype plugin on
filetype indent on

syntax on

set path+=**

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin                                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'

call plug#end()
" If the list is modified, run :PluginInstall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set list                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
set hidden
set backspace=indent,eol,start
set splitbelow
set splitright
set encoding=utf-8
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set background=dark
colorscheme gruvbox 
set nocompatible
set number
set relativenumber
set history=700
set so=7
set wildmenu
set wildmode=longest,list,full
set ruler
set cmdheight=1
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set list
set listchars=tab:→-,precedes:«,extends:»,eol:¬
set nohlsearch
set incsearch
set textwidth=0
set colorcolumn=80
set cursorline
set noerrorbells
set laststatus=2 " Always show the status line
set showcmd "show typed keys in status bar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NetRW Settings                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_listsize = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

map ù %
nnoremap <NL> i<CR><ESC> " break the line

" Edit .vimrc
nnoremap <leader>vr :tabnew<CR>:e ~/.vimrc<CR>
nnoremap <leader>vs :so ~/.vimrc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector settings                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:maximizer_restore_on_winleave = 1

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation Settings                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs Navigation
nnoremap <leader>tn :tabNext<CR>

" Window Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Buffers Navigation
nnoremap <leader>b :ls<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-vim Settings                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#environment_path = "myvenv"
let g:jedi#goto_command = "<leader>gt"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_stubs_command = "<leader>gs"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive Settings                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gd :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gl :G log --oneline<CR>
nmap <leader>gs :G status<CR>
nmap <leader>gg :G<CR>

