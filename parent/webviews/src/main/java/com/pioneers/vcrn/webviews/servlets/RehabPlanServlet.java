package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.response.RehabTemplateResponse;
import com.pioneers.vcrn.webviews.helper.RestHelper;

public class RehabPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RehabPlanServlet() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("selectedTemplate") == null){
			
				RehabTemplateResponse templates = new RehabTemplateResponse();
				
				try {
					templates = (RehabTemplateResponse) new RestHelper().callRestService("/facade/getrehabtemplates", "GET", null, RehabTemplateResponse.class);
		            if (templates != null)
		                System.out.println(templates.toString());
		            else{
		            	request.setAttribute("errormessage", "Unable to get Rehab Plan Templates!");
		            	request.getRequestDispatcher("CreateRehabPlan.jsp").forward(request, response);
		                return;
		            }
		        } catch (Exception e) {
		            System.out.println(e.getMessage());
		            e.printStackTrace();
		        }
				
				HttpSession session = request.getSession();
				session.setAttribute("templateBean", templates);
				
				request.getRequestDispatcher("CreateRehabPlan.jsp").forward(request, response);
		        return;
		}
		else{
			
		}
	}

}
