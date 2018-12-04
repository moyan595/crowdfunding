package com.moyan.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户 ：Administrator<br>
 * 类名 ：Permission<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月04日 时间 16:43<br>
 *
 * @author 莫言
 */
@Data
public class Permission {
    /**
     * Id.
     */
    private Integer id;
    /**
     * Name.
     */
    private String name;
    /**
     * Url地址.
     */
    private String url;
    /**
     * 图标.
     */
    private String icon;
    /**
     * pId.
     */
    private Integer pId;

    /**
     * 是否展开节点.
     */
    private boolean open = true;

    /**
     * 节点是否勾选.
     */
    private boolean checked;

    /**
     * 子节点集合.
     */
    private List<Permission> children = new ArrayList<>();
}
