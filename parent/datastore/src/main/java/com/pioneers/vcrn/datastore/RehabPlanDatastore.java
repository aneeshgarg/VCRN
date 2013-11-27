package com.pioneers.vcrn.datastore;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Exercise;
import com.pioneers.vcrn.data.Medication;
import com.pioneers.vcrn.data.RehabPlan;
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

    public void insertPlan(RehabPlan plan) throws Exception {
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            session.insert("InsertRehabPlan", plan);
            long planId = plan.getPlanId();
            for (Exercise exercise : plan.getExerciseList()) {
                exercise.setPlanId(planId);
                session.insert("InsertExercise", exercise);
            }
            for (Medication medication : plan.getMedicationList()){
                medication.setPlanId(planId);
                session.insert("InsertMedication", medication);
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

    public void updatePlan(RehabPlan plan) throws Exception {
        SqlSession session = null;        
        try {
            session = SqlHelper.getSession();
            session.update("UpdateRehabPlan", plan);
            long planId = plan.getPlanId();
            for (Exercise exercise : plan.getExerciseList()) {
                exercise.setPlanId(planId);
                session.insert("UpdateExercise", exercise);
            }
            for (Medication medication : plan.getMedicationList()){
                medication.setPlanId(planId);
                session.insert("UpdateMedication", medication);
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
