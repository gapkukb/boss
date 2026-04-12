package com.boss.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 用户主表
 * @TableName t_sys_user
 */
@TableName(value ="t_sys_user")
@Data
public class SysUser {
    /**
     * 自增主键
     */
    @TableId(type = IdType.AUTO)
    private Long userId;

    /**
     * 用户对外唯一标识(UUID)
     */
    private String userUuid;

    /**
     * 登录账号
     */
    private String username;

    /**
     * 登录密码(加密)
     */
    private String password;

    /**
     * 支付密码(加密)
     */
    private String payPin;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 头像URL
     */
    private String avatar;

    /**
     * 手机号(唯一)
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别: 0-未知, 1-男, 2-女
     */
    private Integer gender;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 会员等级: 1-普通, 2-黄金, 3-铂金, 4-钻石
     */
    private Integer vipLevel;

    /**
     * 会员等级名称冗余
     */
    private String levelNameSnapshot;

    /**
     * 成长值(影响等级)
     */
    private Integer growthValue;

    /**
     * 当前积分余额
     */
    private BigDecimal pointsBalance;

    /**
     * 历史累计消费总额
     */
    private BigDecimal totalSpentAmount;

    /**
     * 成功订单总数
     */
    private Integer orderCount;

    /**
     * 微信OpenID
     */
    private String wxOpenid;

    /**
     * 微信UnionID
     */
    private String wxUnionid;

    /**
     * 支付宝用户ID
     */
    private String aliUserId;

    /**
     * 状态: 1-正常, 2-禁用, 3-锁定(异地登录或多次失败)
     */
    private Integer status;

    /**
     * 注册来源: APP, H5, PC, MINI_PROG
     */
    private String registerSource;

    /**
     * 注册IP
     */
    private String registerIp;

    /**
     * 最后登录IP
     */
    private String lastLoginIp;

    /**
     * 最后登录时间
     */
    private Date lastLoginTime;

    /**
     * 连续登录失败次数
     */
    private Integer failCount;

    /**
     * 逻辑删除: 0-未删, 1-已删
     */
    private Integer isDeleted;

    /**
     * JSON扩展字段(存储个性化配置)
     */
    private Object extJson;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新人
     */
    private byte[] updateBy;
}