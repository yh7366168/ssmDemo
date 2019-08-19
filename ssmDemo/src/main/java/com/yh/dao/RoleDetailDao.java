package com.yh.dao;

import com.yh.pojo.RoleDetail;
import com.yh.pojo.vo.RoleDetailVO;

import java.util.List;

/**
 * @author yh create on 2019/8/19
 */
public interface RoleDetailDao {

    /**
     * 主键查询
     * @param id 主键
     * @return RoleDetailVO
     * */
    RoleDetail selectByPrimaryKey(int id);


    /**
     * 查询全部角色详情信息
     * */
    List<RoleDetail> selectAll();
}
