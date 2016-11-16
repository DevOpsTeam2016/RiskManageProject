package com.devopsteam.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String username;
    String password;
    int role;  //0: 管理者    1: 跟踪者
    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "creator")
    @OrderBy("timestamp desc")
    List<RiskPlan> riskPlanListCreated;
    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "tracker")
    @OrderBy("timestamp desc")
    List<RiskPlan> riskPlanListTracked;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public List<RiskPlan> getRiskPlanListCreated() {
        return riskPlanListCreated;
    }

    public void setRiskPlanListCreated(List<RiskPlan> riskPlanListCreated) {
        this.riskPlanListCreated = riskPlanListCreated;
    }

    public List<RiskPlan> getRiskPlanListTracked() {
        return riskPlanListTracked;
    }

    public void setRiskPlanListTracked(List<RiskPlan> riskPlanListTracked) {
        this.riskPlanListTracked = riskPlanListTracked;
    }
}
