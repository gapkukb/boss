package com.boss.model.vo;

import com.boss.entity.SysUser;
import lombok.Data;

@Data
public class RegisterVo {
    private SysUser user;
    private String token;
}
