package com.yh.pojo.vo;

import java.util.List;

/**
 * @author yh create on 2019/8/19
 */
public class SecondMenuVO {

    private String secondMenuName;

    private List<ButtonVO> buttonList;

    public String getSecondMenuName() {
        return secondMenuName;
    }

    public void setSecondMenuName(String secondMenuName) {
        this.secondMenuName = secondMenuName;
    }

    public List<ButtonVO> getButtonList() {
        return buttonList;
    }

    public void setButtonList(List<ButtonVO> buttonList) {
        this.buttonList = buttonList;
    }
}
