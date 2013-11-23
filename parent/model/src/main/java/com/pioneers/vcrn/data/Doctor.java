package com.pioneers.vcrn.data;

import java.util.List;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class Doctor extends Account {
    /**
     * 
     */
    private static final long serialVersionUID = 5755466511422150618L;

    private List<Account>     patientList;

    public List<Account> getPatientList() {
        return patientList;
    }

    public void setPatientList(List<Account> patientList) {
        this.patientList = patientList;
    }

}
