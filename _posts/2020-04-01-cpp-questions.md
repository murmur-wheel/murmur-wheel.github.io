---
author: murmur wheel
title: C++ 常见面试题
tags: ["cpp"]
---

# C++ 常见面试题

1. 编译链接相关问题
2. 关键字
3. 面向对象
4. 标准库
5. 模板
6. `Modern C++`
7. 设计题

## 编译链接相关问题

### 编译的基本流程

1. 预处理，展开预编译宏。使用的 `gcc` 命令是：`gcc -E`
2. 编译、优化阶段，从 `.cpp/.h` 转换成 `.s` 文件。相应的 `gcc` 命令是：`gcc -S`
3. 汇编，从 .s 转化成 .o 文件。相应的 `gcc` 命令是：`gcc -c`
4. 链接，将 `.o` 多个文件链接成可执行程序。对应于链接命令：`ld`

使用 `gcc` 的 `-save-temps` 可以保留中间文件。

### 怎么提高编译速度

1. 并行编译。`make -j 24`
2. `precompile header` 技术
3. 从编程规范入手，尽量不要引用不必要的头文件。

### 怎么避免重复包含头文件

1. 使用宏。
2. `#pragma once` 扩展

```cpp
#ifndef HEADER_H
#define HEADER_H
#endif
```

```
#pragma
```

## 关键字

### `struct` 和 `class` 关键字的区别

`struct` 默认 `public`, `class` 默认 `private`。一些编程规范中规定，使用 `struct` 来定义 `POD` 类型，使用 `class` 关键字来定义对象。

### `static` 关键字

static 可以修饰类的数据成员，函数，以及局部变量。

static 修饰类的数据成员时，表示这个成员是类所有的，要通过 `<className>::<fieldName>` 来访问。当其修饰函数时，表示这个函数的作用域被限定到这个编译单元内。当被用来修饰局部变量时，这个局部变量的生命周期从第一次访问开始，知道程序终止，其实际存放在堆中，而不是栈上。

### `const` 关键字

`const` 关键字可以修饰函数，变量以及指针。

修饰成员函数时，表示此函数只能不能写出 mutable 以外的数据成员。修饰变量是，表示不能更改变量的值。当修饰指针时，分两种情况，一种时不能修改指针本身的值，二是不能通过指针修改指针指向的内存。此外，使用 `const_cast` 可以更改 `const` 的修饰作用。

### `extern` 关键字

## 面向对象相关问题

### 什么时候编译器会生成一个默认构造函数?

编译器会在有必要的时候合成一个默认构造函数，被合成的构造函数只是满足编译器（而非程序）的需要。为了避免冲突，通常这个默认构造函数以 `inline` 或者 static 的形式给出。

注意：implicit trivial default constructors 实际上不会被合成出来。编译器合成的默认构造函数不会设置 class 内每一个数据成员的初始值。

### 构造函数会做些什么？

1. 如果有子类，调用子类的默认构造函数。
2. 如果类中定义了虚函数，将虚表指针指向正确的地址。（虚表是常量，所以一般存放在只读数据段中。）
3. 如果存在虚继承，初始化虚继承相关的内容。

### 续表是什么

### 虚继承是什么？解决了什么问题？

### 数据布局有什么要求

1. 数据成员之间的布局：在同一个 access section 中，members 的排列只需符合 “较晚出现的 members 在 class object 中有较高的地址” 这一条件即可。
2. C++ 标准没有规定 vptr 放置的位置。具体是由编译器自己决定的（一般是将函数表放在全局数据段）。

### 成员函数

## 标准库

### `vector` 和 `list` 的区别

### `unordered_map` 和 `map` 的区别

### 迭代器，`begin()` 和 `end()`

## 模板

### 函数模板和类模板的区别

### 什么是模板的偏特化

### trait

## `Modern C++`

### 右值语义。`std::move` 和 `std::forward`

### `Lambda` 表达式

### `initializer_list` 是什么，在使用时有什么要注意的？

## 设计题

### 实现一个智能指针

1. 类的生命周期。
2. 如果有扩展的需求，使用继承还是组合。

### 内存管理

1. 分配问题
   1. 多线程优化。
   2. 小对象优化。
2. 内存泄漏
   1. 引用计数。
   2. GC 算法。
   3. 针对具体场景制定专门的内存管理算法。比如 Qt 的对象树。
