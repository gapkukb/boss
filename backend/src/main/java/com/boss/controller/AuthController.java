package com.boss.controller;

import com.boss.core.R;
import com.boss.model.qo.AuthLoginQo;
import com.boss.model.qo.AuthRegisterQo;
import com.boss.model.vo.RegisterVo;
import com.boss.service.SysUserService;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthController {
    @Resource
    private SysUserService userService;

    @PostMapping("/register")
    public R<RegisterVo> rgister(@RequestBody @Validated AuthRegisterQo qo) {
        RegisterVo vo = userService.register(qo);

        return R.success(vo);
    }

    @PostMapping("/login")
    public Object login(@RequestBody @Validated AuthLoginQo qo) {
        RegisterVo vo = userService.login(qo);

        return R.success(vo);
    }

}
