package com.whm.assistant.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * @program: labAssistant
 * @Date: 2019/12/1 23:03
 * @Author: Hemingway
 * @Description:
 */

/**
 * @program: com.whm.assistant.entity
 * @ClassName: User
 * @Date: 2019/12/12 10:12
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:  用户实体类
 */
@Entity
@Table(name = "lab_user")
public class User {
    @Id
    private String userId;
    @Column
    private String userName;
    @Column
    private String password;
    @Column
    private String userType;

    //@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
//    @OneToMany()
//    private Set<Recruit> recruits = new HashSet<Recruit>();

    /**
     * 默认构造函数
     */
    public User() {
    }

    /**
     * 有参构造函数
     * @param userId
     * @param userName
     * @param password
     * @param userType
     */
    public User(String userId, String userName, String password, String userType) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.userType = userType;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", userType='" + userType + '\'' +
                '}';
    }
}
