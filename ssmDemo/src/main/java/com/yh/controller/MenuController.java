package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.Menu;
import com.yh.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author yinhan
 * @date 2019-5-29
 */
@Slf4j
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("/queryMenuList")
    public ModelAndView queryMenuList( ModelAndView model){
        Map<String, String> params = new HashMap<String, String>();
        List<Menu> menuList = menuService.queryListByParams(params);
        log.info("queryMenuList--查询结果：{}", JSON.toJSONString(menuList));
        model.addObject("menuList", menuList);
        model.setViewName("system/menuList");
        return model;
    }

}
