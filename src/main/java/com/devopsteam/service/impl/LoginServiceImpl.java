package com.devopsteam.service.impl;

import com.devopsteam.dao.UserDao;
import com.devopsteam.model.User;
import com.devopsteam.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by J on 2016/11/8.
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;

    public String checkLogin(String username, String password) {
        User user = userDao.find(username);
        if (user == null) return "error";
        if (user.getPassword().equals(Utils.md5(password))) {
            String role = "";
            switch (user.getRole()) {
                case 0:
                    role = "developer";
                    break;
                case 1:
                    role = "manager";
                    break;
            }
            return role;
        }
        return "error";
    }

}
