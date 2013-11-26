package com.pioneers.vcrn.webviews.servlets;

import com.pioneers.vcrn.response.RehabTemplateResponse;
import com.pioneers.vcrn.webviews.helper.RestHelper;

/**
 *
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class RehabPlanTest {
    
    public static void main(String[] args) throws Exception {
        
        RehabPlanTest test = new RehabPlanTest();
        test.testGetRehabPlanTemplates();

    }

    private void testGetRehabPlanTemplates() throws Exception {
        RehabTemplateResponse response = (RehabTemplateResponse) new RestHelper().callRestService("/facade/getrehabtemplates", "GET", null, RehabTemplateResponse.class);
        System.out.println(response.toString());
        
    }

}
