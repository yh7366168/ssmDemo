package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.User;
import com.yh.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/queryById")
    public ModelAndView queryById(ModelAndView model, @RequestParam Integer id){
        log.info("queryById--入参id:{}", JSON.toJSONString(id));
        String name = userService.queryById(String.valueOf(id));
        log.info("queryById--查询结果name:{}", JSON.toJSONString(name));
        model.addObject("name", name);
        model.setViewName("user");
        return model;
    }

    /**
     * 用户注册，校验用户是否存在
     * */
    @RequestMapping(value = "/checkUsernameIsExist", method = RequestMethod.GET)
    @ResponseBody
    public String checkUserExist(@RequestParam String username){
        if(username!=null){
            username = username.trim();
        }
        log.info("checkUserExist--入参username:{}", username);
        User user = userService.queryByName(username);
        log.info("checkUserExist--返回结果{}", JSON.toJSONString(user));
        if(user!=null){
            return "exist";
        }else{
            return "not exist";
        }
    }

    /**
     * 用户登录
     * */
    @RequestMapping(value = "/loginCheckUser",produces={"text/html;charset=UTF-8;","application/json;"},method = RequestMethod.GET)
    @ResponseBody
    public String loginCheckUser(@RequestParam String username, @RequestParam String password){
        String result = "";
        log.info("loginCheckUser--入参,username:{}, password:{}", username, password);
        User user = userService.queryByName(username);
        log.info("loginCheckUser--返回结果{}", JSON.toJSONString(user));
        if(user==null){
            result = "用户名不存在！";
        }else if(!password.equals(user.getPassword())){
            result = "用户密码不正确！";
        }else{
            result = "success";
        }
        return result;
    }

    /**
     * 用户注册
     * */
    @RequestMapping(value = "/registerUser", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public String registerUser(@RequestBody User user){
        log.info("registerUser--入参{}", JSON.toJSONString(user));
        return "success";
    }

}
