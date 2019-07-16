package com.yh.pojo.vo;

import lombok.Data;
/**
 * @author yh create on 2019/7/12
 */
@Data
public class RoleDetailVO {

    public static String[] menuNameArr = {};

    //----------------------系统管理----------------------
    //用户管理
    private Boolean userIsSelect;
    private Boolean userIsAdd;
    private Boolean userIsUpdate;
    private Boolean userIsDelete;
    //菜单管理
    private Boolean menuIsSelect;
    private Boolean menuIsAdd;
    private Boolean menuIsUpdate;
    private Boolean menuIsDelete;
    //角色管理
    private Boolean roleIsSelect;
    private Boolean roleIsAdd;
    private Boolean roleIsUpdate;
    private Boolean roleIsDelete;
    //----------------------功能管理----------------------
    //白名单管理
    private Boolean whiteListIsSelect;
    private Boolean whiteListIsAdd;
    private Boolean whiteListIsUpdate;
    private Boolean whiteListIsDelete;
    //黑名单管理
    private Boolean blackListIsSelect;
    private Boolean blackListIsAdd;
    private Boolean blackListIsUpdate;
    private Boolean blackListIsDelete;
}
