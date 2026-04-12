package com.boss.context;

import com.ibm.icu.util.ULocale;


public class ULocaleContext {
    private final ULocale uLocale;

    public ULocaleContext(ULocale uLocale) {
        this.uLocale = uLocale;
    }

    public ULocale getULocale() {
        return uLocale;
    }
}
