package com.yh.pojo;

import lombok.Data;

@Data
public class UserDTO {
    private String userId;

    private String username;

    private String password;

    private String sex; //性别 0-男，1-女

    private Integer age;

    private String phone;

    private String email;

    private String address;

    private String createTime;

    private String updateTime;

    private String lastLoginTime;

    private Integer loginNum;

    private boolean isLock;//是否锁定 0-未锁定，1-锁定

    private boolean userStatus;//是否生效 0-生效，1-失效
}
