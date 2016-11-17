package com.devopsteam.service.impl;

import com.devopsteam.dao.*;
import com.devopsteam.model.*;
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
    @Autowired
    private RiskDao riskDao;
    @Autowired
    private StateDao stateDao;

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

    //获取特定时间段被识别最多的风险, 返回名字与数量
    public String[] getMostRecognizedRisk(Date start, Date end) {
        List<RiskPlan> allRiskPlan = riskPlanDao.findWithTime(start, end);
        int[] riskIds = new int[riskDao.getCount()];
        for (RiskPlan temp: allRiskPlan) riskIds[temp.getRisk().getId()] ++;
        int max = 0;
        int maxIndex = 0;
        for (int i = 0; i < riskIds.length; i++) {
            if (max < riskIds[i]) {
                max = riskIds[i];
                maxIndex = i;
            }
        }
        String[] toReturn = new String[3];
        Risk risk = riskDao.find(maxIndex);
        toReturn[0] = Integer.toString(risk.getId());
        toReturn[1] = risk.getContent();
        toReturn[2] = Integer.toString(max);
        return toReturn;
    }

    public String[] getMostProblemedRisk(Date start, Date end) {
        List<State> allState = stateDao.findStateWithTime(start, end);
        int[] riskIds = new int[riskDao.getCount()];
        for (State temp: allState) {
            if (temp.getState() == 1) riskIds[temp.getRiskPlan().getRisk().getId()]++;
        }
        int max = 0;
        int maxIndex = 0;
        for (int i = 0; i < riskIds.length; i++) {
            if (max < riskIds[i]) {
                max = riskIds[i];
                maxIndex = i;
            }
        }
        String[] toReturn = new String[3];
        Risk risk = riskDao.find(maxIndex);
        toReturn[0] = Integer.toString(risk.getId());
        toReturn[1] = risk.getContent();
        toReturn[2] = Integer.toString(max);
        return toReturn;
    }
}
