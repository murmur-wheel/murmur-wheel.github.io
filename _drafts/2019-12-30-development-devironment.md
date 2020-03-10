---
layout: post
title: 在 windows 上搭建 linux 开发环境
author: murmur.wheel@gmail.com
tags: [cpp, linux]
categories: [blog, tutorial]
---

# 在 Hyper-V 中安装虚拟机

在控制面板的程序和功能子面板中打开 Hyper-V 虚拟机选项，然后就可以使用 Windows 自带的 Hyper-V 功能部署 linux 虚拟机。

# 配置虚拟机

在虚拟机中，我们需要设置两个选项，第一个是配置网络。
第二个是配置 ssh 免密。

# 挂载文件夹

考虑一个场景，因为某种原因，你不得不在 windows 上编写你的代码，但是编译你的程序需要 linux 环境，怎么解决这种问题呢？答案是 mount，它可以在 windows 和 linux 之间共享文件，比如源代码，配置文件等。你可以将 windows 上的某个文件夹设置为可通过网络共享，然后在 linux 中将该文件夹挂载到某个目录节点下，通过这种方式，linux 就可以访问你的源码目录了。
