---
author：murmur wheel
title:  在 linux 上开发
---

这几天使用 redis 实现了一个轻量的消息队列，实现过程中遇到一个颇为棘手的问题，redis 下 lua 的调试问题。我最初是在 windows 上开发这个程序的，在 Goland 的帮助下，我很快就完成了 Go 逻辑部分，但是如何使用 lua 来编写逻辑，却让我为难了很久。

我的 redis 环境是通过 docker 搭建的，因此每一次上传我的脚本，我都要重新启动一个 redis 容器，然后将我的 lua 脚本复制到容器中，然后才能执行。这个过程可以使用 Dockerfile 来自动化。为此，我特地编写了一个专门用于测试脚本的 docker：

```text
from redis
copy lua /data/lua
entrypoint /user/local/docker-entry-point.sh
```

构建容器时，将脚本复制进去，待服务启动后，就可以通过 `docker exec -it my-redis bash` 来进入容器，并交互式的调试 lua 脚本的。

但是，在容器内部，将的脚本改动之后，如何将它取出却是一个很麻烦的问题。不得不借助 ssh 之类的工具，但是 redis 镜像内部没有 ssh => 手动安装，大概率沿着这条路走下去会遇到很多的问题。

还好，docker 提供一个文件挂载的功能，我们可以将我们的 lua 目录直接挂载到容器内部的某个文件夹下，这样我们就可以在外部编辑脚本，并且不用重新生成镜像就能及时的测试新的更改。

```text
docker run -v lua:/data/lua redis
```

这又引入了一个问题，路径不能存在空格之类的特殊字符，但是 windows 的很多路径都是存在特殊字符的，所以为了避免这类问题，我将操作系统切换到了 linux（manjaro）。

这是一个有效的决定，linux 上丰富的工具链大大的节省了寻找工具所用的时间。同时可以使用 shell 来自动化测试步骤，我们在下面几个地方大量的应用了 shell：

- 搭建开发环境，编写一个专门用于初始化环境的 shell 脚本，免去了重复搭建环境的
- 测试，自动测试我们的程序是否存在问题
- 问题复现，复现问题，这使得我们能节省浪费在问题定位上所花的时间

解决的问题：

- 容器内的权限和主机上权限冲突，这个可以通过组来解决
- lua 脚本调试技巧，可以用返回值来充当 print 函数来打印数据
