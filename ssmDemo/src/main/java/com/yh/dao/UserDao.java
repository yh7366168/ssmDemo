package com.yh.dao;

import com.yh.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    String queryById(String userId);

    User queryByName(String name);
}
