package com.yh.service;

import com.yh.pojo.Role;

/**
 * @author yh create on 2019/8/21
 */
public interface RoleService {

    Role selectByPrimaryKey(Integer roleId);

    Role selectByRoleName(String roleName);

    int insertRole(Role role);

    int deleteRoleByRoleId(Integer roleId);
}
