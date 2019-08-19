package com.yh.service;

import com.yh.pojo.RoleMenu;
import com.yh.pojo.vo.RoleDetailVO;

import java.util.List;

/**
 * @author yh create on 2019/8/19
 */
public interface RoleMenuService {

    boolean saveRoleMenu(Integer roleId, List<RoleMenu> list);
}
