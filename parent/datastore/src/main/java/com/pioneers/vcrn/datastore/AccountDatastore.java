package com.pioneers.vcrn.datastore;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.datastore.helper.SqlHelper;
import com.pioneers.vcrn.request.LoginRequest;

public class AccountDatastore {

    public Account getAccountInfo(LoginRequest request) {
        Account account = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            account = (Account) session.selectOne("Login", request);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        } 
        return account;
    }

    public MedicalProfessional getMedicalProfessionalInfo(long accountId) {
        MedicalProfessional mp = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            mp = (MedicalProfessional) session.selectOne("GetMedicalProfessionalAccount", accountId);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        } 
        return mp;
    }

    public Patient getPatientInfo(long accountId) {
        Patient patient = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            patient = (Patient) session.selectOne("GetPatientAccount", accountId);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        } 
        return patient;
    }

}
