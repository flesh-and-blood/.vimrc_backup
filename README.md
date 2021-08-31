# 我的个人 linux 配置备忘录

## 一些小问题

+ vundle 插件管理在 aur 上是 out-date 的，在执行 PluginInstall 的时候遇到变量未定义的问题就是这个原因，需要改装 vundle-git

+ kde 桌面安装中文输入法的时候需要使用 **fcitx-im** 而不只是 **fcitx**。然后向 **pam_environment** 写入
  + GTK_IM_MODULE=fcitx
  + QT_IM_MODULE=fcitx
  + XMODIFIERS=@im=fcitx 
