package com.yh.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    String queryById(Integer id);
}
