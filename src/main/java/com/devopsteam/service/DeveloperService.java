package com.devopsteam.service;

import com.devopsteam.model.Project;
import com.devopsteam.model.Risk;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface DeveloperService {

    public List<Project> getProjectList();

    public String getProjectName(String projectId);

    public void createProject(String name);

    public List<Risk> getRiskList(String projectId);

    public void createRisk(String projectId, String content, String possibility, String effect, String threshold, String creatorName);

    public void assignRisk(String riskId, String trackerName);

}
