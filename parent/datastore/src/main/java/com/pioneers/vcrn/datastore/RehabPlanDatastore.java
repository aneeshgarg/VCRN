package com.pioneers.vcrn.datastore;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.RehabTemplate;
import com.pioneers.vcrn.datastore.helper.SqlHelper;

/**
 *
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class RehabPlanDatastore {

    @SuppressWarnings("unchecked")
    public List<RehabTemplate> getRehabPlanTemplates() throws Exception {
        List<RehabTemplate> templateList = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            templateList = (List<RehabTemplate>) session.selectList("GetRehabTemplates");
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null)
                session.close();
        } 
        return templateList;
    }

}
