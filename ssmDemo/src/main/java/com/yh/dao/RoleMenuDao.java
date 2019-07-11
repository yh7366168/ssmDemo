package com.yh.dao;

import com.yh.pojo.RoleMenu;
import org.springframework.stereotype.Repository;

/**
 * @author yh 2019-6-26
 * */
@Repository
public interface RoleMenuDao {
    int deleteByPrimaryKey(RoleMenu roleMenu);

    int insertSelective(RoleMenu roleMenu);

    RoleMenu selectByPrimaryKey(RoleMenu roleMenu);

    int updateByPrimaryKeySelective(RoleMenu roleMenu);
}
