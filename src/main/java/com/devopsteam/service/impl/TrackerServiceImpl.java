package com.devopsteam.service.impl;

import com.devopsteam.dao.RiskDao;
import com.devopsteam.dao.RiskPlanDao;
import com.devopsteam.dao.StateDao;
import com.devopsteam.dao.UserDao;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.State;
import com.devopsteam.model.User;
import com.devopsteam.service.TrackerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Service
public class TrackerServiceImpl implements TrackerService {

    @Autowired
    private RiskPlanDao riskPlanDao;
    @Autowired
    private StateDao stateDao;
    @Autowired
    private UserDao userDao;

    public List<RiskPlan> getRiskPlanList(String username) {
        User user = userDao.find(username);
        return user.getRiskPlanListTracked();
    }

    public List<State> getStateList(String riskPlanId) {
        RiskPlan riskPlan = riskPlanDao.find(Integer.parseInt(riskPlanId));
        return riskPlan.getStateList();
    }

    public void createState(String state, String description, String riskPlanId) {
        State state1 = new State();
        state1.setState(Integer.parseInt(state));
        state1.setDescription(description);
        state1.setTimestamp(new Date());
        RiskPlan riskPlan = riskPlanDao.find(Integer.parseInt(riskPlanId));
        state1.setRiskPlan(riskPlan);
        stateDao.save(state1);
    }
}
