package com.whm.assistant.dao;

import com.whm.assistant.entity.User;

/**
 * @program: assistant
 * @Date: 2019/11/14 16:55
 * @Author: Hemingway
 * @Description:
 */
public interface UserDao extends BaseDao<User>{

     User find(User user);

}
