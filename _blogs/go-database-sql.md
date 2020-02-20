---
author: murmur wheel
title: Go database sql
---

本文是对 [Go database/sql tutorial](http://go-database-sql.org/index.html) 一文的简单总结。

## database/sql 和 driver

sql 在 driver 的基础上封装了一个统一的数据库接口，因此基于 sql 编写的代码可以很方便的切换底层的数据库，而不用对程序做太大的改动。因为要兼容所有的平台，因此 `database/sql` 只提供了一组最基本的功能，如果要使用特定数据库的高级功能，可以直接调用底层的 driver。

## sql.DB

## Prepared Statement

### Prepared statement 和 database connection 的关系

在数据库层面，`prepared statement` 和一个 `database connection` 相绑定，一般的流程是客户端发送一段 `SQL statement` 语句给服务器预处理，服务器返回一个 `Statement ID`，客户端就可以通过 ID 和参数列表来执行这段 `SQL`。

在 Go 中，`database connection` 没有直接导出给用户使用，如果你要使用 `prepared statement` 功能，直接在 `Tx` 或这 `DB` 上操作即可。

在 `Go` 中使用 `prepared statement` 的相关操作：

1. 选择一个 `database connection` 执行 prepare 操作
2. stmt 对象会记录此 statement 所依赖的 `database connnection`.
3. 在执行 stmt 时，会尝试使用绑定的 `database connection` 来执行 `statement`，如果执行失败，会在 `connection pool` 中的空闲 `database connection` 上重试。

并不是所有的情况下，都要使用 `prepared statement`，下面两种情况就不需要使用：

- 数据库不支持 `prepared statement`
- 使用 `prepared statement` 带来的收益不明显、或者会导致一些安全问题时，没有必要使用 `prepared statement`。

在一个 transaction 中设置一个 statement 时，此 statement 就和 transaction 绑定在一起了，所以及在执行 statement 时就不会选择别的 database connection 去执行。

> 注意，不懂的数据库使用不同的参数占位符：`MySQL` 使用 `?`，`PostgresQL` 使用 `$1`，`OracleDB` 使用 `:val1`。

## 错误处理

`database/sql` 本身没有提供太多的错误处理功能，当 `statement` 执行出错时，需要 `err` 通过类型转换调整到特定的数据库，然后才能判断具体发生了什么错误。

```go
rows, err := db.Query("SELECT someval FROM sometable")
if driverErr, ok := err.(*mysql.MySQLError); ok {
    // 处理 SQL 执行错误
    if driverErr.Number == 1045 {
        // 
    }
}
```
