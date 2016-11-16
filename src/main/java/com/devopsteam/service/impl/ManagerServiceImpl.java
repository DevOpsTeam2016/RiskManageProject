package com.devopsteam.service.impl;

import com.devopsteam.dao.PlanDao;
import com.devopsteam.dao.RiskDao;
import com.devopsteam.dao.RiskPlanDao;
import com.devopsteam.dao.UserDao;
import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.User;
import com.devopsteam.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private PlanDao planDao;
    @Autowired
    private RiskPlanDao riskPlanDao;
    @Autowired
    private UserDao userDao;

    public List<Plan> getPlanList() {
        return planDao.findAll();
    }

    public List<RiskPlan> getRiskPlanList(String planId) {
        Plan plan = planDao.find(Integer.parseInt(planId));
        return plan.getRiskPlanList();
    }

    public void createRiskPlan(String planId, String description, String possibility, String effect, String threshold, String creatorName) {
        RiskPlan riskPlan = new RiskPlan();
        riskPlan.setDescription(description);
        riskPlan.setPossibility(Integer.parseInt(possibility));
        riskPlan.setEffect(Integer.parseInt(effect));
        riskPlan.setThreshold(Integer.parseInt(threshold));
        riskPlan.setTimestamp(new Date());
        Plan plan = planDao.find(Integer.parseInt(planId));
        riskPlan.setPlan(plan);
        User creator = userDao.find(creatorName);
        riskPlan.setCreator(creator);
        riskPlanDao.save(riskPlan);
    }

    public void assignRiskPlan(String riskPlanId, String trackerName) {
        RiskPlan riskPlan = riskPlanDao.find(Integer.parseInt(riskPlanId));
        User tracker = userDao.find(trackerName);
        riskPlan.setTracker(tracker);
        riskPlanDao.update(riskPlan);
    }

    public List<User> getTrackerList() {
        List<User> allUser = userDao.findAll();
        List<User> trackerList = new ArrayList<User>();
        for (User temp: allUser) {
            if (temp.getRole() == 1) trackerList.add(temp);
        }
        return trackerList;
    }

    public String getPlanName(String planId) {
        Plan plan = planDao.find(Integer.parseInt(planId));
        return plan.getName();
    }

    public void createPlan(String name, String type, String language, String people) {
        Plan plan = new Plan();
        plan.setName(name);
        plan.setType(Integer.parseInt(type));
        plan.setLanguage(language);
        plan.setPeople(Integer.parseInt(people));
        plan.setTimestamp(new Date());
        planDao.save(plan);
    }
}
