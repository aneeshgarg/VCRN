package com.pioneers.vcrn.datastore;

import org.apache.ibatis.session.SqlSession;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.datastore.helper.SqlHelper;
import com.pioneers.vcrn.request.LoginRequest;

public class AccountDatastore {

    public Account getAccountInfo(LoginRequest request) throws Exception {
        Account account = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            account = (Account) session.selectOne("GetAccountInfoByUsernamePassword", request);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null)
                session.close();
        } 
        return account;
    }

    public Account getAccountInfo(long accountId) throws Exception {
        Account account = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            account = (Account) session.selectOne("GetAccountInfoById", accountId);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null)
                session.close();
        } 
        return account;
    }

    public MedicalProfessional getMedicalProfessionalInfo(long accountId) throws Exception {
        MedicalProfessional mp = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            mp = (MedicalProfessional) session.selectOne("GetMedicalProfessionalAccount", accountId);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null)
                session.close();
        } 
        return mp;
    }

    public Patient getPatientInfo(long accountId) throws Exception {
        Patient patient = null;
        SqlSession session = null;
        
        try {
            session = SqlHelper.getSession();
            patient = (Patient) session.selectOne("GetPatientAccount", accountId);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null)
                session.close();
        } 
        return patient;
    }

}
