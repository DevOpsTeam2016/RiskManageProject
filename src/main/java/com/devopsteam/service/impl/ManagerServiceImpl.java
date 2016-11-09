package com.devopsteam.service.impl;

import com.devopsteam.dao.RiskDao;
import com.devopsteam.dao.StateDao;
import com.devopsteam.dao.UserDao;
import com.devopsteam.model.Risk;
import com.devopsteam.model.State;
import com.devopsteam.model.User;
import com.devopsteam.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private RiskDao riskDao;
    @Autowired
    private StateDao stateDao;
    @Autowired
    private UserDao userDao;

    public List<Risk> getRiskList(String username) {
        User user = userDao.find(username);
        return user.getRiskListTracked();
    }

    public List<State> getStateList(String riskId) {
        Risk risk = riskDao.find(Integer.parseInt(riskId));
        return risk.getStateList();
    }

    public void createState(String state, String description, String riskId) {
        State state1 = new State();
        state1.setState(Integer.parseInt(state));
        state1.setDescription(description);
        state1.setTimestamp(new Date());
        Risk risk = riskDao.find(Integer.parseInt(riskId));
        state1.setRisk(risk);
        stateDao.save(state1);
    }
}
