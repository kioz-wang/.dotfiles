# installation

- get ios from https://archlinux.org/download/, then verify signature if you want.
- prepare an installation medium, such as USB flash.

## boot the live

### get shell

没什么好说的，因主板而异。开始引导后，系统会把镜像拷贝到内存中运行。最终会得到一个`tty`以及一个已登陆的`shell`。

> live os 默认使用 zsh，但安装后的系统默认使用 bash

假定系统以 UEFI 64 模式启动，那么命令`cat /sys/firmware/efi/fw_platform_size`将输出64。

### get network

执行`ip link`查看网络接口，对于无线网络，使用`iwctl`连接。如果无法连接，使用`rfkill`查看无线设备是否被禁用。

### 硬盘分区和挂载

使用`fdisk`分区，然后格式化、挂载

```shell
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkswap /dev/nvme0n1p3

mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/efi
swapon /dev/nvme0n1p3
```

## pacstrap

使用`pacstrap`安装一些必需的软件包。

### linux

```shell
pacstrap -K /mnt base linux linux-firmware
```

### CPU 补丁

```shell
pacstrap -K /mnt intel-ucode
```

### 文档系统

```shell
pacstrap -K /mnt man-db man-pages texinfo
```

### 终端复用器和编辑器

```shell
pacstrap -K /mnt tmux vim
```

### 引导器（UEFI）

```shell
pacstrap -K /mnt grub efibootmgr
```

## fstab

```shell
genfstab -U /mnt >> /mnt/etc/fstab
```

This will detect mounted file systems and swap space.

## arch-chroot

`arch-chroot /mnt` 到刚安装好的文件系统中

### 调整时区

```shell
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

### 本地化支持（Localization）

Edit /etc/locale.gen and uncomment `en_US.UTF-8 UTF-8` and other needed UTF-8 locales. Generate the locales by running:

```shell
locale-gen
```

创建文件 /etc/locale.conf，并配置`LANG`

```conf
LANG=en_US.UTF-8
```

### 设置 root 密码

### 配置 grub

非常重要的一步！

```shell
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchMateX
```

> 还可使用`efibootmgr`查看启动项，或移除不需要的启动项。

### 网络配置

在最后，一定要把网络配置好，否则重启后进入系统将无法访问互联网！

#### 无线网驱动和控制程序

拷贝网络配置到新系统

```shell
exit # go out of chroot
cp /etc/systemd/network/* /mnt/etc/systemd/network/
arch-chroot /mnt # back
```

安装驱动和控制程序

```shell
pacman -S iwd
```

#### 蓝牙驱动和控制程序

```shell
pacman -S bluez bluez-utils
```
# reboot then

重启后，以 root 用户登陆 tty，获取 shell。

> 如果需要，可以使用`Alt-Left/Right`切换 tty

## get network

打开`iwd`服务，使用`iwctl`重新连接无线网络

```shell
systemctl --now enable iwd.service
iwctl station {wlan} connect {network name}
```

配置并使能`systemd`网络管理和DNS解析

```shell
systemctl --now enable systemd-networkd.service systemd-resolved.service
```

打开时间同步服务

```shell
systemctl --now enable systemd-timesyncd.service
```

> 以上服务在 live os 中是默认使能的。

打开蓝牙服务，否则无法正常使用`bluetoothctl`

```shell
systemctl --now enable bluetooth.service
```

## base packages

构建系统、版本管理等

```shell
pacman -S base-devel gdb clang lldb cmake git stow
```

其他构建系统：ninja meson

shell 补全：bash-completion

## 创建非 root 用户

使用`useradd -m kioz`创建新用户，记得`passwd`设置密码。

也别忘了配置特权：
- `usermod -aG wheel kioz`
- `pacman -S sudo`
- `vim /etc/sudoers`

```shell
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL:ALL) ALL
```

现在，可以重新以新用户登陆 tty 来执行后续的操作了！

## 包管理器

### pacman

建议开启并发下载：修改 /etc/pacman.conf

```conf
ParallelDownloads = 5
```

安装`pacman-contrib`获取更多 pacman 增强工具。

### yay

安装 AUR Helper：https://github.com/Jguer/yay

需要先安装构建依赖包：`go`。这里还需要配置 go 代理，以及在 /etc/hosts 中配置代理的 DNS 解析，才能保证构建正常进行。

> 不知为何，不配置静态解析的情况下，go 请求 DNS Server 会出错。

## 命令行实用工具

编辑器：neovim

剪切板支持：wl-clipboard cliphist

搜索：fzf ripgrep fd

git TUI：lazygit

解压缩：zip unzip

系统管理工具
- htop
    - lsof strace
- acpi

远程连接：openssh

还有一些

```
bat tree jq
```

## 桌面环境（DE）

### base

```
wayland hyprland
hyprpaper waybar wofi hypridle hyprlock mako
mesa-utils brightnessctl playerctl wireplumber pipewire-alsa
```

### X11 兼容

`xorg-xwayland`, `xorg-xrdb`

### xdg 支持

```
xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
```

## 桌面实用工具

- 文件管理：`dolphin`
- 终端模拟器：`alacritty`, `xdg-terminal-exec-git`
- 浏览器：`firefox`
- PDF阅读器：`okular`
- 图片查看：`loupe`
- 密钥环：`gnome-keyring`, `seahorse`
- 蓝牙管理：`blueman`

### xdg-terminal-exec-git

必须安装（使用`yay`）该软件包，否则 /usr/share/applications 中`Terminal=true`的`.desktop`将无法打开。

### 中文输入法

```
fcitx5 fcitx5-chinese-addons fcitx5-configtool
fcitx5-lua
```

> 不要再安装`fcitx5-im`了，在`Wayland`上，这会引入不必要的包

配置一下触发键和翻页键：
TODO: 还不知道怎么截图……

## 字体

```
ttf-inconsolata-nerd ttf-firacode-nerd ttf-sourcecodepro-nerd ttf-cascadia-mono-nerd
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
```

> if using `waybar`, default you should have `otf-font-awesome`

## mess

TODO: 在使用 yay 安装软件包时，有时会顺便安装一个后缀 debug 的包。应该是最近新加的特性，但应该可以通过把构建-安装两步分来，来解决是否还要再执行一个卸载命令的问题。

### Solid state drive

检查 SSD 是否支持 Trim：

```shell
lsblk --discard
```

若DISC-GRAN (discard granularity)和DISC-MAX (discard max bytes)列上的数值不为零，则表示对应设备支持TRIM。

开启周期性 Trim：

```shell
systemctl --now enable fstrim.timer
```

### packages


python python-pip ipython
python-pytest


`power-profiles-daemon`


```shell
yay -S obsidian
```


```shell
yay -S visual-studio-code-bin
```


d-spy


```shell
pacman -S rustup
rustup default stable
```

主题配置，立即生效，无需重启应用

gnome-themes-extra

```shell
gsettings get org.gnome.desktop.interface gtk-scheme
gsettings get org.gnome.desktop.interface color-scheme
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
```

遗留问题：

- vscode 无法打开 fcitx 输入法
- obsidian 中，输入法候选栏无法显示在应用窗口内，偶尔无法调出输入法
