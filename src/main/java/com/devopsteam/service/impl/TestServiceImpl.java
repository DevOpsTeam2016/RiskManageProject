package com.devopsteam.service.impl;

import com.devopsteam.dao.RiskDao;
import com.devopsteam.dao.TestDao;
import com.devopsteam.dao.UserDao;
import com.devopsteam.model.Risk;
import com.devopsteam.model.Test;
import com.devopsteam.model.User;
import com.devopsteam.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by J on 2016/11/3.
 */

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private RiskDao riskDao;

    public String test() {
        Test test = new Test();
        test.setName("test");
        testDao.save(test);
        User manager = new User();
        manager.setPassword(Utils.md5("123"));
        manager.setRole(1);
        manager.setUsername("tracker");
        userDao.save(manager);
        User developer = new User();
        developer.setRole(0);
        developer.setUsername("manager");
        developer.setPassword(Utils.md5("123"));
        userDao.save(developer);
        Risk risk;
        for (int i = 0; i < 15; i++) {
            risk = new Risk();
            risk.setContent("风险" + i);
            riskDao.save(risk);
        }
        return "success";
    }

}
