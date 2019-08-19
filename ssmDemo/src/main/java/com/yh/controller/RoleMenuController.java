package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.RoleMenu;
import com.yh.pojo.vo.RoleDetailVO;
import com.yh.service.RoleDetailService;
import com.yh.service.RoleMenuService;
import com.yh.util.exception.YhSimpleException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yh create on 2019/7/11
 */
@Slf4j
@Controller
@RequestMapping("/roleMenu")
public class RoleMenuController {

    @Autowired
    private RoleDetailService roleDetailService;
    @Autowired
    private RoleMenuService roleMenuService;

//    @RequestMapping("/queryRoleMenuDetail")
//    public ModelAndView queryRoleMenuDetail(Integer roleId) {
//        ModelAndView model = new ModelAndView();
//        try{
//            RoleDetailVO vo = spellRoleDetailVO(roleId);
//            vo.setRoleId(roleId);
//            //查询角色信息
//            Role role = roleDao.selectByPrimaryKey(roleId);
//            if(role==null){
//                log.info("queryRoleMenuDetail-查询角色信息失败，roleId：{}", roleId);
//                throw new YhSimpleException("查询角色信息失败！");
//            }
//            vo.setRoleName(role.getRoleName());
//            log.info("queryRoleMenuDetail-roleId:{}， RoleDetailVO:{}", roleId, JSON.toJSONString(vo));
//            model.addObject("roleDetailVO", vo);
//            model.setViewName("system/roleDetail");
//        }catch ( Exception e){
//            log.info("查询用户权限详情页面失败！", e);
//        }
//        return model;
//    }

    @RequestMapping("/saveRoleMenu")
    @ResponseBody
    public ModelAndView saveRoleMenu(Integer roleId, String dataStr) {
        ModelAndView model = new ModelAndView();
        List<RoleMenu> list = new ArrayList<>();
        log.info("saveRoleMenu-roleId:{}, dataStr:{}", roleId, dataStr);
        String[] dataStrArr = dataStr.split(";");
        for(int i=0; i<dataStrArr.length-1; i++){
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
        if(!flag){
            log.info("saveRoleMenu-更新数据库失败！，耗时{}ms，入参list:{}，结果:{}", System.currentTimeMillis()-startTime, JSON.toJSONString(list));
            throw new YhSimpleException("维护角色权限失败！");
        }else{
            List<RoleDetailVO> roleDetailList = roleDetailService.spellRoleDetailVoList(roleId);
            model.addObject("roleDetailListVO", roleDetailList);
            model.addObject("selectRoleId", roleId);
            model.setViewName("system/roleDetail");
        }
        return model;
    }

    @RequestMapping("queryRoleMenuDetail2")
    public ModelAndView testRoleDetail(Integer roleId){
        ModelAndView model = new ModelAndView();
        List<RoleDetailVO> roleDetailList = roleDetailService.spellRoleDetailVoList(roleId);
        model.addObject("roleDetailListVO", roleDetailList);
        model.addObject("selectRoleId", roleId);
        model.setViewName("system/roleDetail");
        return model;
    }
}
