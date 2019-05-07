package com.yh.service.imp;

import com.yh.dao.UserDao;
import com.yh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    public String queryById(Integer id){
        return userDao.queryById(id);
    }

}
