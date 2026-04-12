package com.boss.handler;

import cn.hutool.core.exceptions.ExceptionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.ClassUtils;
import com.boss.BossApplication;
import com.boss.core.EnvHelper;
import com.boss.core.R;
import com.boss.exception.BizException;
import com.boss.helper.I18n;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final String ROOT_PACKAGE_NAME = ClassUtils.getPackageName(BossApplication.class);

    @Resource
    private EnvHelper envHelper;

    //@ExceptionHandler(ServletException.class)
    //public R<?> handleServletException(ServletException e, HttpServletResponse response) {
    //    return buildResponse(response.getStatus(), e.getMessage(), e);
    //}

    /**
     * Handle Custom Business Exceptions (BaseException)
     * This is where your i18n logic lives.
     */
    @ExceptionHandler(BizException.class)
    public R<?> handleBizException(BizException e) {
        // 2. Return the custom error code defined in your Enum
        return buildResponse(e.getCode(), e.getMessage(), e, e.getArgs());
    }

    /**
     * Handle MySQL Unique Constraint Violations
     * Uses the fast String.contains() method we discussed.
     */
    @ExceptionHandler(DuplicateKeyException.class)
    public R<?> handleDuplicateKeyException(DuplicateKeyException e) {
        String message = e.getMostSpecificCause().getMessage();

        if (message != null) {
            message = getConflictMessage(message);
        }

        return buildResponse(400, message, e);
    }

    /**
     * Handle Unexpected Runtime Exceptions (The "Catch-All")
     */
    @ExceptionHandler(Exception.class)
    public R<?> handleException(Exception e) throws Exception {
        if (e instanceof ErrorResponse errorResponse) {
            //int status = errorResponse.getStatusCode().value();
            //String method = "";
            //String url = "";
            //
            //// 2. 打印日志（此时你可以拿到真实的 404 或 405）
            //log.warn("检测到框架级错误 [Status: {}] [Message: {}] [TraceID: {}]",
            //        status, e.getMessage(), MDC.get("traceId"));
            //
            //// 3. 原样抛出：不做任何处理，交给 Spring 默认的 BasicErrorController
            //// 这样浏览器就会看到原生的 Whitelabel Error Page 或 404/405 原始响应
            throw e;
        }


        return buildResponse(500, ExceptionUtil.getMessage(e), e);
    }

    /**
     * 核心：统一构建返回体
     */
    private R<?> buildResponse(int code, String message, Exception e, Object... args) {
        // 本地化消息
        message = I18n.message(message, args);
        R<?> r = R.failure(code, message);
        r.setCode(code);
        r.setTraceId(MDC.get("traceId"));

        log.error(e.getMessage(), e);

        // 统一判断环境：非生产环境才填充 debugMessage
        if (envHelper.IS_NOT_PROD) {
            // 可以使用 org.apache.commons.lang3.exception.ExceptionUtils 获取完整堆栈
            // 或者简单记录异常类名和消息
            r.setDebug(getCleanStackTrace(e));
        }

        return r;
    }


    private String getCleanStackTrace(Throwable e) {

        if (StrUtil.isBlank(ROOT_PACKAGE_NAME)) {
            return ExceptionUtil.stacktraceToString(e); // 没获取到包名则返回全部
        }

        StringBuilder sb = new StringBuilder();
        sb.append(e.toString()).append("\n");

        // 获取原始堆栈数组
        StackTraceElement[] stackTrace = e.getStackTrace();
        for (StackTraceElement element : stackTrace) {
            // 核心过滤：只保留以项目根包名开头的堆栈
            if (element.getClassName().startsWith(ROOT_PACKAGE_NAME)) {
                sb.append("\tat ").append(element.toString()).append("\n");
            }
        }

        return sb.toString();
    }


    /**
     * 数据库唯一值冲突消息转换
     */
    private final Map<String, String> conflictMessageMap = Map.of("unique_key", "该字段已存在，请检查并修改", "unique_email", "该邮箱已存在，请检查并修改");

    public String getConflictMessage(String conflictMessage) {
        return conflictMessageMap.getOrDefault(conflictMessage, conflictMessage);
    }


}
