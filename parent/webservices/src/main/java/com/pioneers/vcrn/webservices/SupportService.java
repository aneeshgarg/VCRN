package com.pioneers.vcrn.webservices;

import java.util.List;

import com.pioneers.vcrn.data.RehabTemplate;
import com.pioneers.vcrn.datastore.RehabPlanDatastore;
import com.pioneers.vcrn.response.RehabTemplateResponse;

/**
 *
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class SupportService {

    public RehabTemplateResponse getRehabTemplates() throws Exception {
        RehabTemplateResponse response = null;
        
        List<RehabTemplate> templateList = new RehabPlanDatastore().getRehabPlanTemplates();
        if (templateList != null) {
            response = new RehabTemplateResponse();
            response.setRehabTemplateList(templateList);
        }
        
        return response;
    }

}
