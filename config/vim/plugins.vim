call vundle#begin() 
	Plugin 'VundleVim/Vundle.vim' 

    Plugin 'valloric/youcompleteme'
	Plugin 'rdnetto/YCM-Generator'
	Plugin 'git://git.wincent.com/command-t.git' 
	Plugin 'octol/vim-cpp-enhanced-highlight' 
	Plugin 'airblade/vim-gitgutter'
    Plugin 'rhysd/vim-clang-format'
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
nnoremap <localleader>q 	:NERDTreeClose<cr>:UndotreeHide<cr>:mksession!<cr>:w<cr>:qall<cr>
nnoremap <localleader>o 	:NERDTreeFocus<cr>
nnoremap <localleader>rt 	:NERDTreeRefreshRoot<cr>
nnoremap <localleader>u 	:NERDTreeClose<cr>:UndotreeToggle<cr>
nnoremap <localleader>n 	:UndotreeHide<cr>:NERDTreeToggle<cr>

"
nnoremap git :GitGutterToggle<cr>
nnoremap gih :GitGutterLineHighlightsToggle<cr>
nnoremap gif :GitGutterFold<cr>
nnoremap gin <Plug>(GitGutterNextHunk)
nnoremap gip <Plug>(GitGutterPrevHunk)

let g:ycm_clangd_binary_path = "/usr/bin/clangd"
let g:ycm_global_ycm_extra_conf = ".vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Close preview window after completing the insertio
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                 " Don't confirm python conf
let g:ycm_always_populate_location_list = 1      " Always populae diagnostics lit
let g:ycm_enable_diagnostic_signs = 1            " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1          " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20                " Max number of completion suggestions 
let g:ycm_max_num_identifier_candidates = 10     " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                       " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                 " Show diagnostic display features
let g:ycm_error_symbol = '>>'                    " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1            " Display icons in Vim's gutter, error, warnings

let g:ycm_enable_diagnostic_highlighting = 1     " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1            " Echo line's diagnostic that cursor is on

" https://clangd.llvm.org/installation.html
let g:ycm_clangd_uses_ycmd_caching = 0			 " Let clangd fully control code completion
let g:ycm_clangd_binary_path = exepath("clangd") " Use installed clangd, not YCM-bundled clangd which doesn't get updates.

nnoremap <c-]> 				:YcmCompleter GoTo<cr>
nnoremap <localleader>f		:YcmCompleter FixIt<cr>
nnoremap <localleader>r		:YcmCompleter RefactorRename

nnoremap <localleader>a		:ClangFormat<cr>
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}
