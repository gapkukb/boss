package com.boss.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 
 * @TableName t_sys_role
 */
@TableName(value ="t_sys_role")
@Data
public class SysRole {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer roleId;

    /**
     * 
     */
    private String roleName;
}