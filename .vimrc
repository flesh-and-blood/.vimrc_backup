" copyed from https://github.com/VundleVim/Vundle.vim#quick-start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jacoborus/tender.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'octol/vim-cpp-enhanced-highlight'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
colorscheme gruvbox

iab tmep temp
iab vodi void

let maplocalleader=";"

set wrap
set laststatus=2 statusline=%F:\ %l/%L
set encoding=utf-8
set autoindent smartindent
set showcmd showmatch wildmenu
set tabstop=4 softtabstop=4 shiftwidth=4
set number relativenumber cursorline ruler

set incsearch hlsearch

" hightlight config for https://vimawesome.com/plugin/vim-cpp-enhanced-highlight
let g:cpp_posix_standard                  = 1
let g:cpp_class_decl_highlight            = 1
let g:cpp_class_scope_highlight           = 1
let g:cpp_member_variable_highlight       = 1
let g:cpp_experimental_template_highlight = 1

set foldenable foldmethod=syntax
nnoremap <space> za

inoremap jk <esc>
vnoremap jk <esc>

nnoremap <localleader>d :mksession!<cr>:w<cr><c-]>zz
nnoremap <localleader>t :mksession!<cr>:w<cr><c-t>zz

nnoremap <localleader>h <c-w>h
nnoremap <localleader>j <c-w>j
nnoremap <localleader>k <c-w>k
nnoremap <localleader>l <c-w>l

nnoremap <localleader>u :GundoToggle<cr>
nnoremap <localleader>w :mksession!<cr>:w<cr>
nnoremap <localleader>q :mksession!<cr>:w<cr>:qall<cr>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f(vi[<cr>
onoremap in{ :<c-u>normal! f(vi{<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap il{ :<c-u>normal! f}vi{<cr>

nnoremap <localleader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <localleader>( viw<esc>a)<esc>bi(<esc>lel

augroup cplusplus
    autocmd!
    autocmd BufNewFile *.cpp :write
    autocmd BufNewFile *.cc :write
    autocmd BufNewFile *.hpp :write
    autocmd BufNewFile *.h :write
    autocmd BufNewFile makefile :write
    autocmd filetype cpp iab 3inc #include <><left>
    autocmd filetype cpp iab 3def #define
    autocmd filetype cpp iab 3ifn #ifndef
    autocmd filetype cpp iab 3ifd #ifdef
    autocmd filetype cpp iab 3end #endif
    autocmd filetype cpp iab mai int<space>main(int<space>argc,<space>char*<space>argv[])
    autocmd filetype cpp nnoremap <localleader>m :make<cr>
    autocmd filetype cpp inoremap tem<space> template <><left>
    autocmd filetype cpp inoremap typ<space> typename
    autocmd filetype cpp inoremap if<space> if ()<left>
    autocmd filetype cpp inoremap fi<space> if ()<left>
    autocmd filetype cpp inoremap for<space> for ()<left>
    autocmd filetype cpp inoremap fro<space> for ()<left>
    autocmd filetype cpp inoremap whi<space> while ()<left>
    autocmd filetype cpp inoremap swi<space> switch ()<left>
    autocmd filetype cpp inoremap cla<space> class<space>
    autocmd filetype cpp inoremap str<space> struct<space>
    autocmd filetype cpp inoremap .<space> ->
    autocmd filetype cpp nnoremap <localleader>/ 0i//<esc>
    autocmd filetype cpp nmap <localleader>s :w<cr>:call SwitchSourceHeaderCplusplus()<cr>
augroup END

function! SwitchSourceHeaderCplusplus()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction

nnoremap <localleader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <localleader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
        silent execute "grep! -R " . shellescape(@@) . " ."
        copen        
endfunction
