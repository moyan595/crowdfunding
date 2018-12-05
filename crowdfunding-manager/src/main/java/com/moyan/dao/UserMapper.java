package com.moyan.dao;

import com.moyan.domain.Permission;
import com.moyan.domain.Role;
import com.moyan.domain.User;
import com.moyan.domain.UserCondition;

import java.util.List;
import java.util.Map;

/**
 * 用户 ：Administrator<br>
 * 类名 ：UserMapper<br>
 * 包名 ：com.moyan.dao<br>
 * 工程名 ：CrowdfundingNetwork<br>
 * 日期 ：2018年12月04日 时间 16:33<br>
 *
 * 用户dao
 * @author Administrator
 */
public interface UserMapper {
    /**
     * 查询用户：账号和密码
     *
     * @param user the user
     * @return user
     */
    User queryUserByAccountAndPassword(User user);

    /**
     * 查询用户：组合条件 UserCondition
     *
     * @param userCondition the user condition
     * @return list
     */
    List<User> queryUserByCondition(UserCondition userCondition);

    /**
     * 查询用户：id
     *
     * @param id the id
     * @return user
     */
    User queryUserById(Integer id);

    /**
     * 用户角色查询：用户id
     *
     * @param id the id
     * @return list
     */
    List<Role> queryRoleByUserId(Integer id);

    /**
     * 添加用户
     *
     * @param user the user
     */
    void saveUser(User user);

    /**
     * 修改用户
     *
     * @param user the user
     */
    void updateUser(User user);

    /**
     * 删除用户
     *
     * @param id the id
     */
    void deleteUser(Integer id);

    /**
     * 批量删除
     *
     * @param ids the ids
     */
    void batchDeleteUser(String[] ids);

    /**
     * 保存角色到中间表 tb_user_role
     *
     * @param paramMap the param map
     */
    void saveRoles(Map<String, Object> paramMap);

    /**
     * 移除角色 tb_user_role
     *
     * @param paramMap the param map
     */
    void deleteRoles(Map<String, Object> paramMap);

    /**
     * 查询用户权限
     *
     * @param id the id
     * @return list
     */
    List<Permission> queryUserPermission(Integer id);
}
