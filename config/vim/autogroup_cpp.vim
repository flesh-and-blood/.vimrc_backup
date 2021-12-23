augroup cplusplus
	autocmd!

	" 语法规定不能写成 c, cpp
	autocmd filetype c,cpp setlocal foldmethod=syntax

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
	autocmd filetype c,cpp iab pu:  public:<esc><<o<bs>

	autocmd filetype c,cpp iab pri  private
	autocmd filetype c,cpp iab pr:  private:<esc><<o<bs>

	autocmd filetype c,cpp iab lke  [[likely]]
	autocmd filetype c,cpp iab ulk  [[unlikely]]

	autocmd filetype c,cpp iab cste constexpr
	autocmd filetype c,cpp iab cst  const

	autocmd filetype c,cpp iab oper operator

	autocmd filetype c,cpp iab cahr char
	autocmd filetype c,cpp iab carh char

	autocmd filetype c,cpp iab typ  typename

	autocmd filetype c,cpp iab nam  namespace
	autocmd filetype c,cpp iab eumn enum

	autocmd filetype c,cpp iab nul  nullptr
	autocmd filetype c,cpp iab del  delete

	autocmd filetype c,cpp iab vir  virtual
	autocmd filetype c,cpp iab vri  virtual

	autocmd filetype c,cpp iab sta  static

	autocmd filetype c,cpp iab inl  inline
	autocmd filetype c,cpp iab iln  inline

	autocmd filetype c,cpp iab re  return

	autocmd filetype c,cpp iab str  struct

	autocmd filetype c,cpp iab cla  class
	autocmd filetype c,cpp iab cal  class

	autocmd filetype c,cpp iab tmep temp

	autocmd filetype c,cpp iab vodi void
	autocmd filetype c,cpp iab ovid void

	autocmd filetype cpp iab ifn if<space>(nullptr<space>==<space>)<esc>i
	autocmd filetype c iab ifn if<space>(NULL<space>==<space>)<esc>i
	autocmd filetype cpp iab fin if<space>(nullptr<space>==<space>)<esc>i
	autocmd filetype c iab fin if<space>(NULL<space>==<space>)<esc>i
	autocmd filetype cpp iab ifN if<space>(nullptr<space>!=<space>)<esc>i
	autocmd filetype c iab ifN if<space>(NULL<space>!=<space>)<esc>i
	autocmd filetype cpp iab fiN if<space>(nullptr<space>!=<space>)<esc>i
	autocmd filetype c iab fiN if<space>(NULL<space>!=<space>)<esc>i

	autocmd filetype c,cpp iab mai 	<c-r>=CompletionMain()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype c,cpp iab mia 	<c-r>=CompletionMain()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype c,cpp
		function! CompletionMain()
			return "int main(int argc, char* argv[])" . BreakLine() . "{" .  BreakLine() . "}"
		endfunction  

	autocmd filetype c,cpp iab try  <c-r>=CompletionTry()<cr><esc>3kO<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype c,cpp
		function! CompletionTry()
			return "try\<cr>{\<cr>}\<cr>catch ()\<cr>{\<cr>}"
		endfunction

	autocmd filetype c,cpp iab met  template<space><><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype c,cpp iab tem  template<space><><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype c,cpp iab swi  switch<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype c,cpp iab whi  while<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype c,cpp iab for  for<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype c,cpp iab fro  for<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype c,cpp iab if   if<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype c,cpp iab fi   if<space>()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype c,cpp inoremap .<space> ->

	autocmd filetype c,cpp nnoremap <localleader>/ 0i//<esc>

	autocmd filetype c,cpp nnoremap <localleader>s :w<cr>:call SwitchSourceHeader()<cr>
	autocmd filetype c,cpp
		function! SwitchSourceHeader() 
			" header -> source
			if (expand("%:e") == "h")
				let cmd = 'fd -1 ' . expand("%:t:r") . ".cpp"
				let result = system(cmd)
				if (len(result) != 0)
					exec "edit " . result
					return 
				endif

				let cmd = 'fd -1 ' . expand("%:t:r") . ".cc"
				let result = system(cmd)
				if (len(result) != 0)
					exec "edit " . result
					return 
				endif

				let cmd = 'fd -1 ' . expand("%:t:r") . ".c"
				let result = system(cmd)
				if (len(result) != 0)
					exec "edit " . result
					return 
				endif

				echo "no source file found"
				return

			" source -> header
			elseif (expand("%:e") == "cc" || expand("%:e") == "cpp" || expand("%:e") == "c")
				let cmd = 'fd -1 ' . expand("%:t:r") . ".h"
				let result = system(cmd)
				if (len(result) != 0)
					exec "edit " . result
					return 
				endif

				echo "no header file found"
				return 
			endif

		endfunction

augroup END
