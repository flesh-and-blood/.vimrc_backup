filetype plugin indent on
syntax enable

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

" theme setting
  colorscheme gruvbox
  let g:gruvbox_contrast_dark='dark'

" common settting
  let g:AutoPairsFlyMode = 1
  let maplocalleader=";"
  set         wrap                  encoding=utf-8              nocompatible
  set         showcmd               showmatch                   wildmenu
  set         tabstop=4             softtabstop=4               shiftwidth=4
  set         laststatus=2          statusline=%F:\ %l/%L
  set         autoindent            smartindent
  set         number                relativenumber 
  set         cursorline            ruler
  set         incsearch             hlsearch
  set         foldenable            foldmethod=syntax

" common mapping
  nnoremap <space> za
  inoremap jk <esc>
  vnoremap jk <esc>

" arduino-ctags leader-d => definition / leader-t => return
  nnoremap <localleader>d :mksession!<cr>:w<cr><c-]>zz
  nnoremap <localleader>t :mksession!<cr>:w<cr><c-t>zz

" jumping between splits
  nnoremap <localleader>h <c-w>h
  nnoremap <localleader>j <c-w>j
  nnoremap <localleader>k <c-w>k
  nnoremap <localleader>l <c-w>l

" auto make session when write and quit
  nnoremap <localleader>w :mksession!<cr>:w<cr>
  nnoremap <localleader>q :mksession!<cr>:w<cr>:qall<cr>

" n => next / l => last of current line
  onoremap in( :<c-u>normal! f(vi(<cr>
  onoremap in[ :<c-u>normal! f(vi[<cr>
  onoremap in{ :<c-u>normal! f(vi{<cr>
  onoremap il( :<c-u>normal! F)vi(<cr>
  onoremap il[ :<c-u>normal! F]vi[<cr>
  onoremap il{ :<c-u>normal! f}vi{<cr>

" add surround
  nnoremap <localleader>' viw<esc>a'<esc>bi'<esc>lel
  nnoremap <localleader>" viw<esc>a"<esc>bi"<esc>lel
  nnoremap <localleader>( viw<esc>a)<esc>bi(<esc>lel
  nnoremap <localleader>[ viw<esc>a]<esc>bi[<esc>lel
  nnoremap <localleader>{ viw<esc>a}<esc>bi{<esc>lel

" grep inner vim
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

  autocmd filetype cpp iab mia int<space>main(int<space>argc,<space>char*<space>argv[])<cr>{
  autocmd filetype cpp iab mai int<space>main(int<space>argc,<space>char*<space>argv[])<cr>{

  autocmd filetype cpp iab oper operator
  autocmd filetype cpp iab tmep temp
  autocmd filetype cpp iab vodi void
  autocmd filetype cpp iab cahr char

  autocmd filetype cpp iab pub public:<esc><<
  autocmd filetype cpp iab pri private:<esc><<
  
  autocmd filetype cpp nnoremap <localleader>m :make<cr>

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

augroup CMakeLists
  autocmd!

  autocmd filetype cmake iab ver VERSION
  autocmd filetype cmake iab pub PUBLIC
  autocmd filetype cmake iab pri PRIVATE
  autocmd filetype cmake iab std CMAKE_CXX_STANDARD

  autocmd filetype cmake inoremap <localleader>pbd  PROJECT_BINARY_DIR
  " hinc stands for header include
  autocmd filetype cmake inoremap hinc<space>       target_include_directories()<left>
  autocmd filetype cmake inoremap conf<space>       configure_file()<left>
  " especially for c++ project
  autocmd filetype cmake inoremap out<space>        add_executable()<left>
  autocmd filetype cmake inoremap pro<space>        project()<left>

  autocmd filetype cmake nnoremap <localleader>/    0i#<esc>

augroup END
