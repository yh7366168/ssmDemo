package com.yh.service.imp;

import com.yh.dao.RoleDao;
import com.yh.pojo.Role;
import com.yh.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author yh create on 2019/8/21
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public Role selectByPrimaryKey(Integer roleId){
        return roleDao.selectByPrimaryKey(roleId);
    }

    @Override
    public Role selectByRoleName(String roleName){
        return roleDao.selectByRoleName(roleName);
    }

    @Override
    public int insertRole(Role role){
        return roleDao.insert(role);
    }

    @Override
    public int deleteRoleByRoleId(Integer roleId){
        return roleDao.deleteByPrimaryKey(roleId);
    }
}
