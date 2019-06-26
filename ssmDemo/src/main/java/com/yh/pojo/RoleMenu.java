package com.yh.pojo;

import lombok.Data;

/**
 * @author create by yh 2019-6-26
 * 角色菜单表
 * */
@Data
public class RoleMenu {

    private Integer roleId;

    private Integer menuId;

    private String createUser;

    private String createTime;

    private String updateUser;

    private String updateTime;
}
