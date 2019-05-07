package com.yh.controller;

import com.yh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/queryById")
    public ModelAndView queryById(ModelAndView model, @RequestParam Integer id){
        String name = userService.queryById(id);
        model.addObject("name", name);
        model.setViewName("user");
        return model;
    }
}
