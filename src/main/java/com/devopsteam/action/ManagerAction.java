package com.devopsteam.action;

import com.devopsteam.model.Project;
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

    private List<Project> projectList;
    private List<Risk> riskList;
    private List<User> trackerList;

    private String message;

    public String index() {
        //显示项目列表
        projectList = managerService.getProjectList();
        return "index";
    }

    public String createProject() {
        //创建项目
        String name = request.getParameter("name");
        managerService.createProject(name);
        return "success";
    }

    public String project() {
        //显示项目的风险列表、创建风险
        if(request.getMethod().equalsIgnoreCase("get")) {
            String projectId = request.getParameter("id");
            if (projectId == null) projectId = session.get("projectId").toString();
            riskList = managerService.getRiskList(projectId);
            trackerList = managerService.getTrackerList();
            session.put("projectId", projectId);
            session.put("projectName", managerService.getProjectName(projectId));
            return "project";
        }
        String projectId = request.getParameter("projectId");
        String content = request.getParameter("content");
        String possibility = request.getParameter("possibility");
        String effect = request.getParameter("effect");
        String threshold = request.getParameter("threshold");
        System.out.println(projectId + " " + content + " " + possibility + " " + effect + " " + threshold);
        managerService.createRisk(projectId, content, possibility, effect, threshold, session.get("username").toString());
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

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
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
