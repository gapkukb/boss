package com.boss.helper;

import cn.hutool.extra.spring.SpringUtil;
import com.boss.context.ULocaleContextHolder;
import com.ibm.icu.util.ULocale;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;

/**
 * i18n 国际化工具
 *
 * @author fanfan
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class I18n {

    private static final MessageSource MESSAGE_SOURCE = SpringUtil.getBean(MessageSource.class);

    /**
     * 根据消息键和参数 获取消息 委托给spring messageSource
     *
     * @param code 消息键
     * @param args 参数
     * @return 获取国际化翻译值
     */
    public static String message(String code, Object... args) {



        try {
            ULocale uLocale = ULocaleContextHolder.getULocale();

            return MESSAGE_SOURCE.getMessage(code, args, uLocale.toLocale());
        } catch (NoSuchMessageException e) {
            return code;
        }
    }


    /**
     * 获取当前语言
     * @return 语言
     */
    public static String getLanguage() {
        ULocale uLocale = ULocaleContextHolder.getULocale();
        return uLocale.getLanguage();
    }
}
