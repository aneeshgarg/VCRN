package com.pioneers.vcrn.data;


/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class HealthData extends BaseObject {
    private static final long serialVersionUID = 3108206740692167735L;

    private long              fileId;
    private int               bloodPressure;
    private int               pulse;
    private double            calorieIndex;
    private double            sodiumConsumption;
    private double            bmiIndex;
    private double            cholestrolIndex;
    private double            weight;
    private double            height;

    public long getFileId() {
        return fileId;
    }

    public void setFileId(long fileId) {
        this.fileId = fileId;
    }

    public int getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(int bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    public int getPulse() {
        return pulse;
    }

    public void setPulse(int pulse) {
        this.pulse = pulse;
    }

    public double getCalorieIndex() {
        return calorieIndex;
    }

    public void setCalorieIndex(double calorieIndex) {
        this.calorieIndex = calorieIndex;
    }

    public double getSodiumConsumption() {
        return sodiumConsumption;
    }

    public void setSodiumConsumption(double sodiumConsumption) {
        this.sodiumConsumption = sodiumConsumption;
    }

    public double getBmiIndex() {
        return bmiIndex;
    }

    public void setBmiIndex(double bmiIndex) {
        this.bmiIndex = bmiIndex;
    }

    public double getCholestrolIndex() {
        return cholestrolIndex;
    }

    public void setCholestrolIndex(double cholestrolIndex) {
        this.cholestrolIndex = cholestrolIndex;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

}
