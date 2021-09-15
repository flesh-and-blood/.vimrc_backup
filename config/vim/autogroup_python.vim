augroup Python
	autocmd!

	autocmd filetype python setlocal 	foldmethod=syntax

	autocmd filetype python iab tru 	True
	autocmd filetype python iab true 	True
	autocmd filetype python iab fal 	False
	autocmd filetype python iab false 	False

	autocmd filetype python iab cla 	class:<esc>i
	autocmd filetype python iab cal 	class:<esc>i

	autocmd filetype python iab ret 	return

	autocmd filetype python iab for 	forin<space>:<esc>Fra
	autocmd filetype python iab fro 	forin<space>:<esc>Fra

	autocmd filetype python iab hwi 	while:<esc>i
	autocmd filetype python iab iwh 	while:<esc>i
	autocmd filetype python iab whi 	while:<esc>i
	autocmd filetype python iab while 	while:<esc>i

	autocmd filetype python iab try 	try:<esc>0oexcept<space>as<space>:<esc><<ko

	autocmd filetype python iab def 	def():<esc>2hi
	autocmd filetype python iab init 	def<space>__init__(self,):<esc>hi

	autocmd filetype python iab else 	else:<esc>i
	autocmd filetype python iab elif 	elif:<esc>i
	autocmd filetype python iab if 		<c-r>=CompletionIf()<cr><esc>Bf:i
	autocmd filetype python
		function! CompletionIf()
			let l:cursor_pos = getpos(".")
			normal b

			let l:wordUnderCursor = expand("<cword>")
			if l:wordUnderCursor ==# 'else'
				normal dw
				return "elif"

			else
				call setpos('.', l:cursor_pos)
				return "if:"

			endif

		endfunction

augroup END

