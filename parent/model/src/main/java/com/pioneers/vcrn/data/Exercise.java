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

    private long              exerciseId;
    private String            exerciseName;
    private String            timeToSpend;
    private String            repetitions;
    private double            weight;

    public long getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(long exerciseId) {
        this.exerciseId = exerciseId;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
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
        builder.append("Exercise [exerciseId=").append(exerciseId).append(", exerciseName=").append(exerciseName).append(", timeToSpend=")
                .append(timeToSpend).append(", repetitions=").append(repetitions).append(", weight=").append(weight).append("]");
        return builder.toString();
    }

}
