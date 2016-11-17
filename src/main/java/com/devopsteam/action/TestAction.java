package com.devopsteam.action;

import com.devopsteam.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by J on 2016/11/3.
 */

@Repository
public class TestAction extends BaseAction {

    @Autowired
    private TestService testService;

    @Override
    public String execute() throws Exception {
        Thread thread = new Thread() {
            @Override
            public void run() {
                testService.test();
            }
        };
        thread.start();
        return "success";
    }
}
