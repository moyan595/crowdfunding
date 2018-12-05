package com.moyan.dao;

import com.moyan.domain.Permission;

import java.util.List;

/**
 * 用户 ：Administrator<br>
 * 类名 ：PermissionMapper<br>
 * 包名 ：com.moyan.dao<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月05日 时间 10:32<br>
 * <p>
 * 权限dao
 *
 * @author Administrator
 */
public interface PermissionMapper {

    /**
     * Query all permission list<br>
     * 查询所有权限列表.
     *
     * @return the list
     */
    List<Permission> queryAllPermission();

    /**
     * Save permission<br>
     * 添加权限.
     *
     * @param permission the permission
     */
    void savePermission(Permission permission);

    /**
     * Query permission by id <br>
     * 查询权限ID.
     *
     * @param id the id
     * @return the permission
     */
    Permission queryPermissionById(Integer id);

    /**
     * Update permission<br>
     * 更新权限.
     *
     * @param permission the permission
     */
    void updatePermission(Permission permission);

    /**
     * Delete permission<br>
     * 删除权限.
     *
     * @param id the id
     */
    void deletePermission(Integer id);
}
