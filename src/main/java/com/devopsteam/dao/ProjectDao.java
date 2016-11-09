package com.devopsteam.dao;

import com.devopsteam.model.Project;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface ProjectDao {

    public Project find(int id);

    public List<Project> findAll();

    public void save(Project project);

}
