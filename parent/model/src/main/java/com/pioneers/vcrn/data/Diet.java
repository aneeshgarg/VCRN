package com.pioneers.vcrn.data;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Diet extends BaseObject {

    /**
     * 
     */
    private static final long serialVersionUID = 2215052385468307544L;

    private double            logId;
    private double            calories;
    private double            sodium;
    private double            cholestrol;
    private String            foodName;
    private double            fat;

    public Diet() {
        super();
    }

    public Diet(String foodName, double calories, double sodium, double cholestrol, double fat) {
        super();
        this.calories = calories;
        this.sodium = sodium;
        this.cholestrol = cholestrol;
        this.foodName = foodName;
        this.fat = fat;
    }

    public double getLogId() {
        return logId;
    }

    public void setLogId(double logId) {
        this.logId = logId;
    }

    public double getCalories() {
        return calories;
    }

    public void setCalories(double calories) {
        this.calories = calories;
    }

    public double getSodium() {
        return sodium;
    }

    public void setSodium(double sodium) {
        this.sodium = sodium;
    }

    public double getCholestrol() {
        return cholestrol;
    }

    public void setCholestrol(double cholestrol) {
        this.cholestrol = cholestrol;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public double getFat() {
        return fat;
    }

    public void setFat(double fat) {
        this.fat = fat;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Diet [logId=").append(logId).append(", calories=").append(calories).append(", sodium=").append(sodium)
                .append(", cholestrol=").append(cholestrol).append(", foodName=").append(foodName).append(", fat=").append(fat).append("]");
        return builder.toString();
    }

}
