package com.pioneers.vcrn.webservices;

import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.datastore.NotificationDatastore;


/**
 *
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class NotificationService {

    public void processNotification(Notification notification) throws Exception {
        
        if (notification != null) {
            insertNotification(notification);
            sendMail(notification);
        }
         
    }

    private void sendMail(Notification notification) {
        // TODO Auto-generated method stub
        
    }

    private void insertNotification(Notification notification) throws Exception {
        new NotificationDatastore().insertNotification(notification);
        
    }

}
