package com.yh.dao;

import com.yh.pojo.UserDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    String queryById(String userId);

    UserDTO queryByName(String name);
}
