---
title: Windows Terminal 配置
layout: post
---

# 标题栏配置

```json
    // 始终显示选项卡
    "alwaysShowTabs": false,
    // 隐藏标题栏
    "showTabsInTitlebar": true,
    "showTerminalTitleInTitlebar": true,
```

## powerline

首先要在系统中安装相应的格式：https://github.com/microsoft/cascadia-code

然后在对应的 profile 中设置使用 powerline 字体，就是将 fontFace 字段设置为 *Cascadia Code PL*：

```json
{
    "guid": "{6f9994f0-4403-5e85-9cce-98e5da3839bb}",
    "hidden": false,
    "name": "Ubuntu-16.04",
    "source": "Windows.Terminal.Wsl",
    "colorScheme": "Campbell",
    "fontFace": "Cascadia Code PL",
    "fontSize": 9,
    "startingDirectory": "//wsl$/Ubuntu-16.04/home/caohongjian"
}
```

然后安装 ohmybash：https://github.com/ohmybash/oh-my-bash，并将 OSH_THEME 配置为 poweline
