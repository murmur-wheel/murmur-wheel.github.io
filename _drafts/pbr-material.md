---
author: murmur.wheel@gmail.com
---

# Pbr 材质

## 相关概念

### 微表面 microfacet

基于物理材质认为的介质表面都是有若干个微笑的光学表面（optics surface）组成的，其中的每一个光学表面的光学性质和镜子类似，你只有在出射光的方向才能接受到入射光。但是介质表面不都是像理想的镜子那样光滑，因为这些表面的朝向并不都是垂直于介质法向的，因为粗糙度不同，每一个微面的朝向也不同，所以每个物体会向各个方向散射入射光。参数 `roughness` 粗糙度用来控制微表面属性，取值范围是 `0 - 1`，越光滑的物体，粗糙度越低。

### 表面反射系数

### 光源类型
