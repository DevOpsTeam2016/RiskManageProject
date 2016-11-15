package com.devopsteam.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by J on 2016/11/15.
 * Plan中的Risk Item
 */

@Entity
public class RiskPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String description;
    Date timestamp;
    int possibility;  //0 1 2递增
    int effect;  //0 1 2递增
    int threshold;
    @ManyToOne
    Plan plan;
    @ManyToOne
    Risk risk;

}
