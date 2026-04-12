package com.boss.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.boss.entity.SysUser;
import com.boss.mapper.SysUserMapper;
import com.boss.model.qo.AuthLoginQo;
import com.boss.model.qo.AuthRegisterQo;
import com.boss.model.vo.RegisterVo;
import com.boss.service.SysUserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

/**
* @author Administrator
* @description 针对表【t_sys_user(电商系统用户主表)】的数据库操作Service实现
* @createDate 2026-04-02 14:12:26
*/
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser>
    implements SysUserService {

    @Resource
    SysUserMapper sysUserMapper;

    @Override
    public SysUser queryUser(Long userId) {
        return null;
    }

    @Override
    public IPage<SysUser> queryUserPage(Integer current, Integer size) {
        // 1. 创建分页对象：参数为 (当前页码, 每页显示数)
        Page<SysUser> page = new Page<>(current, size);

        // 2. 执行分页查询
        // selectPage(page, queryWrapper)
        return this.page(page, new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getStatus, 1) // 添加查询条件
                .orderByDesc(SysUser::getCreateTime));
    }

    @Override
    public RegisterVo register(AuthRegisterQo qo) {
        return null;
    }

    @Override
    public RegisterVo login(AuthLoginQo qo) {
        return null;
    }
}




