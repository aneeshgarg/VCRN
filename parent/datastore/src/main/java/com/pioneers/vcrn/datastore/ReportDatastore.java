package com.pioneers.vcrn.datastore;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Report;
import com.pioneers.vcrn.datastore.helper.SqlHelper;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 26, 2013
 */
public class ReportDatastore {

    public void insertReport(Report report) throws Exception {
        SqlSession session = null;

        try {
            session = SqlHelper.getSession();
            session.insert("InsertReport", report);
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
