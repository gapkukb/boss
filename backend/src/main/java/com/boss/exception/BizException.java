package com.boss.exception;


import com.boss.constant.error.IBizError;
import lombok.Data;

@Data
public class BizException extends RuntimeException {
    private final int code;
    private final Object[] args;

    public BizException(IBizError errorCode) {
        super(errorCode.getMessage());
        this.code = errorCode.getCode();
        this.args = null;
    }

    // 高级构造函数：支持传入动态参数
    public BizException(IBizError errorCode, Object... args) {
        super(errorCode.getMessage());
        this.code = errorCode.getCode();
        this.args = args;
    }

    public BizException(String message) {
        super(message);
        this.code = 0;
        this.args = null;
    }

    public BizException(String message,Object... args) {
        super(message);
        this.code = 0;
        this.args = args;
    }

    public BizException(int code,String message) {
        super(message);
        this.code = code;
        this.args = null;
    }

    public BizException(int code,String message,Object... args) {
        super(message);
        this.code = code;
        this.args = args;
    }
}
