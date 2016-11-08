package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.UserDao;
import com.devopsteam.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by J on 2016/11/8.
 */

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private BaseDao baseDao;

    public void save(User user) {
        baseDao.save(user);
    }

    public User find(String username) {
        return (User) baseDao.load(User.class, "username", username);
    }
}
