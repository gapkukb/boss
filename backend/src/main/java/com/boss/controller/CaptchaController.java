package com.boss.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.boss.constant.REDIS_KEY;
import com.boss.core.R;
import com.boss.model.vo.GetCaptchaVo;
import jakarta.annotation.Resource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;
import java.util.concurrent.TimeUnit;

@RestController
public class CaptchaController {
    @Resource
    private RedisTemplate redisTemplate;


    @GetMapping("/captcha")
    public R<GetCaptchaVo> getCaptcha() {
        // 1. 定义图形验证码的长、宽、字符数、干扰线数量
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(100, 50, 4, 10);

        lineCaptcha.setBackground(Color.decode(("0xfff000")));

        // 2. 获取Base64格式的图片数据（包含data:image/png;base64,前缀）
        String base64Data = lineCaptcha.getImageBase64Data();
        String code = lineCaptcha.getCode().toLowerCase();
        String key = IdUtil.getSnowflakeNextIdStr();

        GetCaptchaVo vo = new GetCaptchaVo();
        vo.setImage(base64Data);
        vo.setKey(key);


        redisTemplate.opsForValue().set(REDIS_KEY.CAPTCHA.gen(key), code, 3, TimeUnit.MINUTES);

        return R.success(vo);
    }


    /**
     * 验证图形验证码
     *
     * @param key  图形验证码的唯一ID
     * @param code 用户输入的验证码
     * @return 是否验证成功
     */
    public boolean validate(String key, String code) {
        var value = redisTemplate.opsForValue().get(REDIS_KEY.CAPTCHA.gen(key));
        if (ObjectUtil.isNull(value)) return false;
        if (!code.equals(value)) return false;
        return true;
    }
}
