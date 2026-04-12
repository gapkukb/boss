package com.boss.helper;

import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.jwt.JWTUtil;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.HashMap;
import java.util.Map;

abstract public class JWTHelper {
    private static final RedisTemplate<String,Object> redisTemplate = SpringUtil.getBean("redisTemplate");
    private static final byte[] SECURE_KEY = "1234".getBytes();

    static public String create(Long userId) {
        System.out.println(redisTemplate);

        Map<String, Object> map = new HashMap<String, Object>() {
            private static final long serialVersionUID = 1L;

            {
                put("user_id", userId);
                put("expire_time", System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 15);
            }
        };

        return JWTUtil.createToken(map, SECURE_KEY);
    }

    static public boolean verify(String token) {
        return JWTUtil.verify(token, SECURE_KEY);
    }
}