package com.pioneers.vcrn.datastore;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Diet;
import com.pioneers.vcrn.data.RehabLog;
import com.pioneers.vcrn.datastore.helper.SqlHelper;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class RehabLogDatastore {

    public void saveLog(RehabLog log) throws Exception {
        SqlSession session = null;

        try {
            session = SqlHelper.getSession();
            session.insert("InsertRehabLog", log);
            long logId = log.getLogId();
            for (Diet diet : log.getDietList()) {
                diet.setLogId(logId);
                session.insert("InsertDiet", diet);
            }
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
