package com.pioneers.vcrn.data;

import java.util.Date;
import java.util.List;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class RehabPlan extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = -6712901536778712909L;

    private long              planId;
    private long              templateId;
    private double            sodiumGoal;
    private double            calorieGoal;
    private Date              createDate;
    private Date              updateDate;
    private double            lap;
    private double            hap;
    private double            cholestrolGoal;
    private String            habp;
    private String            labp;
    private double            bmiGoal;
    private List<Exercise>    exerciseList;
    private List<Medication>  medicationList;

    public long getPlanId() {
        return planId;
    }

    public void setPlanId(long planId) {
        this.planId = planId;
    }

    public long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(long templateId) {
        this.templateId = templateId;
    }

    public double getSodiumGoal() {
        return sodiumGoal;
    }

    public void setSodiumGoal(double sodiumGoal) {
        this.sodiumGoal = sodiumGoal;
    }

    public double getCalorieGoal() {
        return calorieGoal;
    }

    public void setCalorieGoal(double calorieGoal) {
        this.calorieGoal = calorieGoal;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public double getLap() {
        return lap;
    }

    public void setLap(double lap) {
        this.lap = lap;
    }

    public double getHap() {
        return hap;
    }

    public void setHap(double hap) {
        this.hap = hap;
    }

    public double getCholestrolGoal() {
        return cholestrolGoal;
    }

    public void setCholestrolGoal(double cholestrolGoal) {
        this.cholestrolGoal = cholestrolGoal;
    }

    public String getHabp() {
        return habp;
    }

    public void setHabp(String habp) {
        this.habp = habp;
    }

    public String getLabp() {
        return labp;
    }

    public void setLabp(String labp) {
        this.labp = labp;
    }

    public double getBmiGoal() {
        return bmiGoal;
    }

    public void setBmiGoal(double bmiGoal) {
        this.bmiGoal = bmiGoal;
    }

    public List<Exercise> getExerciseList() {
        return exerciseList;
    }

    public void setExerciseList(List<Exercise> exerciseList) {
        this.exerciseList = exerciseList;
    }

    public List<Medication> getMedicationList() {
        return medicationList;
    }

    public void setMedicationList(List<Medication> medicationList) {
        this.medicationList = medicationList;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("RehabPlan [planId=").append(planId).append(", templateId=").append(templateId).append(", sodiumGoal=").append(sodiumGoal)
                .append(", calorieGoal=").append(calorieGoal).append(", createDate=").append(createDate).append(", updateDate=").append(updateDate)
                .append(", lap=").append(lap).append(", hap=").append(hap).append(", cholestrolGoal=").append(cholestrolGoal).append(", habp=")
                .append(habp).append(", labp=").append(labp).append(", bmiGoal=").append(bmiGoal).append(", exerciseList=").append(exerciseList)
                .append(", medicationList=").append(medicationList).append("]");
        return builder.toString();
    }

}
