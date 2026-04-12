package com.boss.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.boss.entity.SysUser;
import com.boss.model.qo.AuthLoginQo;
import com.boss.model.qo.AuthRegisterQo;
import com.boss.model.vo.RegisterVo;

/**
* @author Administrator
* @description 针对表【t_sys_user(电商系统用户主表)】的数据库操作Service
* @createDate 2026-04-02 14:12:26
*/
public interface SysUserService extends IService<SysUser> {

    SysUser queryUser(Long userId);

    IPage<SysUser> queryUserPage(Integer current, Integer size);

    RegisterVo register(AuthRegisterQo qo);

    RegisterVo login(AuthLoginQo qo);
}
