package com.pioneers.vcrn.webviews.servlets;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.request.LoginRequest;
import com.pioneers.vcrn.webviews.helper.RestHelper;

/**
 * 
 * @author Aneesh Garg
 * @since Dec 1, 2013
 */
public class AccountServiceTest {
    public static void main(String[] args) throws Exception {
        AccountServiceTest test = new AccountServiceTest();
        test.testLoginService();
        test.testGetMPInfo();
        test.testGetPatientInfo();

    }

    private void testLoginService() throws Exception {
        LoginRequest request = new LoginRequest();
        request.setUsername("julie");
        request.setPassword("julie");

        Account account = (Account) new RestHelper().callRestService("/facade/login", "POST", request, Account.class);
        System.out.println(account.toString());

    }

    private void testGetPatientInfo() throws Exception {

        Patient patient = (Patient) new RestHelper().callRestService("/facade/getpatientinfo/1", "GET", null, Patient.class);
        System.out.println(patient.toString());

    }

    private void testGetMPInfo() throws Exception {

        MedicalProfessional mp = (MedicalProfessional) new RestHelper().callRestService("/facade/getmpinfo/4", "GET", null, MedicalProfessional.class);
        System.out.println(mp.toString());

    }

}
