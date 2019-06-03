package com.yh.service.imp;

import com.alibaba.fastjson.JSON;
import com.yh.dao.MenuDao;
import com.yh.pojo.Menu;
import com.yh.pojo.PageBean;
import com.yh.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public List<Menu> queryListByParams(Map<String, Object> params){
        return menuDao.queryListByParams(params);
    }

    @Override
    public Menu queryMuneById(Integer id){
        return menuDao.queryMuneById(id);
    }

    /**
     * 分页查询
     * */
    @Override
    public PageBean<Menu> queryPageList(Integer curPage){
        log.info("queryPageList--分页查询开始");
        PageBean<Menu> pageBean = new PageBean<>();
        if(curPage == null || curPage <= 0){
            curPage = 1;
        }
        pageBean.setCurPage(curPage);
        int pageSize = 10;
        pageBean.setPageSize(pageSize);
        int totalCount = menuDao.queryCount();
        log.info("queryPageList--总共查询{}条数据",totalCount);
        pageBean.setTolalCount(totalCount);
        int totalPage = totalCount/pageBean.getPageSize() + 1;
        pageBean.setTotalPage(totalPage);
        int beginNum = pageSize * (curPage - 1);
        List<Menu> pageList = menuDao.queryPageList(beginNum, pageSize);
        log.info("queryPageList--分页查询，入参beginNum：{}，查询结果{}", beginNum, JSON.toJSONString(pageList));
        pageBean.setPageList(pageList);
        return pageBean;
    }
}
