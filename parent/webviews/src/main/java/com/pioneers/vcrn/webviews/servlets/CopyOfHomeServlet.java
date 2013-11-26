package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pioneers.vcrn.constants.Constant;
import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.request.LoginRequest;
import com.pioneers.vcrn.webviews.helper.RestHelper;

public class CopyOfHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setUsername(request.getParameter("username"));
        loginRequest.setPassword(request.getParameter("password"));
        
        RestHelper restHelper = new RestHelper();
        Account account = null;
        MedicalProfessional mp =null;
        Patient patient = null;
        try {
            account = (Account) restHelper.callRestService("/facade/login", "POST", loginRequest, Account.class);
            if (account != null) {
                if (Constant.MP_ROLE.equals(account.getRole())) {
                    mp = (MedicalProfessional) restHelper.callRestService("/facade/getmpinfo/"+account.getAccountId(), "GET", null, MedicalProfessional.class);
                    if (mp!= null)
                        System.out.println(mp.toString());
                    account = mp;
                }
                else if (Constant.PATIENT_ROLE.equals(account.getRole())) {
                    patient = (Patient) restHelper.callRestService("/facade/getpatientinfo/"+account.getAccountId(), "GET", null, Patient.class);
                    if (patient!= null)
                        System.out.println(patient.toString());
                    account = patient;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        
        if (account != null) {
            request.setAttribute("account", account);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
        else 
            request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
