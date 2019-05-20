package com.yh.service.imp;

import com.yh.dao.UserDao;
import com.yh.pojo.User;
import com.yh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    public String queryById(String userId){
        //log.info("UserServiceImpl--queryById--入参{}", userId);
        return userDao.queryById(userId);
    }

    public User queryByName(String name){
        return userDao.queryByName(name);
    }

    public void InsertUser(User user){

    }
}
