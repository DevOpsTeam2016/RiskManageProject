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
    int role;  //0: 开发者    1: 管理者
    @OneToMany(mappedBy = "creator")
    List<Risk> riskListCreated;
    @OneToMany(mappedBy = "tracker")
    List<Risk> riskListTracked;

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

    public List<Risk> getRiskListCreated() {
        return riskListCreated;
    }

    public void setRiskListCreated(List<Risk> riskListCreated) {
        this.riskListCreated = riskListCreated;
    }

    public List<Risk> getRiskListTracked() {
        return riskListTracked;
    }

    public void setRiskListTracked(List<Risk> riskListTracked) {
        this.riskListTracked = riskListTracked;
    }
}
