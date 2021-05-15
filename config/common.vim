" common settting 
let maplocalleader=";" 

filetype 	plugin indent on
filetype 	detect
syntax 		enable

" arduino-ctags leader-d => definition / leader-t => return
nnoremap <localleader>d <c-]>zz
nnoremap <localleader>t <c-t>zz

nnoremap <localleader>w :mksession!<cr>:w<cr>
nnoremap <space> za
inoremap jk <esc>
vnoremap jk <esc>

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

" global settings 
set 	wrap			encoding=utf-8			nocompatible
set 	showcmd 		showmatch				wildmenu
set 	tabstop=4		shiftwidth=4			"expandtab
set 	laststatus=2	statusline=%F:\ %l/%L
set 	autoindent 		smartindent
set 	number 			relativenumber 
set 	cursorline 		cursorcolumn			ruler
set 	incsearch 		hlsearch
set 	foldenable

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

augroup common
	autocmd!

	autocmd BufEnter * call FixFiletype()

augroup END

function! FixFiletype()
	if did_filetype()
		finish
	elseif getline(1) =~ '^#!.*bash'
		setfiletype bash
	elseif getline(2) =~ '^#.*bash.*'
		setfiletype bash
	endif
endfunction

