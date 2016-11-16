package com.devopsteam.model;

import org.springframework.core.annotation.Order;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */

@Entity
public class Plan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String name;
    int type; //0: 小型 1：中型  2：大型
    String language;
    int people;
    Date timestamp;
    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "plan")
    @OrderBy("timestamp desc")
    List<RiskPlan> riskPlanList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public List<RiskPlan> getRiskPlanList() {
        return riskPlanList;
    }

    public void setRiskPlanList(List<RiskPlan> riskPlanList) {
        this.riskPlanList = riskPlanList;
    }
}
