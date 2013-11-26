package com.pioneers.vcrn.data;

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
    private String            cholestrol;
    private String            fat;
    private String            excercise;
    private String            medication;
    private String            sodium;
    private String            calories;

    public long getReportId() {
        return reportId;
    }

    public void setReportId(long reportId) {
        this.reportId = reportId;
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

    public String getExcercise() {
        return excercise;
    }

    public void setExcercise(String excercise) {
        this.excercise = excercise;
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

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Report [reportId=").append(reportId).append(", cholestrol=").append(cholestrol).append(", fat=").append(fat)
                .append(", excercise=").append(excercise).append(", medication=").append(medication).append(", sodium=").append(sodium)
                .append(", calories=").append(calories).append("]");
        return builder.toString();
    }

}
