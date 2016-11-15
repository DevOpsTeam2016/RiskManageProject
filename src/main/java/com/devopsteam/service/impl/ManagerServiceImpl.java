package com.devopsteam.service.impl;

import com.devopsteam.dao.PlanDao;
import com.devopsteam.dao.RiskDao;
import com.devopsteam.dao.UserDao;
import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
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
    private RiskDao riskDao;
    @Autowired
    private UserDao userDao;

    public List<Plan> getProjectList() {
        return planDao.findAll();
    }

    public List<Risk> getRiskList(String planId) {
        Plan plan = planDao.find(Integer.parseInt(planId));
        return plan.getRiskList();
    }

    public void createRisk(String projectId, String content, String possibility, String effect, String threshold, String creatorName) {
        Risk risk = new Risk();
        risk.setContent(content);
        risk.setPossibility(Integer.parseInt(possibility));
        risk.setEffect(Integer.parseInt(effect));
        risk.setThreshold(Integer.parseInt(threshold));
        risk.setTimestamp(new Date());
        Plan plan = planDao.find(Integer.parseInt(projectId));
        risk.setProject(project);
        User creator = userDao.find(creatorName);
        risk.setCreator(creator);
        riskDao.save(risk);
    }

    public void assignRisk(String riskId, String trackerName) {
        Risk risk = riskDao.find(Integer.parseInt(riskId));
        User tracker = userDao.find(trackerName);
        risk.setTracker(tracker);
        riskDao.update(risk);
    }

    public List<User> getTrackerList() {
        List<User> allUser = userDao.findAll();
        List<User> trackerList = new ArrayList<User>();
        for (User temp: allUser) {
            if (temp.getRole() == 1) trackerList.add(temp);
        }
        return trackerList;
    }

    public String getProjectName(String projectId) {
        Project project = planDao.find(Integer.parseInt(projectId));
        return project.getName();
    }

    public void createProject(String name) {
        Project project = new Project();
        project.setName(name);
        project.setTimestamp(new Date());
        planDao.save(project);
    }
}
