package com.devopsteam.service;

import com.devopsteam.model.Risk;
import com.devopsteam.model.State;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface ManagerService {

    public List<Risk> getRiskList(String username);

    public List<State> getStateList(String riskId);

    public void createState(String state, String description, String riskId);

}
