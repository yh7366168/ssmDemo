package com.yh.service;

import com.yh.pojo.vo.RoleDetailVO;

import java.util.List;

/**
 * @author yh create on 2019/8/19
 */
public interface RoleDetailService {

    /**
     * 组装RoleDetailVO对象
     * @param roleId
     * @return List<RoleDetailVO>
     * */
    List<RoleDetailVO> spellRoleDetailVoList(Integer roleId);
}
