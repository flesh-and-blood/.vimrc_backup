" 从 https://github.com/VundleVim/Vundle.vim#quick-start 抄过来的
set nocompatible

filetype off

call vundle#begin()
  Plugin 'tpope/vim-fugitive'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'jacoborus/tender.vim'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'octol/vim-cpp-enhanced-highlight'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
  Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()    

filetype plugin indent on
syntax enable

colorscheme gruvbox
let g:gruvbox_contrast_dark='dark'

let maplocalleader=";"

set wrap
set laststatus=2 statusline=%F:\ %l/%L
set encoding=utf-8
set autoindent smartindent
set showcmd showmatch wildmenu
set tabstop=4 softtabstop=4 shiftwidth=4
set number relativenumber cursorline ruler

set incsearch hlsearch
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
nnoremap <localleader>[ viw<esc>a]<esc>bi[<esc>lel

vnoremap <localleader>g :<c-u>call GrepOperator(visualmode())<cr>
nnoremap <localleader>g :set operatorfunc=GrepOperator<cr>g@
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

augroup cplusplus
  autocmd!

  " hightlight config for https://vimawesome.com/plugin/vim-cpp-enhanced-highlight
  autocmd filetype cpp let g:cpp_experimental_template_highlight = 1
  autocmd filetype cpp let g:cpp_member_variable_highlight       = 1
  autocmd filetype cpp let g:cpp_class_scope_highlight           = 1
  autocmd filetype cpp let g:cpp_class_decl_highlight            = 1
  autocmd filetype cpp let g:cpp_posix_standard                  = 1

  autocmd filetype cpp iab 3inc #include
  autocmd filetype cpp iab 3def #define
  autocmd filetype cpp iab 3ifn #ifndef
  autocmd filetype cpp iab 3ifd #ifdef
  autocmd filetype cpp iab 3end #endif

  autocmd filetype cpp iab mai int<space>main(int<space>argc,<space>char*<space>argv[])

  autocmd filetype cpp iab oper operator
  autocmd filetype cpp iab tmep temp
  autocmd filetype cpp iab vodi void
  autocmd filetype cpp iab cahr char
  
  autocmd filetype cpp nnoremap <localleader>m :make<cr>

  autocmd filetype cpp inoremap pub: public:<esc><<
  autocmd filetype cpp inoremap pri: private:<esc><<
  
  autocmd filetype cpp inoremap tem<space>  template <><left>
  autocmd filetype cpp inoremap typ<space>  typename
  autocmd filetype cpp inoremap nul<space>  nullptr<space>
  autocmd filetype cpp inoremap del<space>  delete<space>
  autocmd filetype cpp inoremap ret<space>  return<space>

  autocmd filetype cpp inoremap if<space>   if ()<left>
  autocmd filetype cpp inoremap fi<space>   if ()<left>
  autocmd filetype cpp inoremap for<space>  for ()<left>
  autocmd filetype cpp inoremap fro<space>  for ()<left>
  autocmd filetype cpp inoremap whi<space>  while ()<left>
  autocmd filetype cpp inoremap swi<space>  switch ()<left>
  autocmd filetype cpp inoremap cla<space>  class<space>
  autocmd filetype cpp inoremap str<space>  struct<space>
  
  autocmd filetype cpp inoremap .<space> ->
  
  autocmd filetype cpp nnoremap <localleader>/ 0i//<esc>

  autocmd filetype cpp nmap <localleader>s :w<cr>:call SwitchSourceHeaderCplusplus()<cr>
  autocmd filetype cpp
    function! SwitchSourceHeaderCplusplus()
      if (expand ("%:e") == "cpp")
        find %:t:r.h
      else
        find %:t:r.cpp
      endif
    endfunction

augroup END
