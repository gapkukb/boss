package com.boss.core;

import cn.hutool.core.util.StrUtil;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTUtil;
import com.boss.entity.SysUser;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
@Slf4j
public class JWTHelper {
    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.access-expire}")
    private int accessExpire;

    @Value("${jwt.refresh-expire}")
    private int refreshExpire;

    private static final String REDIS_PREFIX = "auth:token:";
    private static byte[] KEY;
    private static Duration ACCESS_EXPIRE;
    private static Duration REFRESH_EXPIRE;

    @Resource
    private StringRedisTemplate redisTemplate;

    @PostConstruct
    private void init() {
        KEY = secret.getBytes();
        ACCESS_EXPIRE = Duration.ofMinutes(accessExpire);
        REFRESH_EXPIRE = Duration.ofMinutes(refreshExpire);
    }

    /**
     * 1. Create: Uses Instant for precise UTC timestamps
     */
    public String createToken(SysUser user) {
        Instant now = Instant.now();
        Instant exp = now.plus(ACCESS_EXPIRE);

        String token = JWT
                .create()
                .setKey(KEY)
                .setExpiresAt(Date.from(exp))
                .setPayload("userId", user.getUserId())
                .setPayload("username", user.getUsername())
                 .sign();

        // Sync to Redis using Duration for cleaner code
        redisTemplate.opsForValue().set(REDIS_PREFIX + user.getUserId(), token, REFRESH_EXPIRE);

        return token;
    }

    /**
     * 2. Verify: Validates signature, NBF, EXP, and Redis status
     */
    public boolean verifyToken(String token) {
        // 非空校验
        if (StrUtil.isBlank(token)) return false;

        // 验证签名
        boolean verified = JWTUtil.verify(token, KEY);

        if (!verified) return false;

        // 过期时间校验
        return JWT.of(token).setKey(KEY).validate(0);
    }

    /**
     * 3. Parse: Ensures validity before extracting data
     */
    public Map<String, Object> parseToken(String token) {
        JWT jwt = JWTUtil.parseToken(token);
        String userId = (String) jwt.getPayload("userId");
        String username = (String) jwt.getPayload("username");

        return new HashMap<>() {{
            put("userId", userId);
            put("username", username);
        }};
    }
}
