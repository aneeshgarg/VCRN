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
    private RehabPlan         rehabPlan;
    private Report            lastReport;
    private RehabLog          lastLog;

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

    public RehabPlan getRehabPlan() {
        return rehabPlan;
    }

    public void setRehabPlan(RehabPlan rehabPlan) {
        this.rehabPlan = rehabPlan;
    }

    public Report getLastReport() {
        return lastReport;
    }

    public void setLastReport(Report lastReport) {
        this.lastReport = lastReport;
    }

    public RehabLog getLastLog() {
        return lastLog;
    }

    public void setLastLog(RehabLog lastLog) {
        this.lastLog = lastLog;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Patient [doctor=").append(doctor).append(", healthData=").append(healthData).append(", rehabPlan=").append(rehabPlan)
                .append(", lastReport=").append(lastReport).append(", lastLog=").append(lastLog).append("]").append(super.toString());
        return builder.toString();
    }

}
