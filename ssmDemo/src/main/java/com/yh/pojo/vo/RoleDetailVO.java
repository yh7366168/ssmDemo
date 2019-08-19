package com.yh.pojo.vo;

import lombok.Data;

import java.util.List;

/**
 * @author yh create on 2019/8/16
 */
@Data
public class RoleDetailVO {

    private Integer roleId;

    private String roleName;

    private String firstMenuName;

    private List<SecondMenuVO> secondMenuList;
}
