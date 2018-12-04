package com.moyan.domain;

import lombok.Data;

/**
 * 用户 ：莫言<br>
 * 类名 ：Menu<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：crowdfunding<br>
 * 日期 ：2018年12月04日 时间 16:59<br>
 * @author 莫言
 */
@Data
public class Menu {
    /**
     * 菜单Id.
     */
    private Integer id;
    /**
     * 菜单名称.
     */
    private String name;
    /**
     * Url地址.
     */
    private String url;
    /**
     * 图标Icon.
     */
    private String icon;
    /**
     * 权限id.
     */
    private Integer pId;
}

