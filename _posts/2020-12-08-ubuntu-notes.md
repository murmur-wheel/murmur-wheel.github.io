---
author: murmur-wheel
title: 使用 Ubuntu
tags: ["linux"]
---

我主要用 Ubuntu 来作为自己的工作环境，工作中使用的是 Ubuntu 1604，日常使用 Ubuntu 2004

## 包管理

### 软件源

ppa 和 deb 软件源的区别

- 添加软件源 add-apt-repository
- 更新列表 apt-get update
- 安装软件 apt-get install -y xxx


### 安装软件

- apt, dpkg 命令

## 常用软件安装

### Clang

参考：https://apt.llvm.org/，执行下面的命令自动安装 clang 的最新版本：

```
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
```

### CMake

首先在 CMake 的下载页 https://cmake.org/download/ 选择一个你需要的版本，以 3.19.2 为例：

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.19.2/cmake-3.19.2-Linux-x86_64.tar.gz # 下载压缩包
tar -xzvf cmake-3.19.2-Linux-x86_64.tar.gz # 解压
sudo mv cmake-3.19.2-Linux-x86_64 /usr/local/cmake-3.19.2
sudo ln -sf /usr/local/cmake-3.19.2/bin/* /usr/local/bin # 从 /usr/local/bin 建立一个软链接。
```
