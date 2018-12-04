package com.moyan.domain;

import com.github.pagehelper.PageInfo;
import lombok.Data;

/**
 * 用户 ：莫言<br>
 * 类名 ：RoleCondition<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：crowdfunding<br>
 * 日期 ：2018年12月04日 时间 17:25<br>
 *
 * @author 莫言
 */
@Data
public class RoleCondition {
    /**
     * 角色名.
     */
    private String roleName;

    /**
     * 分页页码.
     */
    private Integer pageNo;
    /**
     * 分页显示多少条信息.
     */
    private Integer pageSize;

    /**
     * 分页信息.
     */
    private PageInfo<Role> pageInfo;

}
