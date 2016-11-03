package com.devopsteam.service.impl;

import com.devopsteam.dao.TestDao;
import com.devopsteam.model.Test;
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

    public String test() {
        Test test = new Test();
        test.setName("test");
        testDao.save(test);
        return "success";
    }

}
