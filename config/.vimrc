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
  Plugin 'mbbill/undotree'
  Plugin 'jiangmiao/auto-pairs'

call vundle#end()

" theme setting
  colorscheme gruvbox
  let g:gruvbox_contrast_dark='dark'

" common settting
  let g:AutoPairsFlyMode = 1
  function! FixAutoPairPluginAndEatSpace()
	  let i = 0
	  while i < 20 
		  call EatChar()
		  let i += 1
	  endwhile
	  return ''
  endfunction

  let maplocalleader=";"

  set         wrap                  encoding=utf-8              nocompatible
  set         showcmd               showmatch                   wildmenu
  set         tabstop=4				shiftwidth=4				"expandtab
  set         laststatus=2          statusline=%F:\ %l/%L
  set         autoindent            smartindent
  set         number                relativenumber 
  set         cursorline            ruler
  set         incsearch             hlsearch
  set         foldenable            foldmethod=syntax

" common mapping
  nnoremap <localleader>q :NERDTreeClose<cr>:UndotreeHide<cr>:mksession!<cr>:w<cr>:qall<cr>
  nnoremap <localleader>u :UndotreeToggle<cr>
  nnoremap <localleader>n :NERDTreeToggle<cr>
  nnoremap <localleader>w :mksession!<cr>:w<cr>
  nnoremap <space> za
  inoremap jk <esc>
  vnoremap jk <esc>
  
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

" grep inner vim
  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  endif

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

function! ShowMeF()

endfunction

augroup cplusplus
  " 语法规定不能写成 c, cpp
  autocmd!

  " hightlight config for https://vimawesome.com/plugin/vim-cpp-enhanced-highlight
  autocmd filetype c,cpp let g:cpp_experimental_template_highlight = 1
  autocmd filetype c,cpp let g:cpp_member_variable_highlight       = 1
  autocmd filetype c,cpp let g:cpp_class_scope_highlight           = 1
  autocmd filetype c,cpp let g:cpp_class_decl_highlight            = 1
  autocmd filetype c,cpp let g:cpp_posix_standard                  = 1

  autocmd filetype c,cpp iab 3inc #include
  autocmd filetype c,cpp iab 3def #define
  autocmd filetype c,cpp iab 3ifn #ifndef
  autocmd filetype c,cpp iab 3ifd #ifdef
  autocmd filetype c,cpp iab 3end #endif

  autocmd filetype c,cpp
	function! BreakLine()
		return "\<cr>\<bs>"
	endfunction

  autocmd filetype c,cpp iab pub  public
  autocmd filetype c,cpp iab pri  private
  autocmd filetype c,cpp iab pr:  private:<esc><<o<bs>
  autocmd filetype c,cpp iab pu:  public:<esc><<o<bs>
  autocmd filetype c,cpp iab lk   [[likely]]
  autocmd filetype c,cpp iab ulk  [[unlikely]]

  autocmd filetype c,cpp iab cste constexpr
  autocmd filetype c,cpp iab typ  typename
  autocmd filetype c,cpp iab oper operator
  autocmd filetype c,cpp iab nul  nullptr
  autocmd filetype c,cpp iab vir  virtual
  autocmd filetype c,cpp iab vri  virtual
  autocmd filetype c,cpp iab sta  static
  autocmd filetype c,cpp iab del  delete
  autocmd filetype c,cpp iab inl  inline
  autocmd filetype c,cpp iab iln  inline
  autocmd filetype c,cpp iab ret  return
  autocmd filetype c,cpp iab str  struct
  autocmd filetype c,cpp iab cst  const
  autocmd filetype c,cpp iab cla  class
  autocmd filetype c,cpp iab cal  class
  autocmd filetype c,cpp iab tmep temp
  autocmd filetype c,cpp iab vodi void
  autocmd filetype c,cpp iab ovid void
  autocmd filetype c,cpp iab eumn enum

  autocmd filetype c,cpp iab mai <c-r>=CompletionMain()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab mia <c-r>=CompletionMain()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp
    function! CompletionMain()
		return "int main(int argc, char* argv[])" . BreakLine() . "{" .  BreakLine() . "}"
    endfunction  

  autocmd filetype c,cpp iab try  try<cr>{<cr>}<cr>catch<space>()<cr>{<cr>}<esc>3kO<c-r>=FixAutoPairPluginAndEatSpace()<cr>

  autocmd filetype c,cpp iab met  template <><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab tem  template <><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

  autocmd filetype c,cpp iab swi  switch<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab whi  while<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab for  for<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab fro  for<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab if   if<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype c,cpp iab fi   if<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  
  autocmd filetype c,cpp inoremap .<space> ->
  
  autocmd filetype c,cpp nnoremap <localleader>/ 0i//<esc>

  autocmd filetype c,cpp nmap <localleader>s :w<cr>:call SwitchSourceHeaderCplusplus()<cr>
  autocmd filetype c,cpp
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
  autocmd filetype cmake iab rib        DESCRIPTION
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

  autocmd filetype cmake iab off        OFF
  autocmd filetype cmake iab on         ON

  autocmd filetype cmake iab csd        CMAKE_CURRENT_SOURCE_DIR<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab psd        PROJECT_SOURCE_DIR<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab pbd        PROJECT_BINARY_DIR<c-r>=FixAutoPairPluginAndEatSpace()<cr>

  autocmd filetype cmake iab cm         cmake_minimum_required()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

  " 这里是用 gcc 的参数来代指
  autocmd filetype cmake iab I          target_include_directories()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab D          target_compile_definitions()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab l          target_link_libraries()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

  autocmd filetype cmake iab conf       configure_file()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab pro        project()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab inc        include()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab op         option()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab li         list()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab set        set()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab $          ${}<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  
  autocmd filetype cmake iab as         add_subdirectory()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab ad         add_dependencies()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab am         add_definitions()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab ao         add_executable()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab al         add_library()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

  autocmd filetype cmake iab func       function()<cr>endfunction()<esc>k0f(a<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab for        foreach()<cr>endforeach()<esc>k0f(a<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab fro        foreach()<cr>endforeach()<esc>k0f(a<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab if         if()<cr>endif()<esc>k0f(a<c-r>=FixAutoPairPluginAndEatSpace()<cr>
  autocmd filetype cmake iab else       else()<cr><c-r>=FixAutoPairPluginAndEatSpace()<cr>

augroup END
