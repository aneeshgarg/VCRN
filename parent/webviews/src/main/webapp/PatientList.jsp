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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<title>Virtual Cardiac Rehabilitation Nurse - Login</title>
	<script type="text/javascript">
		function selectPatient() {
			var pat = $('#patientRadio');
			<% request.setAttribute("selectedPatient","$('#patientRadio').val");%>
		}
	</script>
</head>

<body class="page">

	<div id="logincanvas">
		<div id="PageHeader" class="pageheader">
			<jsp:include page="pageheader.jsp"/>	
			<div class="logout">Hi ${accountBean.firstName} !!!<a href="Login.jsp"><input type="button" style="float:right" value="Logout"/></a></div>
			<a class="currentpage" href="PatientList.jsp">Patients List</a>		
			<div id="menu" class="menu">
					<table style="width:100%">
						<tr>
							<td ><a class="aheader" href="home.jsp">Home</a></td>
							<td ><a class="aheader" href="CreateRehabPlan.jsp">Create Rehab Plan</a></td>
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
		            					<td><a href="ManageRehabPlan.jsp">Manage Rehab Plan</a></td>
		            					<td><a href="ReportCard.jsp?patient=${ptlist}">View Report Card</a></td>					                
					            </tr>
				</c:forEach>		
		    </table>
		    <center>
		    <form action ="ManageRehabPlan.jsp" method="post">
		   		 <table>
		    		<c:forEach var="ptlist" items="${accountBean.patientList}" >	
		    			<tr>
		    				<td><input type="radio" name="patientRadio" id="patientRadio" value="${ptlist}"/></td>
		    				<td class="firstletter">${ptlist.getFirstName()} ${ptlist.lastName}</td>
		    			</tr>
		   			 </c:forEach>
		   		 </table>
		   		 <input type="submit" name="updatepage">Manage Rehab Plan</input>
		   		 <a href="ReportCard.jsp">View Report Card</a>
		    </form>
		    </center>
		        </div>
		</div></center>
	
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
