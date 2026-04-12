package com.boss.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.boss.constant.error.BIZ_ERROR_SYS;
import com.boss.constant.error.BIZ_ERROR_USER;
import com.boss.constant.error.IBizError;
import com.boss.core.R;
import com.boss.exception.BizException;
import com.boss.helper.I18n;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Component
public class MybatisPlusHandler implements MetaObjectHandler {

    /**
     * 插入时的填充策略
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        
        // 1. 填充时间
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());

        // 2. 填充操作人 (这里可以配合你的 SecurityContext 获取当前登录用户 ID)
        // Long userId = SecurityUtils.getUserId(); 
        // this.strictInsertFill(metaObject, "createBy", Long.class, userId);
        // this.strictInsertFill(metaObject, "updateBy", Long.class, userId);
    }

    /**
     * 更新时的填充策略
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        
        // 更新时只修改 updateTime 和 updateBy
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
        
        // Long userId = SecurityUtils.getUserId();
        // this.strictUpdateFill(metaObject, "updateBy", Long.class, userId);
    }

    @RestControllerAdvice
    public static class GlobalException {
        /// 数据库中，唯一值的字段Map集合，编译期确定，提高性能和语义化
        private static final Map<String, IBizError> INDEX_ERROR_MAP = Map.of(
                "username", BIZ_ERROR_USER.USER_ALREADY_EXISTS,
                "phone",    BIZ_ERROR_USER.PHONE_ALREADY_EXISTS,
                "email",    BIZ_ERROR_USER.EMAIL_ALREADY_EXISTS
        );

        // Regex to capture the duplicate value from MySQL error string
        private static final Pattern DUPLICATE_PATTERN = Pattern.compile("Duplicate entry '(.*)' for key");

        // 处理请求体无法正确解析的异常
        @ExceptionHandler(HttpMessageNotReadableException.class)
        public R<String> handleHttpMessageNotReadableExceptions(HttpMessageNotReadableException ex) {
            return R.failure(HttpStatus.BAD_REQUEST.value(), "Request body is not readable: " + ex.getMessage());
        }

        // 处理参数校验异常
        @ExceptionHandler(MethodArgumentNotValidException.class)
        public R<String> handleValidationExceptions(MethodArgumentNotValidException ex) {
            StringBuilder errorMessages = new StringBuilder();
            ex.getBindingResult().getFieldErrors().forEach(error -> errorMessages.append(error.getDefaultMessage()).append("; "));
            return R.failure(HttpStatus.BAD_REQUEST.value(), errorMessages.toString());
        }

        // 处理业务异常
        @ExceptionHandler(BizException.class)
        public R<?> handleBizException(BizException e) {
            // 关键点：传入 e.getArgs()
            String translatedMsg = I18n.message(e.getMessage(), e.getArgs());
            return R.failure(e);
        }

        // 处理数据库唯一值冲突
        @ExceptionHandler(DuplicateKeyException.class)
        public R<?> handleDuplicateKeyException(DuplicateKeyException e) {
            String detail = e.getMostSpecificCause().getMessage();
            for (Map.Entry<String, IBizError> entry : INDEX_ERROR_MAP.entrySet()) {
                if (detail.contains(entry.getKey())) {
                    IBizError error = entry.getValue();
                    return R.failure(error.getCode(), I18n.message(error.getMessage()));
                }
            }

            String duplicateValue = "该数据"; // Default fallback

            if (detail != null) {
                Matcher matcher = DUPLICATE_PATTERN.matcher(detail);
                if (matcher.find()) {
                    duplicateValue = matcher.group(1); // Extract e.g., 'boss'
                }
            }

            String msg = I18n.message(BIZ_ERROR_SYS.DATA_ALREADY_EXISTS.getMessage(), duplicateValue);

            return R.failure(BIZ_ERROR_SYS.DATA_ALREADY_EXISTS.getCode(), msg);
        }

        // 处理其他全局异常
        @ExceptionHandler(Exception.class)
        public R<String> handleGlobalExceptions(Exception ex) {
            return R.failure(HttpStatus.INTERNAL_SERVER_ERROR.value(), ex.getMessage());
        }
    }
}