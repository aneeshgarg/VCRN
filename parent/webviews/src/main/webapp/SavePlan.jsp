	<%@ page import="com.pioneers.vcrn.data.RehabPlan" %>
	<jsp:useBean id="newPlan" scope="request" class="com.pioneers.vcrn.data.RehabPlan" />
	<jsp:setProperty name="newPlan" property="*"/>
     <% RequestDispatcher rd = getServletContext().getRequestDispatcher("/rehabplan");
     System.out.println(newPlan);
     	rd.forward(request, response);
     %>