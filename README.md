# protoc-gen-go-errors


## 1. 功能
- 兼容 kratos errors
- 支持 errors message

## 2. 安装
```bash
go install github.com/lyouthzzz/protoc-gen-go-errors
```

## 3. 示例

**定义错误码：**
```proto
syntax = "proto3";

package example;

import "errors/errors.proto";

option go_package = "github.com/lyouthzzz/protoc-gen-go-errors/examples";

enum ErrorReason {
  // 设置缺省错误码
  option (errors.default_code) = 500;
  // 设置缺省错误信息
  option (errors.default_message) = "未知错误";

  // 内部错误
  ERROR_REASON_INTERNAL_ERROR = 0;
  // 用户已存在
  ERROR_REASON_USER_ALREADY_EXISTS = 1 [(errors.message) = "用户已存在"];
  // 用户名或密码错误
  ERROR_REASON_USERNAME_OR_PASSWORD_ERROR = 2 [(errors.code) = 401];
  // 用户未找到
  ERROR_REASON_USER_NOT_FOUND = 3 [(errors.code) = 404, (errors.message) = "用户不存在"];
}
```

**生成代码： make errors**

```bash
// Code generated by protoc-gen-go-errors. DO NOT EDIT.

package examples

import (
	fmt "fmt"
	errors "github.com/go-kratos/kratos/v2/errors"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the kratos package it is being compiled against.
const _ = errors.SupportPackageIsVersion1

// 内部错误
func IsErrorReasonInternalError(err error) bool {
	if err == nil {
		return false
	}
	e := errors.FromError(err)
	return e.Reason == ErrorReason_ERROR_REASON_INTERNAL_ERROR.String() && e.Code == 500
}

// 内部错误
func ErrorErrorReasonInternalError(format string, args ...interface{}) *errors.Error {
	return errors.New(500, ErrorReason_ERROR_REASON_INTERNAL_ERROR.String(), fmt.Sprintf(format, args...))
}

// 内部错误
func ErrorMessageErrorReasonInternalError() *errors.Error {
	return errors.New(500, ErrorReason_ERROR_REASON_INTERNAL_ERROR.String(), "未知错误")
}

// 用户已存在
func IsErrorReasonUserAlreadyExists(err error) bool {
	if err == nil {
		return false
	}
	e := errors.FromError(err)
	return e.Reason == ErrorReason_ERROR_REASON_USER_ALREADY_EXISTS.String() && e.Code == 500
}

// 用户已存在
func ErrorErrorReasonUserAlreadyExists(format string, args ...interface{}) *errors.Error {
	return errors.New(500, ErrorReason_ERROR_REASON_USER_ALREADY_EXISTS.String(), fmt.Sprintf(format, args...))
}

// 用户已存在
func ErrorMessageErrorReasonUserAlreadyExists() *errors.Error {
	return errors.New(500, ErrorReason_ERROR_REASON_USER_ALREADY_EXISTS.String(), "用户已存在")
}

// 用户名或密码错误
func IsErrorReasonUsernameOrPasswordError(err error) bool {
	if err == nil {
		return false
	}
	e := errors.FromError(err)
	return e.Reason == ErrorReason_ERROR_REASON_USERNAME_OR_PASSWORD_ERROR.String() && e.Code == 401
}

// 用户名或密码错误
func ErrorErrorReasonUsernameOrPasswordError(format string, args ...interface{}) *errors.Error {
	return errors.New(401, ErrorReason_ERROR_REASON_USERNAME_OR_PASSWORD_ERROR.String(), fmt.Sprintf(format, args...))
}

// 用户名或密码错误
func ErrorMessageErrorReasonUsernameOrPasswordError() *errors.Error {
	return errors.New(401, ErrorReason_ERROR_REASON_USERNAME_OR_PASSWORD_ERROR.String(), "未知错误")
}

// 用户未找到
func IsErrorReasonUserNotFound(err error) bool {
	if err == nil {
		return false
	}
	e := errors.FromError(err)
	return e.Reason == ErrorReason_ERROR_REASON_USER_NOT_FOUND.String() && e.Code == 404
}

// 用户未找到
func ErrorErrorReasonUserNotFound(format string, args ...interface{}) *errors.Error {
	return errors.New(404, ErrorReason_ERROR_REASON_USER_NOT_FOUND.String(), fmt.Sprintf(format, args...))
}

// 用户未找到
func ErrorMessageErrorReasonUserNotFound() *errors.Error {
	return errors.New(404, ErrorReason_ERROR_REASON_USER_NOT_FOUND.String(), "用户不存在")
}
```