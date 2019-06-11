package com.yh.util;

import com.alibaba.fastjson.JSON;
import com.yh.pojo.PageBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import java.lang.reflect.Method;
import java.util.HashMap;
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
    public PageBean<T> queryPageList(Class<T> clzss, Integer curPage, Map<String, Object> params) {
        String className = clzss.getSimpleName();
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
        if(params == null){
            params = new HashMap<>();
        }
        pageBean.setCurPage(curPage);
        pageBean.setPageSize(pageSize);
        beginNum = pageSize * (curPage - 1);

        //获取context
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        Object objectDao = context.getBean(nameDao);
        Class objectDaoClz = objectDao.getClass();

        //执行XDao.queryCount()
        try {
            Method methodOne = objectDaoClz.getMethod("queryPageCount", Map.class);
            totalCount = (Integer) methodOne.invoke(objectDao, params);
            pageBean.setTotalCount(totalCount);
            log.info("PageUtil--queryCount查询到{}条结果", JSON.toJSONString(totalCount));
        } catch (Exception e) {
            log.info("PageUtil--queryCount执行失败！");
            e.printStackTrace();
        }

        params.put("beginNum", beginNum);
        params.put("pageSize", pageSize);
        int totalPage = 0;
        if (totalCount % pageSize <= 0) {
            totalPage = totalCount / pageSize;
        } else {
            totalPage = totalCount / pageSize + 1;
        }
        pageBean.setTotalPage(totalPage);

        //执行XDao.queryPageList()
        try{
            Method queryListMethod = objectDaoClz.getMethod("queryPageList", Map.class);
            pageList =(List<T>) queryListMethod.invoke(objectDao, params);
            log.info("PageUtil--queryPageList结果：{}",  JSON.toJSONString(pageList));
            pageBean.setPageList(pageList);
        }catch (Exception e){
            log.info("PageUtil--queryPageList执行失败！异常信息{}", e);
            e.printStackTrace();
        }
        return pageBean;
    }


    public static void main(String[] args) {
        String str = " ";
        if(StringUtils.hasText(str)){
            System.out.println("1");
        }else{
            System.out.println("2");
        }
    }
}
