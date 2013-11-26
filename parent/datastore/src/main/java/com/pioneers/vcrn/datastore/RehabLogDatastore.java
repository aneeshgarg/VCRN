package com.pioneers.vcrn.datastore;

import org.apache.ibatis.session.SqlSession;

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
            int status = session.insert("InsertRehabLog", log);
            
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        
    }

}
