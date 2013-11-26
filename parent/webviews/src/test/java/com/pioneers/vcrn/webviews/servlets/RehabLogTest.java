package com.pioneers.vcrn.webviews.servlets;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pioneers.vcrn.data.Diet;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.data.RehabLog;
import com.pioneers.vcrn.request.RehabLogRequest;
import com.pioneers.vcrn.webviews.helper.RestHelper;

/**
 *
 * @author Aneesh Garg
 * @since Nov 26, 2013
 */
public class RehabLogTest {
    
    public static void main(String[] args) throws Exception {
        
        RehabLogTest test = new RehabLogTest();
        
        
        test.testSaveLog();

    }

    private void testSaveLog() throws Exception {
        prepareRehabLogRequest();
        
    }

    private void prepareRehabLogRequest() throws Exception {
        RehabLogRequest logRequest = new RehabLogRequest();
        
        RehabLog log = new RehabLog();
        log.setPatientId(1);
        log.setCreateDate(new Date(System.currentTimeMillis()));
        log.setBloodPressure("150/120");
        log.setPulse(120);
        log.setWeight(134.5);
        log.setMedicineTaken(false);
        log.setExerciseDone(false);
        
        List<Diet> dietList = new ArrayList<Diet>();
        dietList.add(new Diet("Dal", 120, 504, 25, 3));
        dietList.add(new Diet("Turkey", 220, 450, 52, 34));
        
        log.setDietList(dietList);
        logRequest.setLog(log);
        
        Patient patient = (Patient) new RestHelper().callRestService("/facade/getpatientinfo/1", "GET", null, Patient.class);
        if (patient != null) {
            logRequest.setDoctorId(patient.getDoctor().getAccountId());
            logRequest.setPlan(patient.getRehabPlan());
        }
        
        new RestHelper().callRestService("/facade/savelog", "POST", logRequest, RehabLog.class);
            
        
    }

}
