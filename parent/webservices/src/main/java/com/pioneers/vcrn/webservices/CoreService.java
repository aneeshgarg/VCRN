package com.pioneers.vcrn.webservices;

import java.util.Date;

import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.data.RehabLog;
import com.pioneers.vcrn.data.RehabPlan;
import com.pioneers.vcrn.datastore.RehabLogDatastore;
import com.pioneers.vcrn.datastore.RehabPlanDatastore;
import com.pioneers.vcrn.request.RehabLogRequest;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class CoreService {

    public void saveLog(RehabLogRequest logRequest) throws Exception {
        RehabPlan plan = logRequest.getPlan();
        RehabLog log = logRequest.getLog();

        new RehabLogDatastore().saveLog(log);

        boolean normalPulse = checkPulseRange(plan, log);
        boolean normalBP = checkBPRange(plan, log);
        Notification notification = checkNotifications(logRequest.getDoctorId(), log.getPatientId(), normalPulse, normalBP);
        if (notification != null)
            new NotificationService().processNotification(notification);
        
        new ReportService().generateReport(logRequest);

    }

    private Notification checkNotifications(long doctorId, long patientId, boolean normalPulse, boolean normalBP) {
        if (normalPulse && normalBP)
            return null;
        Notification notification = new Notification();
        String subject = "";
        String message = "";
        if (!normalPulse) {
            subject += "Abnormal Pulse. ";
            message += "Patient has abnormal pulse. ";
        }
        if (!normalBP) {
            subject += "Abnormal Blood Pressure. ";
            message += "Patient has abnormal blood pressure. ";
        }
        notification.setCreateTime(new Date(System.currentTimeMillis()));
        notification.setDoctorId(doctorId);
        notification.setPatientId(patientId);
        notification.setSubject(subject);
        notification.setMessage(message);
        return notification;
    }

    private boolean checkBPRange(RehabPlan plan, RehabLog log) {
        boolean normal = true;
        String logBP = log.getBloodPressure();
        String labp = plan.getLabp();
        String habp = plan.getHabp();

        int logBp1 = Integer.valueOf(logBP.split("/")[0]);
        int logBp2 = Integer.valueOf(logBP.split("/")[1]);

        int labp1 = Integer.valueOf(labp.split("/")[0]);
        int labp2 = Integer.valueOf(labp.split("/")[1]);

        int habp1 = Integer.valueOf(habp.split("/")[0]);
        int habp2 = Integer.valueOf(habp.split("/")[1]);

        if (logBp1 >= labp1 && logBp1 <= habp1)
            normal = normal && true;
        else
            normal = normal && false;

        if (logBp2 >= labp2 && logBp2 <= habp2)
            normal = normal && true;
        else
            normal = normal && false;

        return normal;
    }

    private boolean checkPulseRange(RehabPlan plan, RehabLog log) {
        double lap = plan.getLap();
        double hap = plan.getHap();
        double pulse = log.getPulse();
        return (pulse >= lap && pulse <= hap);
    }

    public void saveRehabPlan(RehabPlan plan) throws Exception {
        new RehabPlanDatastore().insertPlan(plan);
    }

    public void updateRehabPlan(RehabPlan plan) throws Exception {
        new RehabPlanDatastore().updatePlan(plan);
    }

}
