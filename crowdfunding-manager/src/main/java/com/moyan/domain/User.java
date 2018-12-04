package com.moyan.domain;

import lombok.Data;

import java.util.Date;

/**
 * 用户 ：Administrator<br>
 * 类名 ：User<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月04日 时间 16:34<br>
 *
 * @author Administrator
 */
@Data
public class User {
    /**
     * 用户id.
     */
    private Integer id;
    /**
     * 用户名称.
     */
    private String userName;
    /**
     * 用户账户.
     */
    private String account;
    /**
     * 用户密码.
     */
    private String password;
    /**
     * 用户Email.
     */
    private String email;
    /**
     * 角色创建时间.
     */
    private Date createTime;
    /**
     * 角色更新时间.
     */
    private Date updateTime;


}
