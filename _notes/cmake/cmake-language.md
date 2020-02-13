---
author: murmur wheel
title: cmake language
---

# CMake Language

本文是对 [cmake-language](https://cmake.org/cmake/help/v3.0/manual/cmake-language.7.html) 的一个简单总结

## 组织结构

一个 CMake 工程由三部分组成：

- 目录：CMakeLists.txt 是 CMake 的入口点，CMake 从一个工程的 CMakeLists.txt 文件开始为源码树生成构建系统；
- 脚本：单独的以 .cmake 结尾的文件，可以在命令行单独执行这些文件
- 模块：通过 include 命令可以使用位于其他目录或者脚本中定义的 CMake 指令

一个项目通常会包含若干个子项目，通过目录结构将子项目组合成一个完整的项目。脚本可以用来编写一些在构建时执行的程序，比如生成版本号。模块功能允许我们在 CMakeLists.txt 文件中引用脚本。

## 语义

为了方便跨平台，最好只使用 7-bit ASCII 编码，当然，在 3.0 之后的版本中， UTF-8 编码也是被允许的。

一个 CMake 源文件由若干个指令组成，指令之间用换行符或者可选的空格或注释分割。

### 命令

### 指令参数

- 参数块 [bracket-argument](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#bracket-argument)
- 引号参数 [quoted-argument](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#quoted-argument)
- 不加引号的参数 [unquoted-argument](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#unquoted-argument)

### 变量引用

`${<variables>}` 可以引用先前定义的变量，变量引用允许嵌套，因此 `${VARIABLE1_${VARIABLE1}}` 也是合法的。`$CACHE{<variable>}` 和 `$ENV{<variable>}` 分别被用于引用 `CACHE` 和系统的环境变量。

### 注释

- 单行注释：以 `#` 开头，直至一行结束。 [line-comment](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#line-comment)
- 块注释：3.0 之后的版本支持块注释，以 `#[[` 开始，直至  `]]`。 [bracket-comment](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#bracket-comment)

## 控制流

- 条件：`if()`, `elseif()`, `else()`, `endif()`[conditional-blocks](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#conditional-blocks)
- 循环：`foreach()`, `endforeach()`, `while()`, `endwhile()`, `break()`, `continue()` [loops](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#loops)
- 命令定义：`macro()`/`endmacro()`, `function()`/`endfunction()` [command-definitions](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#command-definitions)

## 变量

变量的作用域：

- 函数：只在当前的函数或宏中有效
- 目录：在处理目录下的 CMakeLists.txt 之前，CMake 会复制所有父目录中定义的变量到当前的执行环境中
- 全局：只能通过 `set` 或 `unset` 定义，可在任何地方访问

> 以 `CMKE_`, `_CMAKE_` 或以 `_` 开头的 `CMake Command` 都是保留的标识符

通过 `$ENV{<variable>}` 可以访问环境变量

## 列表

尽管所有的 CMake 变量都被存储为字符串，但是某些情况下，字符串也可以被作为列表。在那些特定的情况中，字符串以 `;` 为分割符，拆分成列表中的元素。

```cmake
set(srcs a.c b.c c.c) # srcs 被设置为 "a.c;b.c;c.c"
```

列表只能用在简单的情景下，比如源文件列表，不用用在复杂的数据处理任务中。大多数用来构造列表的命令都不会转义 `;` 字符，它们只是简单的将列表拼接在一起。

```cmake
set(x a "b;c") # x 被设置为 "a;b;c" 而不是 "a;b\;c"
```
