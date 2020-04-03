---
author: murmur wheel
title: 知识管理
---

最近在看完《程序员修炼之道--从小工到专家》这本书之后，才意识到知识管理对于一个程序员的重要性，原来自己也写过很多乱七八糟的项目，但是随着时间的流逝，很多自己平时写的东西都湮灭在了时间的长河里，就连我自己都要仔细回忆才能想起过去这几年到底干了些什么。

# 写什么？

1. 代码片段、知识片段
2. 项目
3. 博客

## 在哪里写？

所以这几天自己一直在找一个好用的知识管理平台。我的要求是这样的：

1. 要好用
2. 工具链要完备

好用是指，不能让我自己去维护博客的运作，最好是能由平台来托管，所以像 WordPress 这类就不在我的考虑之中了。托管平台的话，有 gitee, github, gitlab 等。gitee 的优点是服务器在国内，所以访问的网速很快，缺点就是 bug 比较多，稳定性不如 github, gitlab 这种成名已久的项目管理平台，而且 gitee 上的开源项目数量远远少于 github。github 的优点是功能齐全，能很好的满足我自己的需求，唯一的不便之处就在于有的时候访问需要梯子。gitlab 没用过暂且不表。

工具链的话，最好支持自动测试，自动部署。以前在本地搭建过 git 服务器，也动手试过通过 hook 的方式来做自动测试，但是要单独维护一个工具链是很累的事情，尤其是要自己去处理各种技术上细枝末节的问题。所以我对知识管理平台的额外要求就是，支持测试和部署。当然，这并不是必须的。