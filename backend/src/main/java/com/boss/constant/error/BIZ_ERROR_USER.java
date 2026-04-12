package com.boss.constant.error;


/**
 * 用户业务 (20000-29999)
 */
public enum BIZ_ERROR_USER implements IBizError {
    CUSTOM_ERROR(20000, "{0}"),
    USER_ALREADY_EXISTS("该账号已存在"),
    PHONE_ALREADY_EXISTS("该手机号码已被使用"),
    EMAIL_ALREADY_EXISTS("该邮箱已被使用"),
    ID_NUMBER_ALREADY_EXISTS("该身份证号已被使用"),
    USER_NOT_FOUND(20001, "user.not.found"),
    PASSWORD_WRONG(20002, "密码输入错误"),
    ACCOUNT_LOCKED(20003, "账号已被锁定"),
    PHONE_EXIST(20004, "该手机号已被注册"),
    VERIFY_CODE_ERROR(20005, "验证码不正确或已过期");

    private final int code;
    private final String message;

    BIZ_ERROR_USER(int code, String message) {
        this.code = code;
        this.message = message;
    }

    BIZ_ERROR_USER(String message) {
        this.code = 400;
        this.message = message;
    }

    BIZ_ERROR_USER(int code) {
        this.code = code;
        this.message = "请求出错了";
    }

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}