<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- 
 Login page :  Author: Rajini Mamidi
 -->

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
			<div class="logout">Hi ${accountBean.firstName} !!!<a href="logout"><input type="button" style="float:right" value="Logout"/></a></div>
			<a class="currentpage" href="PatientList.jsp">Patients List</a>		
			<div id="menu" class="menu">
					<table style="width:100%">
						<tr>
							<td ><a class="aheader" href="home.jsp">Home</a></td>
							<td ><a class="aheader" href="rehabplan">Create Rehab Plan</a></td>
					</tr></table>
			</div>
		</div>	
		
		<center>
		<div id="contentpage" class="contentpage">
			 <div class="wideCenter">
		    <h3>Current Patients</h3>
		    <table class="wideCenter">
		    	<c:forEach var="ptlist" items="${accountBean.patientList}">							        
					            <tr>
					                    <td class="firstletter">${ptlist.getFirstName()} ${ptlist.lastName}</td>
					                    <c:choose>
					                    	<c:when test="${ptlist.rehabPlan==null}">
					                    		<td><a href="rehabplan?patientId=${ptlist.accountId}">Create Rehab Plan</a></td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<td><a href="ManageRehabPlan.jsp?patientId=${ptlist.accountId}">Manage Rehab Plan</a></td>
					                    	</c:otherwise>
					                    </c:choose>		            					
		            					<td><a href="report?currPatientId=${ptlist.accountId}">View Progress Report</a></td>
		            					<td><a href="ViewRehabLog.jsp?currPatientId=${ptlist.accountId}">View Rehab Log</a></td>					                
					            </tr>
				</c:forEach>		
		    </table>
		        </div>
		</div></center>
	
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
