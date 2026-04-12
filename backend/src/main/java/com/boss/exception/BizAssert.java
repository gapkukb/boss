package com.boss.exception;

import com.boss.constant.error.IBizError;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.Map;

/**
 * 业务断言工具类：替代 Spring Assert，支持自定义业务异常和国际化参数
 */
public abstract class BizAssert {

    // --- 1. 布尔逻辑断言 ---

    public static void isTrue(boolean expression, IBizError errorCode, Object... args) {
        if (!expression) {
            throw new BizException(errorCode, args);
        }
    }

    public static void isTrue(boolean expression, String message, Object... args) {
        if (!expression) {
            throw new BizException(message, args);
        }
    }


    public static void isFalse(boolean expression, IBizError errorCode, Object... args) {
        if (expression) {
            throw new BizException(errorCode, args);
        }
    }

    public static void isFalse(boolean expression, String message, Object... args) {
        if (expression) {
            throw new BizException(message, args);
        }
    }


    // --- 2. 对象引用断言 ---

    public static void notNull(Object object, IBizError errorCode, Object... args) {
        if (object == null) {
            throw new BizException(errorCode, args);
        }
    }

    public static void notNull(Object object, String message, Object... args) {
        if (object == null) {
            throw new BizException(message, args);
        }
    }

    public static void isNull(Object object, IBizError errorCode, Object... args) {
        if (object != null) {
            throw new BizException(errorCode, args);
        }
    }

    public static void isNull(Object object, String message, Object... args) {
        if (object != null) {
            throw new BizException(message, args);
        }
    }

    // --- 3. 字符串处理断言 ---

    public static void hasText(String text, IBizError errorCode, Object... args) {
        if (!StringUtils.hasText(text)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void hasText(String text, String message, Object... args) {
        if (!StringUtils.hasText(text)) {
            throw new BizException(message, args);
        }
    }

    public static void hasLength(String text, IBizError errorCode, Object... args) {
        if (!StringUtils.hasLength(text)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void hasLength(String text, String message, Object... args) {
        if (!StringUtils.hasLength(text)) {
            throw new BizException(message, args);
        }
    }

    public static void doesNotContain(String textToSearch, String substring, IBizError errorCode, Object... args) {
        if (StringUtils.hasLength(textToSearch) && StringUtils.hasLength(substring) && textToSearch.contains(substring)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void doesNotContain(String textToSearch, String substring, String message, Object... args) {
        if (StringUtils.hasLength(textToSearch) && StringUtils.hasLength(substring) && textToSearch.contains(substring)) {
            throw new BizException(message, args);
        }
    }

    // --- 4. 集合与容器断言 ---

    public static void notEmpty(Collection<?> collection, IBizError errorCode, Object... args) {
        if (CollectionUtils.isEmpty(collection)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void notEmpty(Map<?, ?> map, IBizError errorCode, Object... args) {
        if (CollectionUtils.isEmpty(map)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void notEmpty(Object[] array, IBizError errorCode, Object... args) {
        if (ObjectUtils.isEmpty(array)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void noNullElements(Object[] array, IBizError errorCode, Object... args) {
        if (array != null) {
            for (Object element : array) {
                if (element == null) {
                    throw new BizException(errorCode, args);
                }
            }
        }
    }

    public static void notEmpty(Collection<?> collection, String message, Object... args) {
        if (CollectionUtils.isEmpty(collection)) {
            throw new BizException(message, args);
        }
    }

    public static void notEmpty(Map<?, ?> map, String message, Object... args) {
        if (CollectionUtils.isEmpty(map)) {
            throw new BizException(message, args);
        }
    }

    public static void notEmpty(Object[] array, String message, Object... args) {
        if (ObjectUtils.isEmpty(array)) {
            throw new BizException(message, args);
        }
    }

    public static void noNullElements(Object[] array, String message, Object... args) {
        if (array != null) {
            for (Object element : array) {
                if (element == null) {
                    throw new BizException(message, args);
                }
            }
        }
    }

    // --- 5. 类型与实例断言 ---

    public static void isInstanceOf(Class<?> type, Object obj, IBizError errorCode, Object... args) {
        if (!type.isInstance(obj)) {
            throw new BizException(errorCode, args);
        }
    }

    public static void isAssignable(Class<?> superType, Class<?> subType, IBizError errorCode, Object... args) {
        if (subType == null || !superType.isAssignableFrom(subType)) {
            throw new BizException(errorCode, args);
        }
    }

    // --- 6. 状态断言 (State) ---

    public static void state(boolean expression, IBizError errorCode, Object... args) {
        if (!expression) {
            throw new BizException(errorCode, args);
        }
    }

    public static void isInstanceOf(Class<?> type, Object obj, String message, Object... args) {
        if (!type.isInstance(obj)) {
            throw new BizException(message, args);
        }
    }

    public static void isAssignable(Class<?> superType, Class<?> subType, String message, Object... args) {
        if (subType == null || !superType.isAssignableFrom(subType)) {
            throw new BizException(message, args);
        }
    }

    // --- 6. 状态断言 (State) ---

    public static void state(boolean expression, String message, Object... args) {
        if (!expression) {
            throw new BizException(message, args);
        }
    }
}
