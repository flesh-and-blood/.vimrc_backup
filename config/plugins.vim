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

" setting for auto-pairs
let g:AutoPairsFlyMode = 1
function! FixAutoPairPluginAndEatSpace() 
	let i = 0 
	while i < 20 
		call EatChar() 
		let i += 1 
	endwhile 
	return ''
endfunction

" setting for nerdtree 
augroup nerdtree 
	autocmd!  

	" Exit Vim if NERDTree is the only window left.  
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif 
	  
	" If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.  
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

augroup END

" hightlight config for https://vimawesome.com/plugin/vim-cpp-enhanced-highlight 
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highlight       = 1
let g:cpp_class_scope_highlight           = 1
let g:cpp_class_decl_highlight            = 1
let g:cpp_posix_standard                  = 1

" theme setting
colorscheme gruvbox
let g:gruvbox_contrast_dark='dark'

" common mapping
nnoremap <localleader>q :NERDTreeClose<cr>:UndotreeHide<cr>:mksession!<cr>:w<cr>:qall<cr>
nnoremap <localleader>u :NERDTreeClose<cr>:UndotreeToggle<cr>
nnoremap <localleader>n :UndotreeHide<cr>:NERDTreeToggle<cr>
