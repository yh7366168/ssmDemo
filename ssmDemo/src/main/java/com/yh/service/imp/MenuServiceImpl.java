package com.yh.service.imp;

import com.yh.dao.MenuDao;
import com.yh.pojo.Menu;
import com.yh.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
}
