package com.yh.service;

import com.yh.pojo.User;

public interface UserService {

    /**
     * 通过用户Id查询用户信息
     * */
    String queryById(String userId);

    /**
     * 通过用户名字查询用户信息
     * @param name, name唯一
     * */
    User queryByName(String name);

    /**
     * 新增用户
     * */
    int insertUser(User user);
}
