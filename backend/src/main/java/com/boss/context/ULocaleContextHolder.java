package com.boss.context;

import com.ibm.icu.util.ULocale;

public class ULocaleContextHolder {
    private static final ThreadLocal<ULocaleContext> localeContextHolder = new ThreadLocal<>();

    public static void setULocaleContext(ULocaleContext context) {
        localeContextHolder.set(context);
    }

    public static ULocaleContext getULocaleContext() {
        return localeContextHolder.get();
    }

    public static ULocale getULocale() {
        ULocaleContext context = getULocaleContext();
        return (context != null ? context.getULocale() : ULocale.getDefault());
    }

    public static void resetULocaleContext() {
        localeContextHolder.remove();
    }
}

