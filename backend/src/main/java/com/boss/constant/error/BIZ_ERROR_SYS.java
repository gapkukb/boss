package com.boss.constant.error;

/**
 * 系统与认证 (10000-19999) 异常枚举
 */
public enum BIZ_ERROR_SYS implements IBizError {
    CUSTOM_ERROR(10000, "{0}"),
    SUCCESS(200, "操作成功"),
    SYSTEM_ERROR(500, "服务器开小差了"),
    UNAUTHORIZED(401, "尚未登录"),
    FORBIDDEN(403, "没有权限"),
    PARAM_INVALID(400, "提交参数非法"),
    TOO_MANY_REQUESTS(429, "请求太频繁"),
    DATA_ALREADY_EXISTS(409, "{0}已存在"),
    ;


    private final int code;
    private final String message;

    BIZ_ERROR_SYS(int code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override public int getCode() { return code; }
    @Override public String getMessage() { return message; }
}