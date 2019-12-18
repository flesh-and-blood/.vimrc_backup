" something reminded when following a operator like d
" i means inner
" t means until
" /somethinfg search result can also be a location
" \+ refers to the same character leading the \

" color theme setting------------   {{{
    " it is installed by trizen -S vim-badwolf-git
    colorscheme badwolf 
    
"" }}}

" type mistake repair------------   {{{
    iab mian int<space>main(int<space>argc,<space>char*<space>argv[])<esc>o<esc>0i
    iab mina int<space>main(int<space>argc,<space>char*<space>argv[])<esc>o<esc>0i
    iab main int<space>main(int<space>argc,<space>char*<space>argv[])<esc>o<esc>0i
    iab mani int<space>main(int<space>argc,<space>char*<space>argv[])<esc>o<esc>0i

    iab cla class<CR>{public:<CR><CR>private:}<esc>jA;<esc>kkkkkA
    iab cal class<CR>{public:<CR><CR>private:}<esc>jA;<esc>kkkkkA
    
    iab str struct<CR>{}<esc>jA;<esc>kkkA

    iab enu enum<CR>{}<esc>jA;<esc>kkkA

    iab if if<space>()<esc>o{}<esc>kkE<esc>i

    iab whi while<space>()<esc>o{}<esc>kkE<esc>i

    iab for for<space>()<esc>o{}<esc>kkEi

    iab swi switch<space>()<esc>o{}<esc>kkEi

    iab eli else<space>if<space>()<esc>o{}<esc>kkEi

    iab els else<space>()<esc>o{}<esc>kkEi

    iab cas case:<space><esc>B4li

    iab viod void
    iab vdoi void
    iab vdio void

    iab somethinfg something
    iab soemthign something
    iab somethign something
    iab someghitn something
    iab someghitn something

    iab reutrn return
    iab reutnr return

    iab noraml normal

    iab calss class

    iab cahr char
    iab chra char

    iab itn int

    iab claer clear
    iab cleaar clear
    iab cleear clear
    iab clare clear

    iab wath what
"" }}}

" orginal global setting------------   {{{
    let mapleader=','

    " g means global
    let g:netrw_liststyle=3

    let g:netrw_banner=0
    
    syntax enable

    filetype plugin indent on

    filetype indent on
"" }}}

" ------------   {{{
    " search down into subfolders
    " provides tab-completion for all file-related tasks
    set path+=**

    set expandtab

    set autoindent

    set smartindent

    set shiftround

    set tabstop=4

    set softtabstop=4

    set shiftwidth=4

    " show line relative numbers
    set relativenumber

    " show command in the buttom bar
    set showcmd

    " highlight current line
    set cursorline

    " show line relative numbers
    set relativenumber

    " show command in the buttom bar
    set showcmd

    " highlight current line
    set cursorline

    " visual autocomplete for command menu
    set wildmenu

    set lazyredraw

    " highlight match {[()]}
    set showmatch

    set hlsearch

    set incsearch

    " enable folding
    set foldenable

    " open most folds by default
    set foldlevelstart=12

    " fold based on indent level
    set foldmethod=indent
"" }}}

" quick location ------------   {{{
    " you can call this inner next ( of this line
    onoremap in( :<c-u>normal! f(vi(<CR>

    " you can call this inner last of this line 
    onoremap il( :<c-u>normal! F)vi(<CR>
    
    " same thing with [
    onoremap in[ :<c-u>normal! f[vi(<CR>
    onoremap il] :<c-u>normal! F]vi(<CR>

    inoremap <leader>com "------------<space><space><space>{{{<CR>"<space>}}}<esc>k0a<space>
"" }}}

" inoremaps without function------------   {{{
    inoremap <leader>ifn #ifndef<CR>#endif<esc>kA<space>

    inoremap <leader>ifd #ifdef<CR>#endif<esc>kA<space>

    inoremap <leader>end #endif

    inoremap <leader>inc #include<space><><esc>i

    inoremap <leader>def #define<space>

    inoremap <leader>els #else<space>

    inoremap <leader>eli #elif<space>

    inoremap .<space> ->
"" }}}

" some maps between many modes------------   {{{
    " set jk for esc
    " esc maybe too far, hope jk will not be used in future
    inoremap jk <esc>
    vnoremap jk <esc>
    inoremap <esc> <nop>
    vnoremap <esc> <nop>

    " move to the beginning of the line
    nnoremap B ^
    vnoremap B ^
    " move to the end of the line
    nnoremap E $
    vnoremap E $

    noremap <space> za
"" }}}

" nnoremaps------------   {{{

    nnoremap <leader>m :make<CR>

    nnoremap <leader>v :vsplit<CR>

    nnoremap <leader>h :split<CR>

    nnoremap <leader>q :wq<CR>

    nnoremap <leader>w :w<CR>

    " nh stands for no hightlight
    nnoremap <leader>nh :nohlsearch<CR>
"" }}}

" nnoremaps with function------------   {{{
    nnoremap <leader>s :call SwitchSourceHeader() <CR>
    function! SwitchSourceHeader()
        if (expand("%:e") == "cpp")
            find %:t:r.h
        else
            find %:t:r.cpp
        endif
    endfunction
"" }}}


" inoremaps with function------------   {{{
    inoremap ( ()<esc>i
    inoremap [ []<esc>i
    inoremap { {<CR>}<esc>kA<CR>
    inoremap ) <esc>:call ClosePair(')')<CR>a
    inoremap ] <esc>:call ClosePair(']')<CR>a
    inoremap } <esc>:call CloseBrachet()<CR>a
"    idnoremap ' <esc>:call QuoteDelim(''')<CR>a
"   ndoremap " <esc>:call QuoteDelim('"')<CR>a

    function ClosePair(char)
        if getline('.')[col('.' - 1) ==# a:char]
            return "\<Right>"
        else
            return a:char
        endif
    endfunction

    function CloseBrachet()
        if match(getline(line('.') + 1), '\s*}') < 0
            return "\<CR>}"
        else
            return "\<esc>j0f}a"
        endif
    endfunction

    function QuoteDelim(char)
        let line = getline('.')
        let col = col('.')
        if line[col - 2] ==# "\\"
            return a:char
        elseif line[col - 1] ==# a:char
            return "\<Right>"
        else
            return a:char.a:char."\<esc>i"
        endif
    endfunction
"" }}}
