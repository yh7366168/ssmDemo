package com.yh.pojo;

import lombok.Data;

/**
 * @author yh create on 2019/8/19
 */
@Data
public class RoleDetail {

    private Integer id;

    private Integer firstMenuId;

    private String firstMenuName;

    private Integer sceondMenuId;

    private String sceondMenuName;

    private Integer buttonId;

    private String buttonName;

    private String buttonAlias;
}
