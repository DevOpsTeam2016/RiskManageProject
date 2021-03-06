package com.devopsteam.dao;

import com.devopsteam.model.User;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface UserDao {

    public void save(User user);

    public User find(String username);

    public List<User> findAll();

}
