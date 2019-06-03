package com.yh.service;

import com.yh.pojo.Menu;
import com.yh.pojo.PageBean;

import java.util.List;
import java.util.Map;

/**
 * @author yh
 * @date 2019-5-29 14:29:16
 */
public interface MenuService {

    List<Menu> queryListByParams(Map<String, Object> params);

    Menu queryMuneById(Integer id);

    PageBean<Menu> queryPageList(Integer curPage);
}

