package com.devopsteam.dao;

import com.devopsteam.model.Plan;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface PlanDao {

    public Plan find(int id);

    public List<Plan> findAll();

    public void save(Plan plan);

}
