---
author: murmur wheel
title: cmake skills
---
# cmake skills

## 在 CMake 中执行脚本

```cmake
# CMakeLists.txt
```

## 通过 FetchContent 获取依赖

参考链接 [FetchContent](https://cmake.org/cmake/help/v3.11/module/FetchContent.html)

```cmake
include(FetchContent)

FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.0
)

FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
  FetchContent_Populate(googletest)
  add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
endif()
```

示例：https://github.com/murmur-wheel/fetch-content-example
