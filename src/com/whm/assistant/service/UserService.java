package com.whm.assistant.service;

import com.whm.assistant.dao.UserDao;
import com.whm.assistant.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @program: checkWork
 * @Date: 2019/11/14 16:53
 * @Author: Hemingway
 * @Description:
 */

//事务注解
@Transactional(rollbackFor = Exception.class)
@Service("userService")
public class UserService {


    @Autowired
    private UserDao userDao;

    /**
     * 用户登录
     * @param user
     * @return
     */
    public User login(User user){
        return userDao.find(user);
    }

    /**
     * 用户添加
     * @param user
     */
    public void add(User user){
        userDao.add(user);
    }

    /**
     * 修改用户
     * @param user
     */
    public void edit(User user) {
        userDao.update(user);
    }
}
