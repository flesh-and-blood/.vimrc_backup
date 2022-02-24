let maplocalleader="," 

filetype 	plugin indent on
filetype 	detect
syntax 		enable

" arduino-ctags leader-d => definition / leader-t => return
nnoremap <localleader>w :mksession!<cr>:w<cr>
nnoremap <space> za
inoremap jk <esc>
vnoremap jk <esc>

" jumping between splits
nnoremap <localleader>h <c-w>h
nnoremap <localleader>j <c-w>j
nnoremap <localleader>k <c-w>k
nnoremap <localleader>l <c-w>l

" jumping between tabs
nnoremap <localleader>1 1gt
nnoremap <localleader>2 2gt
nnoremap <localleader>3 3gt
nnoremap <localleader>4 4gt
nnoremap <localleader>5 5gt
nnoremap <localleader>6 6gt
nnoremap <localleader>7 7gt
nnoremap <localleader>8 8gt
nnoremap <localleader>9 9gt
nnoremap <localleader>0 :tablast<cr>

" n => next / l => last of current line
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f(vi[<cr>
onoremap in{ :<c-u>normal! f(vi{<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap il{ :<c-u>normal! f}vi{<cr>

" global settings 
set wrap
set encoding=utf-8
set nocompatible
set showcmd
set showmatch
set wildmenu
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set statusline=%F:\ %l/%L
set autoindent
set smartindent
set number
set relativenumber 
set cursorline 
set cursorcolumn
set ruler
set incsearch
set hlsearch
set foldenable

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
	elseif getline(1) =~ '^#!.*python'
		setfiletype python
	endif
endfunction

