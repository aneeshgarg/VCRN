package com.pioneers.vcrn.webservices;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.datastore.AccountDatastore;
import com.pioneers.vcrn.request.LoginRequest;

public class AccountService {

    public Account login(LoginRequest request) {
        return new AccountDatastore().login(request);
    }
    
}
