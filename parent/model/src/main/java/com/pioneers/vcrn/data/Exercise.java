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
    private String            timeToSpend;
    private String            repetitions;
    private double            weight;

    public String getExcerciseName() {
        return excerciseName;
    }

    public void setExcerciseName(String excerciseName) {
        this.excerciseName = excerciseName;
    }

    public String getTimeToSpend() {
        return timeToSpend;
    }

    public void setTimeToSpend(String timeToSpend) {
        this.timeToSpend = timeToSpend;
    }

    public String getRepetitions() {
        return repetitions;
    }

    public void setRepetitions(String repetitions) {
        this.repetitions = repetitions;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Exercise [excerciseName=").append(excerciseName).append(", timeToSpend=").append(timeToSpend).append(", repetitions=")
                .append(repetitions).append(", weight=").append(weight).append("]");
        return builder.toString();
    }

}
