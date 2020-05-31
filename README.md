<!-- vim-markdown-toc GFM -->

* [INTRODUCTION](#introduction)
    * [cli-APP](#cli-app)
        * [Homebrew](#homebrew)
        * [oh-my-zsh](#oh-my-zsh)
            * [zsh plugin](#zsh-plugin)
        * [neovim](#neovim)
        * [miscellaneous](#miscellaneous)
    * [gui-APP](#gui-app)
        * [开发工具](#开发工具)
            * [JetBrains 开发工具系列](#jetbrains-开发工具系列)
        * [效率工具](#效率工具)
        * [娱乐工具](#娱乐工具)
            * [Chrome 插件](#chrome-插件)
    * [References](#references)

<!-- vim-markdown-toc -->

# INTRODUCTION

最近换了电脑，又得重新配置一遍，照着旧电脑的配置找那些软件真的是很烦，而且很多好用的命令行工具我可能直接就给忘了，后面要用的时候又想不起来。而且其实换过几次电脑之后发现大部分配置都是相同的，而把时间花在重复的事情上是没有意义的，所以打算把一般配置和安装方法都记录下来，最好是能够写个脚本一键安装，以后再换设备就从这儿同步。

其实网上已经有很多类似的 awesome 系列了，但是总是感觉不太称手，要么太多我用不上，要么太少(一般不会)我觉得不够，所以就重复造轮子了。

## cli-APP

首先肯定是把命令行环境给搭建起来：

### [Homebrew](https://brew.sh/)

macOS 下的包安装管理器。

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### [oh-my-zsh](https://ohmyz.sh/)

开箱即用的 shell，暂时没有自己配置 zsh 的打算。

macOS 现在默认是使用 zsh，但是它自带的 zsh 有点老了，换 brew 的：

```sh
% brew install zsh
```

安装的是 zsh-5.7.1，把它放`/etc/shells`里头，并切换过去：

```sh
% sudo echo "/usr/local/bin/zsh-5.7.1" >> /etc/shells
% chsh -s /usr/local/bin/zsh-5.7.1
```

然后安装 oh-my-zsh：

```sh
% sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### zsh plugin

* [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)

快速跳转，这个插件是 oh-my-zsh 自带的，所以直接在`~/.zshrc`的`plugins`里面填就可
以了，不用额外安装。

听说韦易笑的[z](https://github.com/skywind3000/z.lua)更好用一点，但是我还没有换，下次可以试试

* [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh)

带高亮的 man，看着舒服，而且也是 oh-my-zsh 自带的。

* [zsh-syntax-highlighting]()

给敲出来的命令加上高亮，也是舒服。

```sh
% git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

* [zsh-autosuggesstions](https://github.com/zsh-users/zsh-autosuggestions)

基于历史命令的补全，因为 80/20 原则，所以非常方便。

```sh
% git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

完成上面的安装步骤后在`~/.zshrc`的`plugins`里面填上这几个插件就可以使用了：

```sh
plugins=(
	z
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	colored-man-pages
)
```

### [neovim](https://neovim.io/)

原生的 vim 用着有点不太舒服，使用了一段时间的 neovim 就再也回不去了：

```sh
% brew install neovim
```

vimrc 已经上传到[这里](https://github.com/BalusChen/deep-config/tree/master/nvim)了。

但是有的其他依赖还是得自己来：

* [Fira Code](https://github.com/tonsky/FiraCode)

Fira Code 字体，这里不用其他地方也得用。

```sh
% brew tap homebrew/cask-fonts
% brew cask install font-fira-code
```

* [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

还是字体，用在需要 Powerline 的地方：

```sh
% brew tap homebrew/cask-fonts
% brew cask install font-hack-nerd-font
```

### miscellaneous

* [tmux](https://github.com/tmux/tmux/wiki)

```sh
% brew install tmux
```

窗口复用工具，，配合这个[小的配置](https://github.com/BalusChen/deep-config/blob/master/tmux/tmux.conf)，再也不用开一大堆窗口、Tab😎

* [fzf](https://github.com/junegunn/fzf)

命令行模糊查找器，不想使用 find 时可以用这个，但是面试问到 find 你就完了😱。

```sh
% brew install fzf

# 安装键位绑定以及补全提示
% $(brew --prefix)/opt/fzf/install
```

* [fd](https://github.com/sharkdp/fd)

find 的替代品。

```sh
% brew install fd
```

* [ripgrep](https://github.com/BurntSushi/ripgrep)

比 grep 好用太多，但是和 fzf 一样可能让你在面试时被问 grep 时哑口无言。

```sh
% brew install ripgrep
```

* [tig](https://github.com/jonas/tig)

面向文本模式的 git。开始感觉用纯 git 就 OK 了，但是试用了几天就回不去了。

```sh
% brew install tig
```

* [trash](https://github.com/sindresorhus/trash)

把不要的文件丢垃圾桶里而不是直接删除，可以用来替换 rm， 是治 rm 的后悔药。

```sh
% brew install trash
```

* [jq](https://stedolan.github.io/jq/)

命令行 json 处理器。看着几十 k 甚至更大的 json 文件却都挤在一行而气得不行的时候我就会 jq 一下。

```sh
% brew install jq
```

* [httpie](https://httpie.org/)

带高亮的 curl，更舒服，但是一个弊端是和 curl 并不是完全兼容的(参数、选项)，所以还得记两套。

```sh
% brew intall httpie
```

* [htop](https://hisham.hm/htop/)

更好用的 top，而且带有高亮；类似的还有一个[glances](https://nicolargo.github.io/glances/)，但是感觉比 htop 慢挺多的。

```sh
% brew install htop glances
```

* [hexyl](https://github.com/sharkdp/hexyl)

带高亮的命令行十六进制查看器，不得不说带高亮真的是看着就舒服。

```sh
% brew install hexyl
```

* [cloc](https://github.com/AlDanial/cloc)

统计一下项目里头用了哪些语言，文件有多少，有效代码有多少，注释有多少，空行有多少，好在读源码之前有个心理准备。

```sh
% brew install cloc
```

* [tldr](https://github.com/tldr-pages/tldr)

简化的、社区驱动的 man-page。下载了一个`tar.xz`的文件，不知道是该用`-j`还是`-z`还是，man 一下发现 doc 老长，找半天找不到？你值得拥有！

```sh
% brew install tldr
```

* [icdiff](https://github.com/jeffkaufman/icdiff)

diff 的升级版，带高亮，而且可以配合 git 一起用。

```sh
% brew install icdiff
```

* [ncdu](https://dev.yorhel.nl/ncdu)

更好用的磁盘使用情况分析器，而不用忍受 du 的长串输出了。

```sh
% brew install ncdu
```

* [mosh](https://mosh.org/)

ssh 的替代工具。相比于 ssh，它更加鲁棒。

```sh
% brew install mosh
```

* [shellcheck](https://github.com/koalaman/shellcheck)

用于 shell 脚本的静态检查工具，写 shell 总算可以轻松一点了。

```sh
% brew install shellcheck
```

* [mycli](https://www.mycli.net/)

比原生的 mysql 工具更好用，带高亮和补全，完美。

```sh
% brew install mycli
```

* [multitail](https://www.vanheusden.com/multitail/)

监控多个文件，tail 的升级版。省去了开多个 panel/tab 再使用 tail 的繁琐，而且有许多其它好用的功能。

```sh
% brew install multitail
```

## gui-APP

### 开发工具

* [iTerm2](https://iterm2.com/)

替代 macOS 原生的 terminal，自带 tmux 的加持，开新 panel 方便的多了。

```sh
% brew cask install iterm2
```

* [fork](https://git-fork.com/)

git gui 工具，虽然可能比较小众，但是挺好用的。

```sh
% brew cask install fork
```

* [Dash](https://kapeli.com/dash)

API 文档查询工具，配合 Alfred 感觉很 OK。

```sh
% brew cask install dash
```

* [charles](https://www.charlesproxy.com/)

http 抓包工具。

```sh
% brew cask install charles
```

#### JetBrains 开发工具系列

首先安装[jetbrains toolbox](https://www.jetbrains.com/toolbox-app/)

```sh
% brew cask install jetbrains-toolbox
```

然后使用 toolbox 来安装 Clion/GoLand/DataGrip 等开发工具，这样升级、回退版本非常方便。

IDE 外最重要的就是插件了：

* [IdeaVim](https://github.com/JetBrains/ideavim)

vim 模拟器。

* [Key Promoter X](https://plugins.jetbrains.com/plugin/9792-key-promoter-x/)

教你学习快捷键的插件。

* [Atom Material Icons](https://plugins.jetbrains.com/plugin/10044-atom-material-icons/)

各种各样的图标。

* [Nyan Progress Bar](https://plugins.jetbrains.com/plugin/8575-nyan-progress-bar/)

挺漂亮的进度条。

* [Rainbow Brackets](https://plugins.jetbrains.com/plugin/10080-rainbow-brackets)

🌈括号，必备。

* [Highlight Bracket Pair](https://plugins.jetbrains.com/plugin/10465-highlightbracketpair)

高亮最近的，对于 C/C++/Go 这些语言，在标示作用域方面很有用。

* [Spacegrey Theme](https://plugins.jetbrains.com/plugin/12122-spacegray-theme/) 和 [Gruvbox Theme](https://plugins.jetbrains.com/plugin/12310-gruvbox-theme/)

必备的两个配色。

* [Material Theme UI](https://plugins.jetbrains.com/plugin/8006-material-theme-ui/)

好看的 UI，坏处是可能会让 IDE 变慢，鱼和熊掌不可兼得。

* [Git Tool Box](https://plugins.jetbrains.com/plugin/7499-gittoolbox)

Git 相关的一系列工具的继承，实时在编辑器里面显示 blame 信息感觉是最有用的。

### 效率工具

* [Alfred](https://www.alfredapp.com/)

macOS 上超好用的效率工具。可通过热键，关键字，文本扩展等功能提高效率。搜索 mac 和网络，并通过自定义操作来控制 mac 来提高生产力。

```sh
% brew cask install alfred
```

* [Contexts](https://contexts.co/)

```sh
% brew cask install contexts
```

窗口切换工具。

* [QSpace](https://qspace.awehunt.com/)

更好用的 Finder，可以在 App Store 中下载，可以看看[这篇介绍](https://sspai.com/post/56373)。

* [Edison Mail](https://mail.edison.tech/mac)

更好用的邮件客户端，速度快，操作人性化；可以在 App Store 中下载。

* [Go2Shell](https://zipzapmac.com/Go2Shell)

从 Finder 直接到终端。

```sh
% brew cask install go2shell
```

* [CheatSheet](https://cheatsheet-mac.en.softonic.com/mac)

快捷键查询工具。

```sh
% brew cask install cheatsheet
```

* [Microsoft To Do](https://todo.microsoft.com/)

微软家的 todo 工具。

* [Typora](https://typora.io/)

很好用的 Markdown 写作工具。

```sh
% brew cask install typora
```

* [draw.io](https://app.diagrams.net/)

超好用的画图工具。

```sh
% brew cask install drawio
```

* [CleanMyMac X](https://cleanmymac.macpaw.com/)

mac 上的清理工具。

```sh
% brew cask install cleanmymac
```

* [Rectangle](https://rectangleapp.com/)

轻松移动和调整窗口大小，是[Spectacle](https://www.spectacleapp.com/)的替代品。

```sh
% brew cask install rectangle
```

* [PDF Expert](https://pdfexpert.com/)

mac 上最好的 PDF 阅读工具。

```sh
% brew cask install pdf-expert
```

* [Macs Fan Control](https://www.crystalidea.com/macs-fan-control)

手动调节 mac 的风扇，感觉很有必要。

```sh
% brew cask install macs-fan-control
```

* [Pocket](https://app.getpocket.com/)

收藏管理工具，配合 Chrome 中的[相关插件](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj)一起使用非常方便。

* [Copy +](https://apps.apple.com/us/app/copy-manage-clipboard-history/id1472854234?mt=12)

剪贴板管理工具，可以在 App Store 中下载。

* [Keka](https://www.keka.io/)

压缩、解压缩工具。

```sh
% brew cask install keka
```

* [Dropbox](https://www.dropbox.com/)

微软出的同步工具，比 iCloud 的优势我感觉是更加直观，可以直接通过 menu bar 很方便地查看文件同步进度。

```sh
% brew cask install dropbox
```

### 娱乐工具

* [IINA](https://iina.io/)

应该是 macOS 上最好看的音乐播放器了，除了好看，功能也是很完善的。

```sh
% brew cask install iina
```

* [Downie 4](https://software.charliemonroe.net/downie/)

macOS 上很好用的视频下载工具，功能强大。

```sh
% brew cask install downie
```

#### Chrome 插件

* [One Tab](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall?hl=en)

记住打开的 tab。

* [Bookmark Sidebar](https://chrome.google.com/webstore/detail/bookmark-sidebar/jdbnofccmhefkmjbkkdkfiicjkgofkdh?hl=en)

侧边栏书签。

* [Infinity New Tab](https://chrome.google.com/webstore/detail/infinity-new-tab-producti/dbfmnekepjoapopniengjbcpnbljalfg?hl=en)

漂亮的主页，而且可以添加主页书签。

* [LastPass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)

密码管理工具。

* [Wikiwand](https://chrome.google.com/webstore/detail/wikiwand-wikipedia-modern/emffkefkbkpkgpdeeooapgaicgmcbolj)

现代化的 Wikipedia。

* [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)

vim 模拟器。

## References

[有哪些命令行的软件堪称神器](https://www.zhihu.com/question/59227720)
