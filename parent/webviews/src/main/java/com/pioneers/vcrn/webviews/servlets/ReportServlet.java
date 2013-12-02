package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;

/**
 * Servlet implementation class ReportServlet
 */
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReportServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String patientId = request.getParameter("patientId");
		System.out.println("the report for patient "+patientId);
		HttpSession session = request.getSession();
		if(patientId==null){
			Patient patient = (Patient) session.getAttribute("accountBean");
			request.setAttribute("currPat",patient);
		}else{
			MedicalProfessional medProf = (MedicalProfessional)session.getAttribute("accountBean");
			List<Patient> patientList = medProf.getPatientList();
   			long patId = Long.valueOf(patientId);
   			Patient currPat=null;
    		for(Patient p:patientList){
    			if(patId==p.getAccountId()){
    				currPat=p;
    			}
    		}
    		request.setAttribute("currPat",currPat);			
		}
		request.getRequestDispatcher("ReportCard.jsp").forward(request, response);
	}

}
