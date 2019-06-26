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
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainController {

    @Autowired
    private MenuService menuService;

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

}
