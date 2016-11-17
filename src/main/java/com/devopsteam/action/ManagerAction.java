package com.devopsteam.action;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.User;
import com.devopsteam.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    private List<Risk> riskList;

    private Map<Integer, Risk> mostRecognizedRisk;
    private Map<Integer, Risk> mostProblemedRisk;

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
        String people = request.getParameter("people");
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
            riskList = managerService.getRiskList();
            session.put("planId", planId);
            session.put("planName", managerService.getPlanName(planId));
            return "plan";
        }
        String planId = request.getParameter("planId");
        String riskId = request.getParameter("riskId");
        String description = request.getParameter("description");
        String possibility = request.getParameter("possibility");
        String effect = request.getParameter("effect");
        String threshold = request.getParameter("threshold");
        managerService.createRiskPlan(planId, riskId, description, possibility, effect, threshold, session.get("username").toString());
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
            String riskIds = request.getParameter("riskIds");
            String[] riskIdList = riskIds.split(",");
            managerService.importRiskPlan(planId, riskIdList, session.get("username").toString());
        } else if (operation.equals("update")) {
            String riskPlanId = request.getParameter("riskPlanId");
            String description = request.getParameter("description");
            String possibility = request.getParameter("possibility");
            String effect = request.getParameter("effect");
            String threshold = request.getParameter("threshold");
            managerService.updateRiskPlan(riskPlanId, description, possibility, effect, threshold);
        } else if (operation.equals("delete")) {
            String riskPlanId = request.getParameter("riskPlanId");
            managerService.deleteRiskPlan(riskPlanId);
        }
        return "success";
    }

    public String graphics(){
        if(request.getMethod().equalsIgnoreCase("get")) return "graphics";
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        mostRecognizedRisk = managerService.getMostRecognizedRisk(start, end);
        mostProblemedRisk = managerService.getMostProblemedRisk(start, end);
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

    public List<Risk> getRiskList() {
        return riskList;
    }

    public void setRiskList(List<Risk> riskList) {
        this.riskList = riskList;
    }

    public Map<Integer, Risk> getMostRecognizedRisk() {
        return mostRecognizedRisk;
    }

    public void setMostRecognizedRisk(Map<Integer, Risk> mostRecognizedRisk) {
        this.mostRecognizedRisk = mostRecognizedRisk;
    }

    public Map<Integer, Risk> getMostProblemedRisk() {
        return mostProblemedRisk;
    }

    public void setMostProblemedRisk(Map<Integer, Risk> mostProblemedRisk) {
        this.mostProblemedRisk = mostProblemedRisk;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
