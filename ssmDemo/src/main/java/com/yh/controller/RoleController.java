package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.dao.RoleMenuDao;
import com.yh.pojo.PageBean;
import com.yh.pojo.Role;
import com.yh.pojo.vo.UserRoleVO;
import com.yh.service.RoleMenuService;
import com.yh.service.RoleService;
import com.yh.util.PageUtil;
import com.yh.util.constant.RoleConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author yh create on 2019/7/11
 */
@Slf4j
@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private HttpSession session;
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleMenuService roleMenuService;

    @RequestMapping("queryPageList")
    public ModelAndView queryPageList(@RequestParam(value = "roleName", required = false) String roleName,
                                      @RequestParam(value = "curPage", required = false) Integer curPage) {
        log.info("queryPageList-入参：roleName:{}，curPage:{}", roleName, curPage);
        Map<String, Object> params = new HashMap<String, Object>();
        Role role = new Role();
        if (StringUtils.hasText(roleName)) {
            params.put("roleName", roleName);
            role.setRoleName(roleName);
        }
        //从session中获取当前用户信息
        UserRoleVO userRoleVO = (UserRoleVO) session.getAttribute("userRoleVO");
        if (userRoleVO.getRoleId().equals(RoleConstant.ADMIN.getRoleId())) {
            //管理员可以查看所有的角色的信息
        } else {
            //非管理员只能看到自己的角色的信息
            params.put("roleId", userRoleVO.getRoleId());
        }
        PageUtil<Role> pageUtil = new PageUtil<>();
        PageBean<Role> pageBean = pageUtil.queryPageList(Role.class, curPage, params);
        List<Role> roleList = pageBean.getPageList();
        ModelAndView model = new ModelAndView();
        model.addObject("roleList", roleList);
        model.addObject("pageBean", pageBean);
        model.addObject("roleVO", role);
        model.setViewName("system/roleList");
        return model;
    }

    @RequestMapping(value = "checkRoleName", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String checkRoleName(String roleName) {
        Role role = roleService.selectByRoleName(roleName);
        log.info("checkRoleName-入参：{},结果：{}", roleName, JSON.toJSONString(role));
        if (role != null) {
            return "角色名已存在！";
        } else {
            return "success";
        }
    }

    @RequestMapping("deleteRoleByRoleId")
    public ModelAndView deleteRoleByRoleId(Integer roleId){
        //删除角色表
        int delNum = roleService.deleteRoleByRoleId(roleId);
        if(delNum != 1){
            log.info("deleteRoleByRoleId-角色删除失败，roleId:{}, delNum:{}", roleId, delNum);
        }
        //删除角色权限表
        int delRoleMenuNum = roleService.deleteRoleByRoleId(roleId);
        if(delRoleMenuNum < 1){
            log.info("deleteRoleByRoleId-角色权限删除失败！");
        }
        //删除该角色时，该角色下面的用户自动解除绑定。
        ModelAndView model = queryPageList(null, 1);
        return model;
    }

    @RequestMapping("testConfirmYes")
    public ModelAndView testConfirmYes(String roleName){
        return queryPageList(roleName, 1);
    }
}
