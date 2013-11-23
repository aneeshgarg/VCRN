package com.pioneers.vcrn.datastore;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.datastore.helper.SqlHelper;

/**
 *
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class NotificationDatastore {

    @SuppressWarnings("unchecked")
    public List<Notification> getNotificationsByPatient(long patientId) {
        List<Notification> notifications = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            notifications = (List<Notification>)session.selectList("GetNotificationsByPatient", patientId);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        } 
        return notifications;
    }

    @SuppressWarnings("unchecked")
    public List<Notification> getNotificationsByDoctor(long doctorId) {
        List<Notification> notifications = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            notifications = (List<Notification>)session.selectList("GetNotificationsByDoctor", doctorId);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        } 
        return notifications;
    }
    
}
