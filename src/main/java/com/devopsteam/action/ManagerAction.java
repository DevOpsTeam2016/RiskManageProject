package com.devopsteam.action;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.User;
import com.devopsteam.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class ManagerAction extends BaseAction {

    @Autowired
    private ManagerService managerService;

    private List<Plan> planList;
    private List<Risk> riskList;
    private List<User> trackerList;

    private String message;

    public String index() {
        //显示项目列表
        planList = managerService.getPlanList();
        return "index";
    }

    public String createProject() {
        //创建项目
        String name = request.getParameter("name");
        managerService.createPlan(name);
        return "success";
    }

    public String project() {
        //显示项目的风险列表、创建风险
        if(request.getMethod().equalsIgnoreCase("get")) {
            String planId = request.getParameter("id");
            if (planId == null) planId = session.get("planId").toString();
            riskList = managerService.getRiskList(planId);
            trackerList = managerService.getTrackerList();
            session.put("planId", planId);
            session.put("planName", managerService.getPlanName(planId));
            return "plan";
        }
        String planId = request.getParameter("planId");
        String content = request.getParameter("content");
        String possibility = request.getParameter("possibility");
        String effect = request.getParameter("effect");
        String threshold = request.getParameter("threshold");
        managerService.createRisk(planId, content, possibility, effect, threshold, session.get("username").toString());
        return "success";
    }

    public String assignRisk() {
        //指派风险给跟踪者
        String riskId = request.getParameter("riskId");
        String trackerName = request.getParameter("trackerName");
        managerService.assignRisk(riskId, trackerName);
        message = "success";
        return "success";
    }

    public String plan(){
        return "plan";
    }

    public String create_plan(){
        return "create_plan";
    }

    public List<Plan> getPlanList() {
        return planList;
    }

    public void setPlanList(List<Plan> planList) {
        this.planList = planList;
    }

    public List<Risk> getRiskList() {
        return riskList;
    }

    public void setRiskList(List<Risk> riskList) {
        this.riskList = riskList;
    }

    public List<User> getTrackerList() {
        return trackerList;
    }

    public void setTrackerList(List<User> trackerList) {
        this.trackerList = trackerList;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
