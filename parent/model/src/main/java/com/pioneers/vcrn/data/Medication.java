package com.pioneers.vcrn.data;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Medication extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = 137679477556271550L;

    private String            timeTotake;
    private String            medicineName;
    private String            dosage;
    private String            type;

    public String getTimeTotake() {
        return timeTotake;
    }

    public void setTimeTotake(String timeTotake) {
        this.timeTotake = timeTotake;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Medication [timeTotake=").append(timeTotake).append(", medicineName=").append(medicineName).append(", dosage=")
                .append(dosage).append(", type=").append(type).append("]");
        return builder.toString();
    }

}
