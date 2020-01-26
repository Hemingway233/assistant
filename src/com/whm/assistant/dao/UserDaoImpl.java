package com.whm.assistant.dao;

import com.whm.assistant.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @program: assistant
 * @Date: 2019/11/14 17:16
 * @Author: Hemingway
 * @Description:
 */
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

    @Override
    public User find(User user) {
//        List<User> list = (List<User>) hibernateTemplate.find("from User where userId=?0 and password=?1 and userType=?2", user.getUserId(), user.getPassword(), user.getUserType());

        User u = new User();
        u.setUserId(user.getUserId());
        u.setPassword(user.getPassword());
        u.setUserType(user.getUserType());
        List<User> list = hibernateTemplate.findByExample(user);
        if (list.size() != 0 && list != null) {
            return list.get(0);
        } else {
            return null;
        }
    }
}
