package com.devopsteam.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */

@Entity
public class Risk {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String content;
    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "risk")
    @OrderBy("timestamp desc")
    List<RiskPlan> riskPlanList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<RiskPlan> getRiskPlanList() {
        return riskPlanList;
    }

    public void setRiskPlanList(List<RiskPlan> riskPlanList) {
        this.riskPlanList = riskPlanList;
    }
}
