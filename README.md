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

简化的、社区驱动的 man-page。下载了一个`tar.xz`的文件，不知道是该用`-j`还是`-z`还是，man 一下发现 doc 老长，找半天找不到？

```sh
% brew install tldr
```

* [icdiff](https://github.com/jeffkaufman/icdiff)

diff 的升级版，带高亮，而且可以配合 git 一起用。

```sh
% brew install icdiff
```

* [ncdu](https://dev.yorhel.nl/ncdu)

更好用的磁盘使用情况分析器，而不用忍受 du 的长串输出了：

```sh
% brew install ncdu
```

* [pydf](https://pypi.org/project/pydf/)

不知道该不该安装 pydf，感觉和 ncdu 的功能重叠了。

```sh
% pip3 install pydf --user
```

* [shellcheck](https://github.com/koalaman/shellcheck)

用于 shell 脚本的静态检查工具，写 shell 总算可能轻松一点了。

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

## References

[有哪些命令行的软件堪称神器](https://www.zhihu.com/question/59227720)
