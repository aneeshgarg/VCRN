package com.pioneers.vcrn.request;

import com.pioneers.vcrn.data.RehabLog;
import com.pioneers.vcrn.data.RehabPlan;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class RehabLogRequest extends BaseRequest {
    /**
     * 
     */
    private static final long serialVersionUID = 3930698029329445622L;

    private long              doctorId;
    private RehabPlan         plan;
    private RehabLog          log;

    public long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(long doctorId) {
        this.doctorId = doctorId;
    }

    public RehabPlan getPlan() {
        return plan;
    }

    public void setPlan(RehabPlan plan) {
        this.plan = plan;
    }

    public RehabLog getLog() {
        return log;
    }

    public void setLog(RehabLog log) {
        this.log = log;
    }

}
