package com.pioneers.vcrn.data;

import java.util.Date;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Report extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = -8238275845046453635L;

    private long              reportId;
    private long              patientId;
    private String            cholestrol;
    private String            fat;
    private String            exercise;
    private String            medication;
    private String            sodium;
    private String            calories;
    private Date              createDate;
    private double            overallScore;

    public long getReportId() {
        return reportId;
    }

    public void setReportId(long reportId) {
        this.reportId = reportId;
    }

    public long getPatientId() {
        return patientId;
    }

    public void setPatientId(long patientId) {
        this.patientId = patientId;
    }

    public String getCholestrol() {
        return cholestrol;
    }

    public void setCholestrol(String cholestrol) {
        this.cholestrol = cholestrol;
    }

    public String getFat() {
        return fat;
    }

    public void setFat(String fat) {
        this.fat = fat;
    }

    public String getExercise() {
        return exercise;
    }

    public void setExercise(String exercise) {
        this.exercise = exercise;
    }

    public String getMedication() {
        return medication;
    }

    public void setMedication(String medication) {
        this.medication = medication;
    }

    public String getSodium() {
        return sodium;
    }

    public void setSodium(String sodium) {
        this.sodium = sodium;
    }

    public String getCalories() {
        return calories;
    }

    public void setCalories(String calories) {
        this.calories = calories;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public double getOverallScore() {
        return overallScore;
    }

    public void setOverallScore(double overallScore) {
        this.overallScore = overallScore;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Report [reportId=").append(reportId).append(", patientId=").append(patientId).append(", cholestrol=").append(cholestrol)
                .append(", fat=").append(fat).append(", exercise=").append(exercise).append(", medication=").append(medication).append(", sodium=")
                .append(sodium).append(", calories=").append(calories).append(", createDate=").append(createDate).append(", overallScore=")
                .append(overallScore).append("]");
        return builder.toString();
    }

}
