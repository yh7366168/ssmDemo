package com.yh.service.imp;

import com.yh.dao.UserRoleDao;
import com.yh.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author yh create on 2019/8/26
 */
@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Override
    public int deleteByRoleId(Integer roleId){
        return userRoleDao.deleteByRoleId(roleId);
    }
}
