filetype plugin indent on
syntax enable

call vundle#begin()
  Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
  Plugin 'git://git.wincent.com/command-t.git'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plugin 'octol/vim-cpp-enhanced-highlight'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'jacoborus/tender.vim'
  Plugin 'raimondi/delimitmate'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive'

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

" nerdtree
  nnoremap <localleader>q :NERDTreeClose<cr>:mksession!<cr>:w<cr>:qall<cr>
  nnoremap <localleader>w :NERDTreeClose<cr>:mksession!<cr>:w<cr>
  nnoremap <localleader>e :NERDTreeToggle<cr>
  nnoremap <localleader>n :NERDTreeFocus<cr>

  augroup nerdtree
    autocmd!
    
    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    
    " If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

  augroup END

" arduino-ctags leader-d => definition / leader-t => return
  nnoremap <localleader>d :mksession!<cr>:w<cr><c-]>zz
  nnoremap <localleader>t :mksession!<cr>:w<cr><c-t>zz

" jumping between splits
  nnoremap <localleader>h <c-w>h
  nnoremap <localleader>j <c-w>j
  nnoremap <localleader>k <c-w>k
  nnoremap <localleader>l <c-w>l


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

function! EatChar()
  let dummy = getchar(0)
  return ''
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

  autocmd filetype cpp iab mia  int<space>main(int<space>argc,<space>char*<space>argv[])<cr>{<cr><esc>O<c-r>=EatChar()<cr>
  autocmd filetype cpp iab mai  int<space>main(int<space>argc,<space>char*<space>argv[])<cr>{<cr><esc>O<c-r>=EatChar()<cr>

  autocmd filetype cpp iab pub  public
  autocmd filetype cpp iab pri  private
  autocmd filetype cpp iab pr:  private:<esc><<o<c-r>=EatChar()<cr>
  autocmd filetype cpp iab pu:  public:<esc><<o<c-r>=EatChar()<cr>
  autocmd filetype cpp iab lk   [[likely]]
  autocmd filetype cpp iab ulk  [[unlikely]]

  autocmd filetype cpp iab cste constexpr
  autocmd filetype cpp iab typ  typename
  autocmd filetype cpp iab oper operator
  autocmd filetype cpp iab nul  nullptr
  autocmd filetype cpp iab vir  virtual
  autocmd filetype cpp iab vri  virtual
  autocmd filetype cpp iab sta  static
  autocmd filetype cpp iab del  delete
  autocmd filetype cpp iab inl  inline
  autocmd filetype cpp iab iln  inline
  autocmd filetype cpp iab ret  return
  autocmd filetype cpp iab str  struct
  autocmd filetype cpp iab cst  const
  autocmd filetype cpp iab cla  class
  autocmd filetype cpp iab cal  class
  autocmd filetype cpp iab tmep temp
  autocmd filetype cpp iab vodi void
  autocmd filetype cpp iab ovid void
  autocmd filetype cpp iab eumn enum

  autocmd filetype cpp iab try  try<cr>{<cr>}<cr>catch<space>()<cr>{<cr>}<esc>3kO<c-r>=EatChar()<cr>
  autocmd filetype cpp iab tem  template<space><><left><c-r>=EatChar()<cr>
  autocmd filetype cpp iab swi  switch ()<left><c-r>=EatChar()<cr>
  autocmd filetype cpp iab whi  while ()<left><c-r>=EatChar()<cr>
  autocmd filetype cpp iab for  for ()<left><c-r>=EatChar()<cr>
  autocmd filetype cpp iab fro  for ()<left><c-r>=EatChar()<cr>
  autocmd filetype cpp iab if   if ()<left><c-r>=EatChar()<cr>
  autocmd filetype cpp iab fi   if ()<left><c-r>=EatChar()<cr>
  
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

  autocmd filetype cmake nnoremap <localleader>/ 0i#<esc>

  autocmd filetype cmake iab std        CMAKE_CXX_STANDARD
  autocmd filetype cmake iab des        DESTINATION
  autocmd filetype cmake iab inte       INTERFACE
  autocmd filetype cmake iab tag        TARGETS
  autocmd filetype cmake iab ver        VERSION
  autocmd filetype cmake iab pri        PRIVATE
  autocmd filetype cmake iab pub        PUBLIC
  autocmd filetype cmake iab sha        SHARED
  autocmd filetype cmake iab sta        STATIC
  autocmd filetype cmake iab app        APPEND
  autocmd filetype cmake iab file       FILES

  autocmd filetype cmake iab csd        CMAKE_CURRENT_SOURCE_DIR<c-r>=EatChar()<cr>
  autocmd filetype cmake iab psd        PROJECT_SOURCE_DIR<c-r>=EatChar()<cr>
  autocmd filetype cmake iab pbd        PROJECT_BINARY_DIR<c-r>=EatChar()<cr>

  " 这里是用 gcc 的参数来代指
  autocmd filetype cmake iab I          target_include_directories()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab D          target_compile_definitions()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab l          target_link_libraries()<left><c-r>=EatChar()<cr>

  autocmd filetype cmake iab conf       configure_file()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab pro        project()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab inc        include()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab op         option()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab li         list()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab set        set()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab $          ${}<left><c-r>=EatChar()<cr>
  
  autocmd filetype cmake iab as         add_subdirectory()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab ad         add_dependencies()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab am         add_definitions()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab ao         add_executable()<left><c-r>=EatChar()<cr>
  autocmd filetype cmake iab al         add_library()<left><c-r>=EatChar()<cr>

  autocmd filetype cmake iab func       function()<cr>endfunction()<esc>k0f(a<c-r>=EatChar()<cr>
  autocmd filetype cmake iab for        foreach()<cr>endforeach()<esc>k0f(a<c-r>=EatChar()<cr>
  autocmd filetype cmake iab fro        foreach()<cr>endforeach()<esc>k0f(a<c-r>=EatChar()<cr>
  autocmd filetype cmake iab if         if()<cr>endif()<esc>k0f(a<c-r>=EatChar()<cr>
  autocmd filetype cmake iab else       else()<cr><c-r>=EatChar()<cr>

augroup END
