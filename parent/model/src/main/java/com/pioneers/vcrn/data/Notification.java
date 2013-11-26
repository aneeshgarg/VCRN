package com.pioneers.vcrn.data;

import java.util.Date;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Notification extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = 6112415696677221562L;

    private long              patientId;
    private long              doctorId;
    private String            message;
    private String            subject;
    private Date              createTime;

    public long getPatientId() {
        return patientId;
    }

    public void setPatientId(long patientId) {
        this.patientId = patientId;
    }

    public long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(long doctorId) {
        this.doctorId = doctorId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Notification [patientId=").append(patientId).append(", doctorId=").append(doctorId).append(", message=").append(message)
                .append(", subject=").append(subject).append(", createTime=").append(createTime).append("]");
        return builder.toString();
    }

}
