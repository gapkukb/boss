package com.boss.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 
 * @TableName t_sys_perm
 */
@TableName(value ="t_sys_perm")
@Data
public class SysPerm {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer permId;

    /**
     * 
     */
    private String permName;
}