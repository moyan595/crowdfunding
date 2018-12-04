package com.moyan.domain;

import lombok.Data;

import java.util.Date;

/**
 * 用户 ：莫言<br>
 * 类名 ：Role<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月04日 时间 16:43<br>
 *
 * @author 莫言
 */
@Data
public class Role {

    /**
     * 角色id.
     */
    private Integer id;
    /**
     * 角色名称.
     */
    private String roleName;
    /**
     * 角色创建时间.
     */
    private Date createTime;
    /**
     * 角色更新时间.
     */
    private Date updateTime;


}
