package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.Menu;
import com.yh.pojo.User;
import com.yh.service.MenuService;
import com.yh.service.UserService;
import com.yh.util.DateUtil;
import com.yh.util.exception.YhSimpleException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;

    @RequestMapping("/loginMain")
    public ModelAndView loginMain(ModelAndView model) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("secondMenuLevel", "2");
        //查询所有的二级菜单
        List<Menu> menuAllList = menuService.queryListByParams(params);
        //通过parent_id分组
        Map<Integer, List<Menu>> menuMapList = menuAllList.stream().collect(Collectors.groupingBy(Menu::getParentId));
        Map<String, List<Menu>> resultMapList = new HashMap<String, List<Menu>>();
        //替换key
        for (Integer parentId : menuMapList.keySet()) {
            List<Menu> list = menuMapList.get(parentId);
            Menu parentMenu = menuService.queryMuneById(parentId);
            resultMapList.put(parentMenu.getMenuName(), list);
        }
        model.addObject("resultMapList", resultMapList);
        model.setViewName("main/main");
        return model;
    }

    /**
     * 登录验证用户名，密码
     */
    @RequestMapping("/loginCheckMain")
    public ModelAndView loginCheckMain(ModelAndView model, @RequestParam("username") String username) {
        try{
            User user = userService.queryByName(username);
            user.setUpdateTime(DateUtil.getNow());
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("secondMenuLevel", "2");
            //查询所有的二级菜单
            List<Menu> menuAllList = menuService.queryListByParams(params);
            //通过parent_id分组
            Map<Integer, List<Menu>> menuMapList = menuAllList.stream().collect(Collectors.groupingBy(Menu::getParentId));
            Map<String, List<Menu>> resultMapList = new HashMap<String, List<Menu>>();
            //替换key
            for (Integer parentId : menuMapList.keySet()) {
                List<Menu> list = menuMapList.get(parentId);
                Menu parentMenu = menuService.queryMuneById(parentId);
                resultMapList.put(parentMenu.getMenuName(), list);
            }
            model.addObject("resultMapList", resultMapList);
            model.addObject("username", username);
            model.setViewName("main/main");

        }catch (Exception e){
            log.info("loginCheckMain-异常信息：{}", e);
            model.addObject("expMsg", e.getMessage());
        }
        return model;
    }
}
