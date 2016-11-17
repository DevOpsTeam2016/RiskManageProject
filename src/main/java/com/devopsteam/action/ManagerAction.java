package com.devopsteam.action;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
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
    private List<RiskPlan> riskPlanList;
    private List<User> trackerList;

    private String message;

    public String index() {
        //显示项目列表
        planList = managerService.getPlanList();
        return "index";
    }

    public String createPlan() {
        //创建计划
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String language = request.getParameter("language");
        String people = request.getParameter("People");
        managerService.createPlan(name, type, language, people);
        return "success";
    }

    public String plan() {
        //显示计划的风险列表、创建风险
        if(request.getMethod().equalsIgnoreCase("get")) {
            String planId = request.getParameter("id");
            if (planId == null) planId = session.get("planId").toString();
            riskPlanList = managerService.getRiskPlanList(planId);
            trackerList = managerService.getTrackerList();
            session.put("planId", planId);
            session.put("planName", managerService.getPlanName(planId));
            return "plan";
        }
        String planId = request.getParameter("planId");
        String description = request.getParameter("description");
        String possibility = request.getParameter("possibility");
        String effect = request.getParameter("effect");
        String threshold = request.getParameter("threshold");
        managerService.createRiskPlan(planId, description, possibility, effect, threshold, session.get("username").toString());
        return "success";
    }

    public String assignRisk() {
        //指派风险给跟踪者
        String riskPlanId = request.getParameter("riskPlanId");
        String trackerName = request.getParameter("trackerName");
        managerService.assignRiskPlan(riskPlanId, trackerName);
        message = "success";
        return "success";
    }

    public String risk() {
        //风险的删改，导入
        String operation = request.getParameter("operation");
        if (operation.equals("import")) {
            String planId = request.getParameter("planId");
            String risks = request.getParameter("risks");
            //.....................................
        } else if (operation.equals("update")) {
            String riskPlanId = request.getParameter("riskPlanId");
            String description = request.getParameter("description");
            String possibility = request.getParameter("possibility");
            String effect = request.getParameter("effect");
            String threshold = request.getParameter("threshold");
            //......................................
        } else if (operation.equals("delete")) {
            String riskPlanId = request.getParameter("riskPlanId");
            //......................................
        }
        return "success";
    }

    public String graphics(){
        return "graphics";
    }

    public List<Plan> getPlanList() {
        return planList;
    }

    public void setPlanList(List<Plan> planList) {
        this.planList = planList;
    }

    public List<RiskPlan> getRiskPlanList() {
        return riskPlanList;
    }

    public void setRiskPlanList(List<RiskPlan> riskPlanList) {
        this.riskPlanList = riskPlanList;
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
