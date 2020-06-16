# 我的个人 linux 配置备忘录

## 一些小问题

+ 因为我在安装 vim 的 [YCM](https://github.com/ycm-core/YouCompleteMe) 插件有[检测不到 python 的问题](https://github.com/ycm-core/YouCompleteMe/issues/3635)。需要重新编译 [vim](https://github.com/vim/vim)。 <br> [./configure --with-features=huge --enable-multibyte --enable-gtk3-check --enable-rubyinterp=yes --enable-pythoninterp --enable-python3interp --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope](https://stackoverflow.com/questions/61240101/youcompleteme-unavailable-unable-to-load-python)