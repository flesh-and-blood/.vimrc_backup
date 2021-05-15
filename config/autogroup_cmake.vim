augroup CMakeLists
	autocmd!

	autocmd filetype cmake setlocal foldmethod=indent
	autocmd filetype cmake nnoremap <localleader>/ 0i#<esc>

	autocmd filetype cmake iab std 	CMAKE_CXX_STANDARD
	autocmd filetype cmake iab rib	DESCRIPTION
	autocmd filetype cmake iab des 	DESTINATION 
	autocmd filetype cmake iab inte	INTERFACE
	autocmd filetype cmake iab prop PROPERTIES
	autocmd filetype cmake iab tag	TARGETS
	autocmd filetype cmake iab ver	VERSION
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

	autocmd filetype cmake iab setp <c-r>=CompleteTargetProperties()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompleteTargetProperties()
			return "set_target_properties()"
		endfunction

	autocmd filetype cmake iab cm	cmake_minimum_required()<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	" 这里是用 gcc 的参数来代指
	autocmd filetype cmake iab I 	<c-r>=CompletionIncludeDirectory()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake 
		function! CompletionIncludeDirectory()
			return "target_include_directories()"
		endfunction

	autocmd filetype cmake iab D	<c-r>=CompletionTargetDefinition()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake 
		function! CompletionTargetDefinition()
			return "target_compile_definitions()"
		endfunction

	autocmd filetype cmake iab l	<c-r>=CompletionTargetLibrary()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionTargetLibrary()
			return "target_link_libraries()"
		endfunction

	autocmd filetype cmake iab conf	<c-r>=CompletionConfigFile()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype
		function! CompletionConfigFile()
			return "configure_file()"
		endfunction

	autocmd filetype cmake iab pro	<c-r>=CompletionProject()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionProject()
			return "project()"
		endfunction

	autocmd filetype cmake iab inc	<c-r>=CompletionInclude()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionInclude()
			return "include()"
		endfunction

	autocmd filetype cmake iab op	<c-r>=CompletionOption()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionOption()
			return "option()"
		endfunction

	autocmd filetype cmake iab li	<c-r>=CompletionList()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionList()
			return "list()"
		endfunction

	autocmd filetype cmake iab set	<c-r>=CompletionSet()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionSet()
			return "set()"
		endfunction

	autocmd filetype cmake iab $	${}<left><c-r>=FixAutoPairPluginAndEatSpace()<cr>

	autocmd filetype cmake iab as	<c-r>=CompletionSubdirectory()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionSubdirectory()
			return "add_subdirectory()"
		endfunction

	autocmd filetype cmake iab ad	<c-r>=CompletionDependency()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionDependency()
			return "add_dependencies()"
		endfunction

	autocmd filetype cmake iab am	<c-r>=CompletionDefinition()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionDefinition()
			return "add_definitions()"
		endfunction

	autocmd filetype cmake iab ao	<c-r>=CompletionOutput()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake 
		function! CompletionOutput()
			return "add_executable()"
		endfunction

	autocmd filetype cmake iab al	<c-r>=CompletionLink()<cr><left><c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake 
		function! CompletionLink()
			return "add_library()"
		endfunction

	autocmd filetype cmake iab func	<c-r>=CompletionCmakeFunction()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake 
		function! CompletionCmakeFunction()
			return "function()\<cr>endfunction()"
		endfunction

	autocmd filetype cmake iab for	<c-r>=CompletionForeach()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake iab fro	<c-r>=CompletionForeach()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake 
		function! CompletionForeach()
			return "foreach()<cr>endforeach()"
		endfunction

	autocmd filetype cmake iab if	<c-r>=CompletionIf()<cr><esc>O<c-r>=FixAutoPairPluginAndEatSpace()<cr>
	autocmd filetype cmake
		function! CompletionIf()
			return "if()<cr>endif()"
		endfunction

	autocmd filetype cmake iab else	else()<cr><c-r>=FixAutoPairPluginAndEatSpace()<cr>

augroup END
