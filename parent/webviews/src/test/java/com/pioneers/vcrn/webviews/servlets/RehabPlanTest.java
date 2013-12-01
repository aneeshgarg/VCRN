package com.pioneers.vcrn.webviews.servlets;

import java.util.Date;

import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.data.RehabPlan;
import com.pioneers.vcrn.data.RehabTemplate;
import com.pioneers.vcrn.response.RehabTemplateResponse;
import com.pioneers.vcrn.webviews.helper.RestHelper;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class RehabPlanTest {
    RehabTemplateResponse response;

    public static void main(String[] args) throws Exception {

        RehabPlanTest test = new RehabPlanTest();
        //test.testGetRehabPlanTemplates();
        //test.testSaveRehabPlan();
        test.testUpdateRehabPlan();

    }

    private void testUpdateRehabPlan() throws Exception {
        Patient patient = (Patient) new RestHelper().callRestService("/facade/getpatientinfo/1", "GET", null, Patient.class);
        RehabPlan plan = patient.getRehabPlan();
        plan.setUpdateDate(new Date(System.currentTimeMillis()));
        plan.setBmiGoal(1635);
        plan.getExerciseList().get(0).setExerciseName("UpdatedExercise");
        plan.getMedicationList().get(0).setTimeToTake("Thrice in a day");
        
        new RestHelper().callRestService("/facade/updaterehabplan", "POST", plan, RehabPlan.class);
        
    }

    private void testSaveRehabPlan() throws Exception {
        testGetRehabPlanTemplates();
        RehabTemplate template =response.getRehabTemplateList().get(0);
        RehabPlan plan = new RehabPlan();
        plan.setBmiGoal(template.getBmiGoal());
        plan.setCalorieGoal(template.getCalorieGoal());
        plan.setCholestrolGoal(template.getCholestrolGoal());
        plan.setCreateDate(new Date(System.currentTimeMillis()));
        plan.setDoctorId(4);
        plan.setExerciseList(template.getExerciseList());
        plan.setHabp(template.getHabp());
        plan.setHap(template.getHap());
        plan.setLabp(template.getLabp());
        plan.setLap(template.getLap());
        plan.setMedicationList(template.getMedicationList());
        plan.setPatientId(1);
        plan.setSodiumGoal(template.getSodiumGoal());
        plan.setTemplateId(template.getTemplateId());
        plan.setUpdateDate(null);
        new RestHelper().callRestService("/facade/saverehabplan", "POST", plan, RehabPlan.class);
    }

    private void testGetRehabPlanTemplates() throws Exception {
        response = (RehabTemplateResponse) new RestHelper().callRestService("/facade/getrehabtemplates", "GET", null, RehabTemplateResponse.class);
        System.out.println(response.toString());

    }

}
