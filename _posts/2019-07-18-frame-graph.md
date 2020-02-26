---
layout: post
author: murmur.wheel@gmail.com
title: Frame Graph
---

GDC [Frame Graph](https://www.gdcvault.com/play/1024612/FrameGraph-Extensible-Rendering-Architecture-in)

# 什么是 FrameGraph

`FrameGraph` 是一种用来管理渲染资源的一种工程方法。因为在当前基于光栅的硬件基础上，如果要做出很好的图形效果，不得不引入很多对 `Attachment`、`Shader Module` 等资源的依赖关系。管理这些依赖会消耗程序员大量的精力，以至于无法将注意力集中到图形的开发上，为了解决这种问题，`FrameGraph` 就应运而生了。

# 相关概念

`FrameGraph` 涉及到的概念有: `FrameGraph`、`Builder`、`Task`、`Resource`。

`Resource` 是我们在渲染中用到的渲染资源，比如 `ColorBuffer`, `DepthBuffer` 之类的

`Task` 是 `FrameGraph` 中的基本任务单元，`Task` 可以读写 `Resource`

`Builder` 为构建 `Task` 提供一些关键的信息。

`FrameGraph` 是用来调度 `Task` 的对象，在执行时，`FrameGraph` 将会根据需要来为各个 `Task` 初始化\销毁资源。

# 怎么使用

```cpp
FrameGraph fg;

// 声明资源
struct RenderTarget {
    int color = -1;
    int depth = -1;
};

RenderTarget rt;
rt.color = fg.importSwapChain(...);
rt.depth = fg.createResource(...); 

// 定义 task
fg.addTask([&rt](FgBuilder& buiilder) {
    builder.write(rt.color, FgColorBuffer);
    builder.write(rt.depth, FgDepthBuffer);
}, [&rt](SubPass& subPass) {
    subPass.createPipeline(); // ...
}, [&rt](CommandBuffer& commandBuffer) {
    drawLight(commandBuffer);
});

// 编译，编译过程中将会解决各种必要的依赖关系
fg.compile();


// 在需要时执行
fg.execute(commandBuffer);
```
