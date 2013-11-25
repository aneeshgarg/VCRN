package com.pioneers.vcrn.data;

import java.util.List;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class MedicalProfessional extends Account {
    /**
     * 
     */
    private static final long serialVersionUID = 5755466511422150618L;

    private List<Patient>     patientList;

    public List<Patient> getPatientList() {
        return patientList;
    }

    public void setPatientList(List<Patient> patientList) {
        this.patientList = patientList;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("MedicalProfessional [patientList=").append(patientList).append("]").append(super.toString());
        return builder.toString();
    }

}
