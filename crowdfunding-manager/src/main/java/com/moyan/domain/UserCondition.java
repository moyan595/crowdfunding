package com.moyan.domain;

import com.github.pagehelper.PageInfo;
import lombok.Data;

/**
 * 用户 ：Administrator<br>
 * 类名 ：UserCondition<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月04日 时间 16:43<br>
 * <p>
 *
 * User查询对象
 *
 * @author 莫言
 */
@Data
public class UserCondition {
    /**
     * 账户.
     */
    private String account;
    /**
     * 分页页码.
     */
    private Integer pageNo;
    /**
     * 分页显示多少条.
     */
    private Integer pageSize;

    /**
     * 分页信息.
     */
    private PageInfo<User> pageInfo;
}
