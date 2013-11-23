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

    private double            calories;
    private double            sodium;
    private double            cholestrol;
    private String            foodName;
    private double            fat;

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

}
