package com.pioneers.vcrn.webservices;

import java.util.List;

import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.datastore.NotificationDatastore;

/**
 *
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class NotificationService {
    
    List<Notification> getPatientNotificationsForPatient(long patientId) {
        return new NotificationDatastore().getNotificationsByPatient(patientId);
    }
    
    List<Notification> getPatientNotificationsForDoctor(long doctorId) {
        return new NotificationDatastore().getNotificationsByDoctor(doctorId);
    }

}
