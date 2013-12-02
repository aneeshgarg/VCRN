package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.data.RehabLog;
import com.pioneers.vcrn.request.RehabLogRequest;
import com.pioneers.vcrn.webviews.helper.RestHelper;

/**
 * Servlet implementation class RehabLogServlet
 */
public class RehabLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RehabLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RehabLog rehabLog = (RehabLog) request.getAttribute("newLog");
		if (rehabLog != null) {
			Patient patient = (Patient) session.getAttribute("accountBean");
			RehabLogRequest logRequest = new RehabLogRequest();
			logRequest.setLog(rehabLog);
			logRequest.setDoctorId(patient.getDoctor().getAccountId());
			logRequest.setPlan(patient.getRehabPlan());
			System.out.println("Rehab log is "+rehabLog);
			try {
				RestHelper saveRehabLog = new RestHelper();
				saveRehabLog.callRestService("/facade/savelog", "POST",
						logRequest, RehabLogRequest.class);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

			try {
				patient = (Patient) new RestHelper()
						.callRestService("/facade/getpatientinfo/"+patient.getAccountId(), "GET",
								null, Patient.class);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			session.setAttribute("accountBean", patient);
			request.setAttribute("message",	"Rehab Log Created!");
			request.setAttribute("message",	"Rehab Log Created!");
			request.getRequestDispatcher("ViewRehabLog.jsp").forward(
					request, response);
			return;
		}
	}

}
