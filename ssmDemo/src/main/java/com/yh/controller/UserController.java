package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.sun.deploy.net.HttpResponse;
import com.yh.pojo.User;
import com.yh.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.net.URLEncoder;

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

    @RequestMapping(value = "/checkUsernameIsExist", method = RequestMethod.GET)
    @ResponseBody
    public String checkUserExist(@RequestParam String username){
        //log.info("checkUserExist--入参username:{}", username);
        User user = userService.queryByName(username);
        //log.info("checkUserExist--返回结果{}", JSON.toJSONString(user));
        if(user == null){
            //用户不存在
            return "error";
        }else{
            //用户存在
            return "success";
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

}
