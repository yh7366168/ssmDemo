package com.yh.util;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.PageBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

/**
 * 分页工具类：
 * @author yh
 * @date 2019-6-3 11:25:44
 */
@Slf4j
@Controller
@RequestMapping("/pageUtil")
public class PageUtil<T> {

    /**
     * 规则：
     * 在X_Dao接口存在queryCount方法和queryPageList方法<br>
     * */
    public PageBean<T> queryPageList(T t, Integer curPage, Map<String, Object> params) {
        String className = t.getClass().getSimpleName();
        String nameDao = className + "Dao";
        nameDao = StringUtil.lowerFirstString(nameDao);
        Integer totalCount = 0;
        Integer beginNum = 0;
        Integer pageSize = 10;
        List<T> pageList = null;

        PageBean<T> pageBean = new PageBean<>();
        if (curPage == null || curPage <= 0) {
            curPage = 1;
        }
        pageBean.setCurPage(curPage);
        pageBean.setPageSize(pageSize);
        beginNum = pageSize * (curPage - 1);
        params.put("curPage", curPage);
        params.put("beginNum", beginNum);

        //获取context
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        Object objectDao = context.getBean(nameDao);
        Class objectDaoClz = objectDao.getClass();

        //执行XDao.queryCount()
        try {
            Method methodOne = objectDaoClz.getMethod("queryCount", null);
            totalCount = (Integer) methodOne.invoke(objectDao, null);
            pageBean.setTotalCount(totalCount);
            log.info("PageUtil--queryCount查询到{}条结果", JSON.toJSONString(totalCount));
        } catch (Exception e) {
            log.info("PageUtil--queryCount执行失败！");
            e.printStackTrace();
        }

        int totalPage = 0;
        if (totalCount % pageSize <= 0) {
            totalPage = totalCount / pageSize;
        } else {
            totalPage = totalCount / pageSize + 1;
        }
        pageBean.setTotalPage(totalPage);

        //执行XDao.queryPageList()
        try{
            Method queryListMethod = objectDaoClz.getMethod("queryPageList", Integer.class, Integer.class);
            pageList =(List<T>) queryListMethod.invoke(objectDao, beginNum, pageSize);
            log.info("PageUtil--queryPageList结果：{}",  JSON.toJSONString(pageList));
            pageBean.setPageList(pageList);
        }catch (Exception e){
            log.info("PageUtil--queryPageList执行失败！异常信息{}", e);
            e.printStackTrace();
        }
        return pageBean;
    }


    public static void main(String[] args) {
        int totalCount = 31;
        int pageSize = 10;
        int totalPage = 0;
        if (totalCount % pageSize <= 0) {
            totalPage = totalCount / pageSize;
        } else {
            totalPage = totalCount / pageSize + 1;
        }
        System.out.println(totalPage);
    }
}
