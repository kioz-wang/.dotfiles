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

基础的构建系统、调试工具、版本管理等

```shell
pacman -S base-devel cmake gdb git
```

其他一些乱七八糟但都有用处，懒得一一解释的

```shell
pacman -S bash-completion pacman-contrib sudo openssh
```







