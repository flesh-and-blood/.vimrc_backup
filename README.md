# 我的个人 linux 配置备忘录

## 一些小问题

+ 因为我在安装 vim 的 [YCM](https://github.com/ycm-core/YouCompleteMe) 插件有[检测不到 python 的问题](https://github.com/ycm-core/YouCompleteMe/issues/3635)。需要添加以下参数重新编译 [vim](https://github.com/vim/vim)。 <br> [./configure --with-features=huge --enable-multibyte --enable-gtk3-check --enable-rubyinterp=yes --enable-pythoninterp --enable-python3interp --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope](https://stackoverflow.com/questions/61240101/youcompleteme-unavailable-unable-to-load-python)
  
+ vundle 插件管理在 aur 上是 out-date 的，在执行 PluginInstall 的时候遇到变量未定义的问题就是这个原因，需要改装 vundle-git
  
+ openwrt 的代理设置在设备定时重启之后会出现 ip 配置失败的问题。主机的网关会指到 ap 上。去掉 ap 之后便配不到 ap。不知道是什么问题。