---
author: murmur wheel
title: git 常用命令
---

本文是对 git pro 书中所涉及命令的一个总结

# add

# commit

提交格式：

```text
简短的概括性总结

有必要的情况下，请附上更详尽的说明。请将每行的长度限制在 72 字符左右。
在某些情况下，第一行会被作为邮件的主题，余下的作为邮件的正文。两者之间
要使用空行分隔。

将余下的描述性信息写在空行之后

  - 可以使用这样的条目符号
  - 通常选用连字符或星号作为条目符号
```

参考：

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)
- [commit message guidelines](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53)

# log

针对某个文件的 log

# diff

在所处分支的最新提交和两个分支的共同祖先之间进行 diff 操作：`git diff master...contrib`

# apply

# format-path

# am

# 分支相关命令

## rebase

## cherry-pick

