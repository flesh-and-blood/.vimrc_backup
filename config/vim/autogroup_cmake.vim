augroup CMakeLists
	autocmd!

	autocmd filetype cmake setlocal foldmethod=indent
	autocmd filetype cmake nnoremap <localleader>/ 0i#<esc>

	autocmd filetype cmake iab aod 	ARCHIVE_OUTPUT_DIRECTORY
	autocmd filetype cmake iab sod 	LIBRARY_OUTPUT_DIRECTORY
	autocmd filetype cmake iab ood 	RUNTIME_OUTPUT_DIRECTORY

	autocmd filetype cmake iab std 	CMAKE_CXX_STANDARD
	autocmd filetype cmake iab ver	VERSION

	autocmd filetype cmake iab rib	DESCRIPTION
	autocmd filetype cmake iab des 	DESTINATION

	autocmd filetype cmake iab inte	INTERFACE
	autocmd filetype cmake iab prop PROPERTIES
	autocmd filetype cmake iab tag	TARGETS

	autocmd filetype cmake iab pri	PRIVATE
	autocmd filetype cmake iab pub	PUBLIC

	autocmd filetype cmake iab sha	SHARED
	autocmd filetype cmake iab sta	STATIC

	autocmd filetype cmake iab app	APPEND
	autocmd filetype cmake iab file	FILES

	autocmd filetype cmake iab off	OFF
	autocmd filetype cmake iab on	ON

	autocmd filetype cmake iab csd	CMAKE_CURRENT_SOURCE_DIR<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab psd	PROJECT_SOURCE_DIR<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab pbd	PROJECT_BINARY_DIR<c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab setp set_target_properties()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab cmv	cmake_minimum_required()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	" 这里是用 gcc 的参数来代指
	autocmd filetype cmake iab I 	target_include_directories()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab D	target_compile_definitions()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab l	target_link_libraries()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab conf	configure_file()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab pro	project()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab inc	include()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab op	option()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab li	list()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab set	set()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab $	${}<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab as	add_subdirectory()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab ad	add_dependencies()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab am	add_definitions()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab ao	add_executable()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab al	add_library()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab func	function()<cr>endfunction()<esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab fucn	function()<cr>endfunction()<esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab for	foreach()<cr>endforeach()<esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab fro	foreach()<cr>endforeach()<esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab if	if()<cr>endif()<esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab else	else()<cr><c-r>=FixAutoPairPluginAndEatSpace()<cr>

augroup END
