package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.Role;
import com.yh.pojo.RoleMenu;
import com.yh.pojo.vo.RoleDetailVO;
import com.yh.pojo.vo.UserRoleVO;
import com.yh.service.RoleDetailService;
import com.yh.service.RoleMenuService;
import com.yh.service.RoleService;
import com.yh.util.DateUtil;
import com.yh.util.exception.YhSimpleException;
import com.yh.util.exception.YhSystemException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yh create on 2019/7/11
 */
@Slf4j
@Controller
@RequestMapping("roleMenu")
public class RoleMenuController {

    @Autowired
    private RoleDetailService roleDetailService;
    @Autowired
    private RoleMenuService roleMenuService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private HttpSession session;

    @RequestMapping("saveRoleMenu")
    @ResponseBody
    public ModelAndView saveRoleMenu(Integer roleId, String dataStr) {
        ModelAndView model = new ModelAndView();
        List<RoleMenu> list = new ArrayList<>();
        log.info("saveRoleMenu-roleId:{}, dataStr:{}", roleId, dataStr);
        String[] dataStrArr = dataStr.split(";");
        for (int i = 0; i < dataStrArr.length; i++) {
            String[] strArr = dataStrArr[i].split("-");
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(Integer.valueOf(strArr[1]));
            roleMenu.setButtonId(Integer.valueOf(strArr[2]));
            list.add(roleMenu);
        }
        //业务层处理
        long startTime = System.currentTimeMillis();
        boolean flag = roleMenuService.saveRoleMenu(roleId, list);
        if (!flag) {
            log.info("saveRoleMenu-更新数据库失败！，耗时{}ms，入参list:{}，结果:{}", System.currentTimeMillis() - startTime, JSON.toJSONString(list));
            throw new YhSimpleException("维护角色权限失败！");
        }
        List<RoleDetailVO> roleDetailList = roleDetailService.spellRoleDetailVoList(roleId);
        model.addObject("roleDetailListVO", roleDetailList);
        //查询角色信息
        Role roleVO = roleService.selectByPrimaryKey(roleId);
        model.addObject("roleVO", roleVO);
        model.setViewName("system/roleDetail");
        return model;
    }

    @RequestMapping("queryRoleMenuDetail")
    public ModelAndView queryRoleMenuDetail(Integer roleId) {
        ModelAndView model = new ModelAndView();
        List<RoleDetailVO> roleDetailList = roleDetailService.spellRoleDetailVoList(roleId);
        model.addObject("roleDetailListVO", roleDetailList);
        Role roleVO = roleService.selectByPrimaryKey(roleId);
        model.addObject("roleVO", roleVO);
        model.setViewName("system/roleDetail");
        return model;
    }

    /**
     * 初始化角色详情模板表
     * */
    @RequestMapping("initRoleDetail")
    public ModelAndView initRoleDetail(){
        ModelAndView model = new ModelAndView();
        Integer roleId = 99999;
        List<RoleDetailVO> roleDetailList = roleDetailService.spellRoleDetailVoList(roleId);
        model.addObject("roleDetailListVO", roleDetailList);
        model.setViewName("system/addRole");
        return model;
    }

    /**
     * 添加新角色权限信息
     * */
    @RequestMapping(value = "addRoleMenu", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView addRoleMenu(String roleName, String roleDesc, String dataStr){
        Role role = new Role();
        UserRoleVO userRoleVO = (UserRoleVO) session.getAttribute("userRoleVO");
        role.setRoleName(roleName);
        role.setRoleDesc(roleDesc);
        role.setRoleStatus(0);
        role.setRoleType(1);
        role.setCreateTime(DateUtil.getNow());
        role.setCreateUser(userRoleVO.getUserName());
        role.setUpdateTime(DateUtil.getNow());
        role.setUpdateUser(userRoleVO.getUserName());
        int insNum = roleService.insertRole(role);
        if(insNum != 1){
            log.info("addRoleMenu-添加角色失败！insNum:{}", insNum);
        }
        role = roleService.selectByRoleName(roleName);
        Integer roleId = role.getRoleId();
        ModelAndView model = saveRoleMenu(roleId, dataStr);
        return model;
    }

}
