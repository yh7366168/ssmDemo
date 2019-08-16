package com.yh.pojo;

import java.util.List;

/**
 * @author yh create on 2019/8/16
 */
public class RoleDetail {

    private String firstMenuName;

    private String secondMenuName;

    private List<Button> buttonList;

    public String getFirstMenuName() {
        return firstMenuName;
    }

    public void setFirstMenuName(String firstMenuName) {
        this.firstMenuName = firstMenuName;
    }

    public String getSecondMenuName() {
        return secondMenuName;
    }

    public void setSecondMenuName(String secondMenuName) {
        this.secondMenuName = secondMenuName;
    }

    public List<Button> getButtonList() {
        return buttonList;
    }

    public void setButtonList(List<Button> buttonList) {
        this.buttonList = buttonList;
    }
}
