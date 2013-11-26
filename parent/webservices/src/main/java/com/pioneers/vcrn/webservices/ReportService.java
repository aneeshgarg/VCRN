package com.pioneers.vcrn.webservices;

import java.util.Date;

import com.pioneers.vcrn.data.Diet;
import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.data.RehabLog;
import com.pioneers.vcrn.data.RehabPlan;
import com.pioneers.vcrn.data.Report;
import com.pioneers.vcrn.datastore.ReportDatastore;
import com.pioneers.vcrn.request.RehabLogRequest;

/**
 *
 * @author Aneesh Garg
 * @since Nov 26, 2013
 */
public class ReportService {

    private static final String DID_NOT_EXERCISE = "Did Not Exercise";
    private static final String DID_EXERCISE = "Did Exercise";
    private static final String DID_NOT_TAKE_MEDICATION = "Did Not Take Medication";
    private static final String TOOK_MEDICATION = "Took Medication";
    private static final String NOT_MET = "Not Met";
    private static final String MET = "Met";

    public void generateReport(RehabLogRequest logRequest) throws Exception {
        RehabPlan plan = logRequest.getPlan(); 
        RehabLog log = logRequest.getLog();
        Report report = new Report();
        report.setCreateDate(new Date(System.currentTimeMillis()));
        report.setPatientId(log.getPatientId());
        double score = 0;
        if (log.isMedicineTaken()) {
            report.setMedication(TOOK_MEDICATION);
            score ++;
        }
        else
            report.setMedication(DID_NOT_TAKE_MEDICATION);
        
        if (log.isExerciseDone()) {
            report.setExercise(DID_EXERCISE);
            score ++;
        }
        else
            report.setExercise(DID_NOT_EXERCISE);
        
        double cholestrol = 0;
        double sodium = 0;
        double fat = 0;
        double calories = 0;
        
        for (Diet diet : log.getDietList()) {
            cholestrol += diet.getCholestrol();
            sodium += diet.getSodium();
            fat += diet.getFat();
            calories += diet.getCalories();
        }
        
        if (cholestrol <= plan.getCholestrolGoal()) {
            report.setCholestrol(MET);
            score ++;
        }
        else
            report.setCholestrol(NOT_MET);
        
        if (sodium <= plan.getSodiumGoal()) {
            report.setSodium(MET);
            score ++;
        }
        else
            report.setSodium(NOT_MET);
        
        if (fat <= plan.getBmiGoal()){
            report.setFat(MET);
            score ++;
        }
        else
            report.setFat(NOT_MET);
        
        if (calories <= plan.getCalorieGoal()) {
            report.setCalories(MET);
            score ++;
        }
        else
            report.setFat(NOT_MET);
        
        report.setOverallScore(score*100/6);
        
        try {
            new ReportDatastore().insertReport(report);
        } catch (Exception e) {
            Notification notification = new Notification();
            notification.setCreateTime(new Date(System.currentTimeMillis()));
            notification.setDoctorId(logRequest.getDoctorId());
            notification.setPatientId(logRequest.getDoctorId());
            notification.setSubject("Report generation failed.");
            notification.setMessage("Report cannot be generated for patient's log entry dated " + log.getCreateDate());
            new NotificationService().processNotification(notification);
            throw e;            
        }
            
    }

}
