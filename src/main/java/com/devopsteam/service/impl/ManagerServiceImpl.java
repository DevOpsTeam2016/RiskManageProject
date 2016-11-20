package com.devopsteam.service.impl;

import com.devopsteam.dao.*;
import com.devopsteam.model.*;
import com.devopsteam.service.ManagerService;
import com.devopsteam.vo.RiskVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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

    public void createRiskPlan(String planId, String riskId, String description, String possibility, String effect, String threshold, String creatorName) {
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
        Risk risk = riskDao.find(Integer.parseInt(riskId));
        riskPlan.setRisk(risk);
        riskPlanDao.save(riskPlan);
    }

    public void importRiskPlan(String planId, String[] riskIds, String creator) {
        Plan plan = planDao.find(Integer.parseInt(planId));
        User user = userDao.find(creator);
        for (String temp: riskIds) {
            Risk risk = riskDao.find(Integer.parseInt(temp));
            RiskPlan riskPlan = new RiskPlan();
            riskPlan.setTimestamp(new Date());
            riskPlan.setPlan(plan);
            riskPlan.setRisk(risk);
            riskPlan.setCreator(user);
            riskPlanDao.save(riskPlan);
        }
    }

    public void updateRiskPlan(String riskPlanId, String description, String possibility, String effect, String threshold) {
        RiskPlan riskPlan = riskPlanDao.find(Integer.parseInt(riskPlanId));
        riskPlan.setDescription(description);
        riskPlan.setPossibility(Integer.parseInt(possibility));
        riskPlan.setEffect(Integer.parseInt(effect));
        riskPlan.setThreshold(Integer.parseInt(threshold));
        riskPlanDao.update(riskPlan);
    }

    public void deleteRiskPlan(String riskPlanId) {
        riskPlanDao.delete(Integer.parseInt(riskPlanId));
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

    public List<Risk> getRiskList() {
        return riskDao.findAll();
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

    //获取特定时间段被识别最多的风险, 返回风险与数量
    public List<RiskVo> getMostRecognizedRisk(String start, String end) {
        List<RiskPlan> allRiskPlan = riskPlanDao.findWithTime(Utils.convertToDate(start), Utils.convertToDate(end));
        int[] riskIds = new int[riskDao.getCount()];
        if (allRiskPlan != null) {
            for (RiskPlan temp: allRiskPlan) riskIds[temp.getRisk().getId()-1] ++;
        }
        List<RiskVo> riskVoList = new ArrayList<RiskVo>();
        List<Risk> riskList = riskDao.findAll();
        for (int i = 0; i < riskIds.length; i++) {
            Risk risk = riskList.get(i);
            RiskVo vo = new RiskVo(risk.getId(), risk.getContent(), riskIds[i]);
            riskVoList.add(vo);
        }
        Collections.sort(riskVoList, new Comparator<RiskVo>(){
            public int compare(RiskVo o1, RiskVo o2){
                if(o1.getNumber() == o2.getNumber())
                    return 0;
                return o1.getNumber() > o2.getNumber() ? -1 : 1;
            }
        });
        return riskVoList;
    }

    public List<RiskVo> getMostProblemedRisk(String start, String end) {
        List<State> allState = stateDao.findStateWithTime(Utils.convertToDate(start), Utils.convertToDate(end));
        int[] riskIds = new int[riskDao.getCount()];
        if (allState != null) {
            for (State temp: allState) {
                if (temp.getState() == 1) riskIds[temp.getRiskPlan().getRisk().getId()-1]++;
            }
        }
        List<RiskVo> riskVoList = new ArrayList<RiskVo>();
        List<Risk> riskList = riskDao.findAll();
        for (int i = 0; i < riskIds.length; i++) {
            Risk risk = riskList.get(i);
            RiskVo vo = new RiskVo(risk.getId(), risk.getContent(), riskIds[i]);
            riskVoList.add(vo);
        }
        Collections.sort(riskVoList, new Comparator<RiskVo>(){
            public int compare(RiskVo o1, RiskVo o2){
                if(o1.getNumber() == o2.getNumber())
                    return 0;
                return o1.getNumber() > o2.getNumber() ? -1 : 1;
            }
        });
        return riskVoList;
    }
}
