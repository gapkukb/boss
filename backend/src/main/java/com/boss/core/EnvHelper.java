package com.boss.core;

import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class EnvHelper {
    // 定义为静态变量，程序启动后即固定
    public final String ACTIVE_PROFILE;
    public final Boolean IS_PROD; // 环境是否为生产环境
    public final Boolean IS_FAT; // 环境是否为fat模式
    public final Boolean IS_UAT; // 环境是否为uat环境
    public final Boolean IS_DEV; // 环境是否为dev环境
    public final Boolean IS_NOT_PROD; // 环境是否非 生产环境
    public final Boolean IS_NOT_FAT; // 环境是否非fat模式
    public final Boolean IS_NOT_UAT; // 环境是否非uat环境
    public final Boolean IS_NOT_DEV; // 环境是否非dev环境

    /**
     * Spring 会在启动时通过构造函数注入 Environment
     */
    public EnvHelper(Environment env) {
        String[] profiles = env.getActiveProfiles();
        if (profiles != null && profiles.length > 0) {
            ACTIVE_PROFILE = profiles[0];
        } else {
            ACTIVE_PROFILE = "dev";
        }

        // 固定判断是否为生产环境
        IS_PROD = "prod".equals(ACTIVE_PROFILE);
        // 固定判断是否为fat模式
        IS_FAT = "fat".equals(ACTIVE_PROFILE);
        // 固定判断是否为uat环境
        IS_UAT = "uat".equals(ACTIVE_PROFILE);
        // 固定判断是否为dev环境
        IS_DEV = "dev".equals(ACTIVE_PROFILE);

        IS_NOT_PROD= !IS_PROD;
        IS_NOT_FAT = !IS_FAT;
        IS_NOT_UAT = !IS_UAT;
        IS_NOT_DEV = !IS_DEV;
    }
}
