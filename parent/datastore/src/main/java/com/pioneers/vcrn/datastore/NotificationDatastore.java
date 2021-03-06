package com.pioneers.vcrn.datastore;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.datastore.helper.SqlHelper;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class NotificationDatastore {

    public void insertNotification(Notification notification) throws Exception {

        SqlSession session = null;
        try {
            session = SqlHelper.getSession();
            session.insert("InsertNotification", notification);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null)
                session.close();
        }
    }

}
