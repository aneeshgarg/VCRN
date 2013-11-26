package com.pioneers.vcrn.webservices;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.datastore.AccountDatastore;
import com.pioneers.vcrn.request.LoginRequest;

public class AccountService {

    public Account login(LoginRequest request) throws Exception {
        AccountDatastore store = new AccountDatastore();
        Account account = store.getAccountInfo(request);
        return account;
    }
    
    public MedicalProfessional getMPInfo(long accountId) throws Exception {
        System.out.println("getMPInfo::: "+accountId);
        return new AccountDatastore().getMedicalProfessionalInfo(accountId);
    }

    public Patient getPatientInfo(long accountId) throws Exception {
        System.out.println("GetPatientInfo::: "+accountId);
        return new AccountDatastore().getPatientInfo(accountId);
    }
    
}
