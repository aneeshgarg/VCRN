<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!--  Login page :  Author: Rajini Mamidi -->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/vcrn.css" type="text/css" />
	<title>Virtual Cardiac Rehabilitation Nurse - Login</title>
</head>

<body class="page">

	<div id="logincanvas">
		<div id="PageHeader" class="pageheader">
			<jsp:include page="pageheader.jsp"/>	
			<div class="logout">Logged in as ${accountBean.username}. &nbsp; &nbsp; <a href="logout"><input type="button" style="float:right" value="Logout"/></a></div>
			<a class="currentpage" href="home.jsp">Home</a>	
						<div id="menu" class="menu">
							<table style="width:100%">
								<tr>
									<td ><a class="aheader" href="PatientList.jsp">View Patient List</a></td>
									<td ><a class="aheader" href="ViewPatientLog.jsp">Create Rehab Plan Template</a></td>
							</tr></table>
						</div>
			</div>
								<center>
					<div id="contentpage" class="contentpage">
						 <div class="wideCenter">
			        			You have 4 patient in our system.<br />
			      			  <a href="PatientList.jsp">View Current Patients</a>
			       			 <br/>
			       			 <br/>
			       			 <br/>
			   			 </div>
					    <div class="wideCenter">
					        <h3>Current Alerts</h3>
					        <table class="centercell">
					        	<c:forEach var="alert" items="${alertBean}">							        
					            <tr>
					                <td class="leftcell">
					                    <strong class="alert">${alert.message}</strong>
					                    <a href="/report?pateintid=${alert.patientid}">View Patient Report Card</a>
					                </td>
					            </tr>
					            </c:forEach>
					            <tr>
					            	<td class="leftcell">John Smith has been assigned to you.   <a href="CreateRehabPlan.jsp">Create Rehab Plan</a></td>
					            </tr>
					        </table>
			    		</div>
					</div></center>		
		</div>			
		
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
