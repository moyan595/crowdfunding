package com.moyan.dao;

import com.moyan.domain.Role;
import com.moyan.domain.RoleCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户 ：Administrator<br>
 * 类名 ：RoleMapper<br>
 * 包名 ：com.moyan.dao<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月05日 时间 10:22<br>
 *
 * 角色dao
 * @author Administrator
 */
public interface RoleMapper {
    /**
     * 查询用户：组合条件 UserCondition
     *
     * @param roleCondition the role condition
     * @return list
     */
    List<Role> queryRoleByCondition(RoleCondition roleCondition);

    /**
     * 查询角色：id
     *
     * @param id RoleId
     * @return Role
     */
    Role queryRoleById(Integer id);

    /**
     * 添加角色
     *
     * @param role the role
     */
    void saveRole(Role role);

    /**
     * 修改角色
     *
     * @param role the role
     */
    void updateRole(Role role);

    /**
     * 删除角色
     *
     * @param id the id
     */
    void deleteRole(Integer id);

    /**
     * 批量删除角色
     *
     * @param ids the ids
     */
    void batchDeleteRole(String[] ids);

    /**
     * 角色列表查询
     *
     * @return list
     */
    List<Role> queryAllRole();

    /**
     * 角色的许可id
     *
     * @param id the id
     * @return list
     */
    List<Integer> queryPermissionByRole(Integer id);

    /**
     * 保存角色许可
     *
     * @param roleId        the role id
     * @param permissionIds the permission ids
     */
    void saveRolePermission(@Param("roleId") Integer roleId, @Param("permissionIds") Integer[] permissionIds);

    /**
     * 删除角色许可
     *
     * @param roleId the role id
     */
    void deleteRolePermission(Integer roleId);
}
