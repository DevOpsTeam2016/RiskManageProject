package com.devopsteam.service;

import com.devopsteam.model.Project;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface DeveloperService {

    public List<Project> getProjectList();

    public void createProject(String name);

}
