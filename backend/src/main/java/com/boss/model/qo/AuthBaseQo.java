package com.boss.model.qo;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
abstract public class AuthBaseQo {
    @NotBlank(message = "用户名不能为空")
    @Length(min = 6, max = 20, message = "用户名长度{min}-{max}")
    private String username;

    @NotBlank(message = "密码不能为空")
    @Length(min = 6, max = 20, message = "密码长度{min}-{max}")
    private String password;

    //@NotBlank(message = "验证码不能为空")
    //@Length(min =  Const.CAPTCHA_LENGTH, max = Const.CAPTCHA_LENGTH, message = "验证码长度必须是{min}位")
    //private String captcha;
    //
    //@NotBlank(message = "验证码key不能为空")
    //private String key;
}

