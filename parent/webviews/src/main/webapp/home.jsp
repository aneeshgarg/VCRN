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
			<c:choose> 		
				<c:when	 test="${accountBean.getRole().trim() == 'patient'}">
					<div id="menu" class="menu">
							<table style="width:100%">
								<tr>
									<td ><a class="aheader" href="ViewRehabPlan.jsp">View Rehab Plan</a></td>
									<td ><a class="aheader" href="EnterRehabLog.jsp">Enter Daily Log</a></td>
							</tr></table>
					</div>
					</div>
					<center>
					<div id="contentpage" class="contentpage">
						 <div class="wideCenter">You last updated your daily log on 10/15/2013<br />
			      			  <a href="EnterRehabLog.jsp">Update Daily Log</a>
			       			 <br/>
			       			 <br/>
			       			 <br/>
			   			 </div>
					    <div class="wideCenter">
					        <h3>Current Alerts</h3>
					        <table class="centercell">
					            <tr>
					                <td colspan="2">
					                    <strong class="alert">Your cardiologist wants to see you in his office as soon as possible.
					                    </strong>
					                </td>
					            </tr>
					            <tr class="centercell">You haven't logged any exercise in 4 days</tr>
					        </table>
			    		</div>
					</div></center>
				</c:when>
				<c:otherwise>
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
			        			You have ${accountBean.patientList.size()} patient in our system.<br />
			      			  <a href="PatientList.jsp">View Current Patients</a>
			       			 <br/>
			       			 <br/>
			       			 <br/>
			   			 </div>
					    <div class="wideCenter">
					        <h3>Current Alerts</h3>
					        <table class="centercell">
   								<c:forEach var="alert" items="${accountBean.notificationList}">							        
					            <tr>
					                <td class="leftcell">
					                    <strong class="alert">${alert.message}</strong>
					                    <a href="/report?patientid=${alert.patientid}">View Patient Report Card</a>
					                </td>
					            </tr>
					            </c:forEach>
					            <tr>
					            	<td class="leftcell">John Smith has been assigned to you.   <a href="CreateRehabPlan.jsp">Create Rehab Plan</a></td>
					            </tr>
					        </table>
			    		</div>
					</div></center>
				</c:otherwise>
			</c:choose>			
		</div>		
		
		
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
