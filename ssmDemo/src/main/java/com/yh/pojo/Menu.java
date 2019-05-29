package com.yh.pojo;

import lombok.Data;

/**
 * @author yinhan
 * @date 2019-5-29 11:29:47
 */
@Data
public class Menu {
    private Integer menuId;

    private String menuName;

    private Integer menuLevel;//菜单级别(1-一级菜单，2-二级菜单)

    private Integer parentId;

    private String createTime;

    private String updateTime;

}
