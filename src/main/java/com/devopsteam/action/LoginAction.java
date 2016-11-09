package com.devopsteam.action;

import com.devopsteam.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class LoginAction extends BaseAction {

    @Autowired
    private LoginService loginService;

    public String login() {
        if(request.getMethod().equalsIgnoreCase("get")) return "login";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String result = loginService.checkLogin(username, password);
        if (result.equals("error")) {
            session.put("message", "用户名或密码错误");
        } else {
            session.put("username", username);
            session.put("role", result);
        }
        return result;
    }

}
