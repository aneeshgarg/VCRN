package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pioneers.vcrn.constants.Constant;
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
        	
        	if(Constant.PATIENT_ROLE.equals(account.getRole().trim())){
				Patient currpatient = new Patient();
				
				try {
		            currpatient = (Patient) new RestHelper().callRestService("/facade/getpatientinfo/"+account.getAccountId(), "GET", null, Patient.class);
		            if (currpatient != null)
		                System.out.println(currpatient.toString());
		            else{
		            	request.setAttribute("errormessage", "Unable to get Patients!");
		                request.getRequestDispatcher("index.jsp").forward(request, response);
		                return;
		            }
		        } catch (Exception e) {
		            System.out.println(e.getMessage());
		            e.printStackTrace();
		        }
				
				session.setAttribute("accountBean", currpatient);
			}
        	else if(Constant.MP_ROLE.equals(account.getRole().trim())){
        		
        		MedicalProfessional currDoctor = new MedicalProfessional();
        		
        		try {
        			currDoctor = (MedicalProfessional) new RestHelper().callRestService("/facade/getmpinfo/"+account.getAccountId(), "GET", null, MedicalProfessional.class);
		            if (currDoctor != null)
		                System.out.println(currDoctor.toString());
		            else{
		            	request.setAttribute("errormessage", "Unable to get Medical Professional!");
		                request.getRequestDispatcher("index.jsp").forward(request, response);
		                return;
		            }
		        } catch (Exception e) {
		            System.out.println(e.getMessage());
		            e.printStackTrace();
		        }
        		
				session.setAttribute("accountBean", currDoctor);
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
