package com.boss.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.boss.constant.REDIS_KEY;
import com.boss.core.R;
import com.boss.entity.SysUser;
import com.boss.helper.JWTHelper;
import com.boss.service.SysUserService;
import jakarta.annotation.Resource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserController {

    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    SysUserService userService;

    @GetMapping
    public R<SysUser> queryUser(@RequestHeader(value = HttpHeaders.AUTHORIZATION,required = false) String token) {
        Assert.hasText(token,"用户未登录");
        Assert.isTrue(JWTHelper.verify(token),"用户未登录");
        Long userId = Long.parseLong((String) redisTemplate.opsForValue().get(REDIS_KEY.JWT.gen(token)));
        Assert.notNull(userId,"用户未登录");
        SysUser user = userService.queryUser(userId);
        Assert.notNull(user,"查询用户失败");

        return  R.success(user);
    }

    /**
     * 批量查询用户
     * @return
     */
    @PostMapping
    public R<IPage<SysUser>> queryUserPage(Integer current, Integer size) {
        IPage<SysUser> users = userService.queryUserPage(current,size);

        return R.success(users);
    };
}
