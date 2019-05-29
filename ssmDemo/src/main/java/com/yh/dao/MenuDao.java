package com.yh.dao;

import com.yh.pojo.Menu;
import com.yh.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author yinhan
 * @date 2019-5-29 11:31:42
 */
@Repository
public interface MenuDao {

    /**
     * @param params 查询条件Map
     */
    List<Menu> queryListByParams(Map<String, String> params);
}
