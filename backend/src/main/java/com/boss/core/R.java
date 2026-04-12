package com.boss.core;

import com.boss.constant.error.IBizError;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

@Data
//@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class R<T> implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    private static final int DEFAULT_FAILURE_CODE = 0;
    private Integer code;
    private T data;
    private String message;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String traceId;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String debug;

    public R(Integer code, T data, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
    }

    public static <T> R<T> success(T data, String message) {
        return new R<>(200, data, message);
    }

    public static <T> R<T> success(T data) {
        return success(data, null);
    }

    public static <T> R<T> success(String message) {
        return success(null, message);
    }

    public static <T> R<T> failure(int code, String message) {
        return new R<>(code, null, message);
    }

    public static <T> R<T> failure(int code) {
        return failure(code, "Failure");
    }

    public static <T> R<T> failure(String message) {
        return failure(DEFAULT_FAILURE_CODE, message);
    }

    public static <T> R<T> failure(T data) {
        return new R<>(DEFAULT_FAILURE_CODE, data, "Failure");
    }

    public static <T> R<T> failure(IBizError errorCode) {
        return failure(errorCode.getCode(), errorCode.getMessage());
    }


}
