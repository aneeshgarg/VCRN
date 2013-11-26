package com.pioneers.vcrn.data;

import java.util.Date;
import java.util.List;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class RehabLog extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = -7974176614748671579L;

    private long              patientId;
    private long              logId;
    private Date              createDate;
    private double            pulse;
    private String            bloodPressure;
    private double            weight;
    private boolean           medicineTaken;
    private boolean           exerciseDone;
    private List<Diet>        dietList;

    public long getPatientId() {
        return patientId;
    }

    public void setPatientId(long patientId) {
        this.patientId = patientId;
    }

    public long getLogId() {
        return logId;
    }

    public void setLogId(long logId) {
        this.logId = logId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public double getPulse() {
        return pulse;
    }

    public void setPulse(double pulse) {
        this.pulse = pulse;
    }

    public String getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(String bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public boolean isMedicineTaken() {
        return medicineTaken;
    }

    public void setMedicineTaken(boolean medicineTaken) {
        this.medicineTaken = medicineTaken;
    }

    public boolean isExerciseDone() {
        return exerciseDone;
    }

    public void setExerciseDone(boolean exerciseDone) {
        this.exerciseDone = exerciseDone;
    }

    public List<Diet> getDietList() {
        return dietList;
    }

    public void setDietList(List<Diet> dietList) {
        this.dietList = dietList;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("RehabLog [patientId=").append(patientId).append(", logId=").append(logId).append(", createDate=").append(createDate)
                .append(", pulse=").append(pulse).append(", bloodPressure=").append(bloodPressure).append(", weight=").append(weight)
                .append(", medicineTaken=").append(medicineTaken).append(", exerciseDone=").append(exerciseDone).append(", dietList=")
                .append(dietList).append("]");
        return builder.toString();
    }

}
