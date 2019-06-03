package com.yh.util;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.Menu;
import com.yh.pojo.PageBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import java.lang.reflect.Method;
import java.util.List;

/**
 * 工具类：分页
 * @author yh
 * @date 2019-6-3 11:25:44
 */
@Slf4j
@Controller
@RequestMapping("/pageUtil")
public class PageUtil<T> {

    /**
     * 能不能封装一个工具类，只传入curPage就能获取对于的list
     * */
    public  PageBean<T> queryPageList(T t, Integer curPage){
        String className = t.getClass().getSimpleName();
        String nameDao = className+"Dao";
        nameDao = StringUtil.lowerFirstString(nameDao);
        //获取对于的bean
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        Object object = context.getBean(nameDao);
        Class clzss = object.getClass();
        //执行方法
        try{
            Method method = clzss.getMethod(nameDao, Integer.class);
            List<T> lists =(List<T>) method.invoke(object, curPage);
            log.info("PageUtil--查询dao结果:{}", JSON.toJSONString(lists));
        }catch (Exception e){
            System.out.println("执行queryCount失败！");
            e.printStackTrace();
        }


        return null;
    }

    @RequestMapping("/queryPageList")
    public void test(){
        PageUtil<Menu> pageUtil = new PageUtil();
        Menu menu = new Menu();
        pageUtil.queryPageList(menu, 1);
    }


    public static void main(String[] args) {
    }
}
