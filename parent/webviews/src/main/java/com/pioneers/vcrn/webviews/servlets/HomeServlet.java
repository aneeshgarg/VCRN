package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.request.LoginRequest;
import com.pioneers.vcrn.webviews.helper.RestHelper;

public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
    	
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setUsername(request.getParameter("username"));
        loginRequest.setPassword(request.getParameter("password"));
        Account account = null;
        try {
            account = (Account) new RestHelper().callRestService("/facade/login", "POST", loginRequest, Account.class);
            System.out.println(account);
            if (account != null)
                System.out.println(account.toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        
        if (account != null) {
        	
        	HttpSession session = request.getSession();
        	
        	if("patient".equals(account.getRole().trim())){
				Patient patient = (Patient) account;
				session.setAttribute("accountBean", account);
			}
        	else if("doctor".equals(account.getRole().trim())){
        		MedicalProfessional doctor = (MedicalProfessional) account;
				session.setAttribute("accountBean", account);
			} 
    		   		
        	request.getRequestDispatcher("home.jsp").forward(request, response);
    		return;
        	/*if("patient".equals(account.getRole().trim())){
        		request.getRequestDispatcher("PatientHome.jsp").forward(request, response);
        		return;
        	}
        	else{
        		request.getRequestDispatcher("MPHome.jsp").forward(request, response);
        		return;
        	}*/
        }
        else 
        	request.setAttribute("errormessage", "Unable to Login!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
    }

}
