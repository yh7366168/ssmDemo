package com.yh.service.imp;

import com.yh.dao.RoleMenuDao;
import com.yh.pojo.RoleMenu;
import com.yh.pojo.vo.RoleDetailVO;
import com.yh.service.RoleDetailService;
import com.yh.service.RoleMenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author yh create on 2019/8/19
 */
@Slf4j
@Service("roleMenuService")
public class RoleMenuServiceImpl implements RoleMenuService {

    @Autowired
    private RoleMenuDao roleMenuDao;

    @Override
    public boolean saveRoleMenu(Integer roleId, List<RoleMenu> list){
        try{
            int delNum = roleMenuDao.deleteByRoleId(roleId);
            log.info("saveRoleMenu-删除{}条权限历史记录！", delNum);
            int batchNum = roleMenuDao.batchInsertRoleMenu(list);
            log.info("saveRoleMenu-新增{}条权限记录！", batchNum);
        }catch (Exception e){
            log.info("saveRoleMenu-系统异常，"+ e);
            return false;
        }
        return true;
    }

    @Override
    public int deleteByRoleId(Integer roleId){
        return roleMenuDao.deleteByRoleId(roleId);
    }
}
