package com.pioneers.vcrn.data;


/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Patient extends Account {
    /**
     * 
     */
    private static final long serialVersionUID = -448227924545354681L;

    private Account           doctor;
    private HealthData        healthData;

    public Account getDoctor() {
        return doctor;
    }

    public void setDoctor(Account doctor) {
        this.doctor = doctor;
    }

    public HealthData getHealthData() {
        return healthData;
    }

    public void setHealthData(HealthData healthData) {
        this.healthData = healthData;
    }

}
