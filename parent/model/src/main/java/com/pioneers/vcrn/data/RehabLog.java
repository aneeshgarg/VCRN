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
    private int               pulse;
    private int               bloodPressure;
    private double            weight;
    private boolean           medicineTaken;
    private boolean           excerciseDone;
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

    public int getPulse() {
        return pulse;
    }

    public void setPulse(int pulse) {
        this.pulse = pulse;
    }

    public int getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(int bloodPressure) {
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

    public boolean isExcerciseDone() {
        return excerciseDone;
    }

    public void setExcerciseDone(boolean excerciseDone) {
        this.excerciseDone = excerciseDone;
    }

    public List<Diet> getDietList() {
        return dietList;
    }

    public void setDietList(List<Diet> dietList) {
        this.dietList = dietList;
    }

}
