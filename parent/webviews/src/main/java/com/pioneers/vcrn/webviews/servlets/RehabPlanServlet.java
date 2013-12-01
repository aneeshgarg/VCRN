package com.pioneers.vcrn.webviews.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.RehabPlan;
import com.pioneers.vcrn.data.RehabTemplate;
import com.pioneers.vcrn.request.RehabLogRequest;
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

	protected Boolean checkPatientsWNPlans(MedicalProfessional currDoctor){
		for(int i=0;i<currDoctor.getPatientList().size();i++){
			if(currDoctor.getPatientList().get(i).getRehabPlan()== null){
				return true;
			}
		}
		return false;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		Boolean patientsNoPlan = false;
		HttpSession session = request.getSession();
		MedicalProfessional currDoctor = (MedicalProfessional) session.getAttribute("accountBean");
		
		patientsNoPlan = checkPatientsWNPlans(currDoctor);
			
			if(patientsNoPlan){				
				System.out.println("There are patients with no plans");				
				if(request.getAttribute("newPlan") == null){					
					System.out.println("No new plan sent");					
					if (request.getParameter("selectedTemplate") == null){
						System.out.println("A template is not selected");
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
							
							session.setAttribute("templateBean", templates);
							//System.out.println("hello firsts");
							request.getRequestDispatcher("CreateRehabPlan.jsp").forward(request, response);
					        return;
						
					}	
					else if (request.getParameter("selectedTemplate") != null){
						System.out.println("A template is selected");
						String myObjectid = request.getParameter("selectedTemplate");
						RehabTemplateResponse templates = (RehabTemplateResponse) request.getSession().getAttribute("templateBean");
						for(RehabTemplate template:templates.getRehabTemplateList()){
							if(template.getPlanName().equals(myObjectid)){
								request.setAttribute("plantemplate", template);	
							}	
						}			
						request.getRequestDispatcher("CreateRehabPlan.jsp").forward(request, response);
				        return;
					}
				}
				else if(request.getAttribute("newPlan") != null){
					System.out.println("A new Plan is sent to be saved");
					RehabPlan newPlan = (RehabPlan) request.getAttribute("newPlan");
					System.out.println(request.getAttribute("newPlan"));
					//System.out.println(rehabreq.getPlan());
					try {
	        			RestHelper savePlan = new RestHelper();
	        			savePlan.callRestService("/facade/saverehabplan", "POST", newPlan, RehabPlan.class);
			        } catch (Exception e) {
			            System.out.println(e.getMessage());
			            e.printStackTrace();
			        }
					
					try {
	        			currDoctor = (MedicalProfessional) new RestHelper().callRestService("/facade/getmpinfo/"+currDoctor.getAccountId(), "GET", null, MedicalProfessional.class);
			        } catch (Exception e) {
			            System.out.println(e.getMessage());
			            e.printStackTrace();
			        }
	        		
					session.setAttribute("accountBean", currDoctor);
					request.setAttribute("message", "Plan Created! Continue to Modify Plan!");
					request.getRequestDispatcher("ManageRehabPlan.jsp").forward(request, response);
			        return;
				}
			}
			else if(!patientsNoPlan){
				System.out.println("no patients with no plans");
				session.setAttribute("message", "No Patients without Rehab Plans!!!");
				request.getRequestDispatcher("CreateRehabPlan.jsp").forward(request, response);
		        return;
			}
	}

}
