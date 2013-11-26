package com.pioneers.vcrn.data;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class RehabTemplate extends RehabPlan {
    /**
     * 
     */
    private static final long serialVersionUID = 4359926734857321961L;

    private String            planName;

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("RehabTemplate [planName=").append(planName).append("]").append(super.toString());
        return builder.toString();
    }

}
