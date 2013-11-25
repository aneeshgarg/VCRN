package com.pioneers.vcrn.webservices;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.datastore.AccountDatastore;
import com.pioneers.vcrn.request.LoginRequest;

public class AccountService {

    public Account login(LoginRequest request) {
        AccountDatastore store = new AccountDatastore();
        Account account = store.getAccountInfo(request);
        return account;
    }
    
    public MedicalProfessional getMPInfo(long accountId) {
        return new AccountDatastore().getMedicalProfessionalInfo(accountId);
    }

    public Patient getPatientInfo(long accountId) {
        return new AccountDatastore().getPatientInfo(accountId);
    }
    
}
