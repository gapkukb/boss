package com.boss.constant;

/**
 * redis key的常量集合
 */
public enum REDIS_KEY {
    /**
     * 验证码
     */
    CAPTCHA("captcha:"), USER("user:"), MOBILE("mobile:code:"), JWT("user:jwt:");


    private String prefix;

    REDIS_KEY(String prefix) {
        this.prefix = prefix;
    }

    public String gen(String name) {
        return prefix + name;
    }

    public String gen(Number name) {
        return prefix + name;
    }
}
