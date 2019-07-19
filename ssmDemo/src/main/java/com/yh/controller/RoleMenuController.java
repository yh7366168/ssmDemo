package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.sun.org.apache.xpath.internal.operations.Bool;
import com.yh.dao.RoleMenuDao;
import com.yh.pojo.RoleMenu;
import com.yh.pojo.vo.RoleDetailVO;
import jdk.nashorn.internal.objects.NativeJSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.util.List;

/**
 * @author yh create on 2019/7/11
 */
@Slf4j
@Controller
@RequestMapping("/roleMenu")
public class RoleMenuController {

    @Autowired
    private RoleMenuDao roleMenuDao;

    @RequestMapping("/queryRoleMenuDetail")
    public ModelAndView queryRoleMenuDetail(){
        ModelAndView model = new ModelAndView();
        Integer roleId = 101;
        RoleDetailVO vo = spellRoleDetailVO(roleId);
        log.info("queryRoleMenuDetail-RoleDetailVO:{}", JSON.toJSONString(vo));
        model.addObject("roleDetailVO", vo);
        model.setViewName("system/roleDetail");
        return model;
    }

    /**
     * 拼装页面显示对象
     * */
    private RoleDetailVO spellRoleDetailVO(Integer roleId){
        RoleDetailVO roleVO = new RoleDetailVO();
        Integer menuId = null;
        List<RoleMenu> roleMenuList = null;

        //用户管理
        menuId = 10001;
        roleMenuList= roleMenuDao.selectByRoleIdAndMeneId(roleId, menuId);
        for(RoleMenu roleMenu : roleMenuList){
            Integer buttonId = roleMenu.getButtonId();
            if(buttonId == 1){
                roleVO.setUserIsSelect(true);
            }else if(buttonId == 2){
                roleVO.setUserIsAdd(true);
            }else if(buttonId == 3){
                roleVO.setUserIsUpdate(true);
            }else{
                roleVO.setUserIsDelete(true);
            }
        }
        //菜单管理
        menuId = 10002;
        roleMenuList = roleMenuDao.selectByRoleIdAndMeneId(roleId, menuId);
        for(RoleMenu roleMenu : roleMenuList){
            Integer buttonId = roleMenu.getButtonId();
            if(buttonId == 1){
                roleVO.setMenuIsSelect(true);
            }else if(buttonId == 2){
                roleVO.setMenuIsAdd(true);
            }else if(buttonId == 3){
                roleVO.setMenuIsUpdate(true);
            }else{
                roleVO.setMenuIsDelete(true);
            }
        }
        //角色管理
        menuId = 10003;
        roleMenuList = roleMenuDao.selectByRoleIdAndMeneId(roleId, menuId);
        for(RoleMenu roleMenu : roleMenuList){
            Integer buttonId = roleMenu.getButtonId();
            if(buttonId == 1){
                roleVO.setRoleIsSelect(true);
            }else if(buttonId == 2){
                roleVO.setRoleIsAdd(true);
            }else if(buttonId == 3){
                roleVO.setRoleIsUpdate(true);
            }else{
                roleVO.setRoleIsDelete(true);
            }
        }
        //黑名单管理
        menuId = 20001;
        roleMenuList = roleMenuDao.selectByRoleIdAndMeneId(roleId, menuId);
        for(RoleMenu roleMenu : roleMenuList){
            Integer buttonId = roleMenu.getButtonId();
            if(buttonId == 1){
                roleVO.setBlackListIsSelect(true);
            }else if(buttonId == 2){
                roleVO.setBlackListIsAdd(true);
            }else if(buttonId == 3){
                roleVO.setBlackListIsUpdate(true);
            }else{
                roleVO.setBlackListIsDelete(true);
            }
        }
        menuId = 20002;
        roleMenuList = roleMenuDao.selectByRoleIdAndMeneId(roleId, menuId);
        for(RoleMenu roleMenu : roleMenuList){
            Integer buttonId = roleMenu.getButtonId();
            if(buttonId == 1){
                roleVO.setWhiteListIsSelect(true);
            }else if(buttonId == 2){
                roleVO.setWhiteListIsAdd(true);
            }else if(buttonId == 3){
                roleVO.setWhiteListIsUpdate(true);
            }else{
                roleVO.setWhiteListIsDelete(true);
            }
        }
        return roleVO;
    }

    @RequestMapping("/saveRoleMenu")
    @ResponseBody
    public ModelAndView saveRoleMenu(ModelAndView model, HttpServletRequest request){
        List<RoleMenu> list = new ArrayList<>();
        Integer roleId = Integer.valueOf(request.getParameter("roleId"));
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("userIsSelect")), roleId,10001, 1);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("userIsAdd")), roleId,10001, 2);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("userIsUpdate")), roleId,10001, 3);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("userIsDelete")), roleId,10001, 4);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("menuIsSelect")), roleId,10002, 1);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("menuIsAdd")), roleId,10002, 2);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("menuIsUpdate")), roleId,10002, 3);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("menuIsDelete")), roleId,10002, 4);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("roleIsSelect")), roleId,10003, 1);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("roleIsAdd")), roleId,10003, 2);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("roleIsUpdate")), roleId,10003, 3);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("roleIsDelete")), roleId,10003, 4);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("whiteListIsSelect")), roleId,20001, 1);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("whiteListIsAdd")), roleId,20001, 2);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("whiteListIsUpdate")), roleId,20001, 3);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("whiteListIsDelete")), roleId,20001, 4);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("blackListIsSelect")), roleId,20002, 1);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("blackListIsAdd")), roleId,20002, 2);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("blackListIsUpdate")), roleId,20002, 3);
        list = addRoleMenuList(list, Boolean.valueOf(request.getParameter("blackListIsDelete")), roleId,20002, 4);
        //先删除角色所有的记录
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setMenuId(roleId);
        int delNum = roleMenuDao.deleteByPrimaryKey(roleMenu);
        log.info("saveRoleMenu-删除{}条历史记录！", delNum);
        int batchNum = roleMenuDao.batchInsertRoleMenu(list);
        log.info("saveRoleMenu-增加{}条历史记录！", batchNum);
        RoleDetailVO vo = spellRoleDetailVO(roleId);
        model.addObject("roleDetailVO", vo);
        model.setViewName("system/roleDetail");
        return model;
    }

    private List<RoleMenu> addRoleMenuList(List<RoleMenu> list, Boolean isTrue, Integer roleId, Integer menuId, Integer buttonId){
        if(isTrue){
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenu.setButtonId(buttonId);
            list.add(roleMenu);
        }
        return list;
    }


    public List<Map> spellList(){
        List<Map> oneList = new ArrayList<>();
        Map<String, Object> oneMap = new HashMap<>();

        List<Map> twoList = new ArrayList<>();
        List<Map> twoList2 = new ArrayList<>();
        Map<String, Object> twoMap = new HashMap<>();
        Map<String, Object> twoMap2 = new HashMap<>();

        List<Map> threeList = new ArrayList<>();
        List<Map> threeList2 = new ArrayList<>();
        List<Map> threeList3 = new ArrayList<>();
        Map<String, Object> threeMap = new HashMap<>();
        Map<String, Object> threeMap2 = new HashMap<>();
        Map<String, Object> threeMap3 = new HashMap<>();
        threeMap.put("查询", true);
        threeMap.put("新增", true);
        threeMap.put("修改", false);
        threeMap.put("删除", true);
        threeList.add(threeMap2);
        threeMap2.put("查询", true);
        threeMap2.put("新增", false);
        threeMap2.put("修改", false);
        threeMap2.put("删除", false);
        threeList2.add(threeMap2);
        threeMap3.put("查询", true);
        threeMap3.put("新增", false);
        threeMap3.put("修改", false);
        threeMap3.put("审核", true);
        threeList3.add(threeMap3);

        List<Map> threeList10 = new ArrayList<>();
        List<Map> threeList11 = new ArrayList<>();
        Map<String, Object> threeMap10 = new HashMap<>();
        Map<String, Object> threeMap11 = new HashMap<>();
        threeMap10.put("查询", true);
        threeMap10.put("新增", false);
        threeMap10.put("修改", false);
        threeMap10.put("删除", true);
        threeList10.add(threeMap10);
        threeMap11.put("查询", true);
        threeMap11.put("新增", false);
        threeMap11.put("修改", false);
        threeMap11.put("删除", false);
        threeList11.add(threeMap11);

        twoMap.put("用户管理", threeList);
        twoMap.put("菜单管理", threeList2);
        twoMap.put("角色管理", threeList3);
        twoList.add(twoMap);

        twoMap2.put("黑名单管理", threeList10);
        twoMap2.put("白名单管理", threeList10);
        twoList2.add(twoMap2);

        oneMap.put("系统管理", twoList);
        oneMap.put("功能管理", twoList2);
        oneList.add(oneMap);
        return oneList;
    }
}
