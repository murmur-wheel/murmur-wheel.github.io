---
author: murmur wheel
title: 常见面试题整理
---

# Go

## Go 的协程和线程的区别

1. Go 协程的调度是在用户态进行的，效率更高
2. Go 的协程的栈可以动态扩展

## Go 的垃圾回收算法

## Go 协程调度机制

- G 代表协程，每次使用 go 关键字时创建的对象
- M 工作线程，用来执行协程
- P 代表处理器，维护一个协程的执行队列

runtime.GOMAXPROCS 调用的作用，限制全局的最大 processer 数目，一般将其设为 CPU 核数。

# 数据库

## 事务的基本性质

1. 原子性
2. 一致性
3. 隔离性
4. 持久性

简称 ACID

## 隔离性的级别

1. 可串行化
2. 可重复读
3. 已提交读
4. 未提交读

# 消息队列

## 作用

1. 削峰
2. 异步
3. 解耦

## kafka

# redis

## 用途

1. 缓存

## redis 基本数据结构

1. 字符串
2. hash
3. list
4. set
5. zset

## redis 集群

## redis 怎么实现分布式锁

通过 Lua 脚本实现一个 tryLock 操作：如果 redis 中没有对应的 key，就设置一个 key 并获得锁。如果 redis 中已经存在一个 key，判断脚本执行时的时间 - 设置 key 的时间是否大于超时时间，如果大于超时时间，获得锁并更新锁的时间，否则不能获得锁。

### 集群扩容

# linux

## 内存结构

从高到底： 内核，栈，堆，未初始化数据段，已初始化数据段，代码段。

# shell

## 常用命令

1. 字符串：echo, printf, tail
2. 文件系统：ls, cd, mkdir, mv, cp,
3. 磁盘：mount, lsblk
4. 网络：netstat, tcpdump, tc, nc
5. 进程管理：kill, killall, wait, pidof
