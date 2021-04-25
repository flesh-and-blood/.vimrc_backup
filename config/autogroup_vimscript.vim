augroup vimrc 
	autocmd!

	autocmd filetype vim setlocal foldmethod=indent

	autocmd filetype vim iab ret return

	autocmd filetype vim iab fun <c-r>=CompletionVimFunction()<cr><esc>kA
	autocmd filetype vim
		function! CompletionVimFunction()
			return "function!\<cr>endfunction"
		endfunction

	autocmd filetype vim iab if <c-r>=CompletionVimIf()<cr><esc>kA
		function! CompletionVimIf()
			return "if\<cr>endif"
		endfunction

augroup END


