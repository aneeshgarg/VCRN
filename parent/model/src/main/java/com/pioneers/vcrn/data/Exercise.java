package com.pioneers.vcrn.data;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Exercise extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = -285837474314418679L;

    private String            excerciseName;
    private int               timeToSpend;
    private int               repetitions;
    private double            weight;

    public String getExcerciseName() {
        return excerciseName;
    }

    public void setExcerciseName(String excerciseName) {
        this.excerciseName = excerciseName;
    }

    public int getTimeToSpend() {
        return timeToSpend;
    }

    public void setTimeToSpend(int timeToSpend) {
        this.timeToSpend = timeToSpend;
    }

    public int getRepetitions() {
        return repetitions;
    }

    public void setRepetitions(int repetitions) {
        this.repetitions = repetitions;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

}
