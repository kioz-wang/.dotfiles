# packages list

## pacstrap

在 live os 上，使用`pacstrap`安装一些必需的软件包。

安装`linux`核心的几个包

```shell
pacstrap -K /mnt base linux linux-firmware
```

针对`intel`的`CPU`补丁

```shell
pacstrap -K /mnt intel-ucode
```

文档系统

```shell
pacstrap -K /mnt man-db man-pages texinfo
```

终端复用器和编辑器

```shell
pacstrap -K /mnt tmux vim
```

引导器（UEFI）

```shell
pacstrap -K /mnt grub efibootmgr
```

## arch-chroot

`chroot` 到刚安装好的文件系统中，现在可以使用`pacman`安装软件包了。

> 当然，也可以在外面继续使用`pacstrap`安装。

无线网驱动和控制程序

```shell
pacman -S iwd
```

蓝牙驱动和控制程序

```shell
pacman -S bluez bluez-utils
```
## reboot

重启进入新系统中，使用`pacman`安装余下软件包。

基础的构建系统、调试工具、版本管理等

```shell
pacman -S base-devel cmake ninja gdb git python python-pip ipython
```

- `shell`补全
    - `bash-completion`
- `pacman`扩展工具
    - `pacman-contrib`
- 非root用户的提权
    - `sudo`
- 远程连接
    - `openssh`
- 基础的系统管理工具
    - `htop`, `lsof`, `strace`, `acpi`

一些命令行实用工具，如编辑器、剪切板支持、快速搜索等：

```
neovim
wl-clipboard cliphist
fzf ripgrep fd
lazygit
zip unzip
wget
bat
tree
jq
```

安装桌面环境（DE）

```
wayland hyprland
hyprpaper waybar wofi hypridle hyprlock mako
mesa-utils brightnessctl playerctl wireplumber pipewire-alsa
```

桌面使用工具

- 文件管理：`dolphin`
- 终端模拟器：`alacritty`
- 浏览器：`firefox`
- PDF阅读器：`okular`
- 图片查看：`loupe`
- 密钥环：`gnome-keyring`, `seahorse`

X11 兼容

`xorg-xwayland`, `xorg-xrdb`

字体

```
ttf-inconsolata-nerd ttf-firacode-nerd ttf-sourcecodepro-nerd ttf-cascadia-mono-nerd
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
otf-font-awesome
```

`xdg`支持

```
xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
```

`.dotfiles`管理工具

`stow`



