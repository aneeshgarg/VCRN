<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.pioneers.vcrn.data.Patient" %>
<%@ page import="com.pioneers.vcrn.data.MedicalProfessional" %>
<%@ page import="java.util.List" %>
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
				<a class="currentpage" href="ReportCard.jsp">Progress Report</a>		
			<div id="menu" class="menu">
					<table style="width:100%">
						<tr>
							<td ><a class="aheader" href="home.jsp">Home</a></td>
							<td ><a class="aheader" href="PatientList.jsp">Patients List</a></td>
							<td ><a class="aheader" href="CreateRehabPlan.jsp">Create Rehab Plan</a></td>
					</tr></table>
			</div>
		</div>	
		<center>
		<div id="contentpage" class="contentpage">
						   <div class="wideCenter">	   
			        Report card for Patient ${currPat.firstName} ${currPat.lastName} for <%=new java.text.SimpleDateFormat("MM/dd/yyyy").format(new java.util.Date())%><br />
			        <br/><br/>
			        <strong>Overall Score: ${currPat.lastReport.overallScore}</strong>
			
			        <div >
			            <h3>Dietary Goals</h3>
			            <center>
			            <table >
			                <tr>
			                    <td style="text-align:right">Calories:</td>
			                    <td style="text-align:left"><span class="${currPat.lastReport.calories=='Met'?'goalMet':'alert'}">${currPat.lastReport.calories}</span></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Sodium:</td>
			                    <td style="text-align:left"><span class="${currPat.lastReport.sodium=='Met'?'goalMet':'alert'}">${currPat.lastReport.sodium}</span></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Cholesterol:</td>
			                    <td style="text-align:left"><span class="${currPat.lastReport.cholestrol=='Met'?'goalMet':'alert'}">${currPat.lastReport.cholestrol}</span></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Fat:</td>
			                    <td style="text-align:left"><span class="${currPat.lastReport.fat=='Met'?'goalMet':'alert'}">${currPat.lastReport.fat}</span></td>
			                </tr>
			            </table></center>
			        </div>
			        <div>
			            <h3>Exercise Goals</h3>
						<center>
			            <table >
			                <tr>
			                    <td style="text-align:right">Calories Burned:</td>
			                    <td style="text-align:left"><span class="${currPat.lastReport.exercise=='Did Exercise'?'goalMet':'alert'}">${currPat.lastReport.exercise}</span></td>
			                </tr>
			            </table></center>
			        </div>
			        <div>
			            <h3>Medication Goals</h3>
			            <center>
			            <table >
			                <tr>
			                    <td style="text-align:right">Dosage:</td>
			                    <td style="text-align:left"><span class="${currPat.lastReport.medication=='Took Medication'?'goalMet':'alert'}">${currPat.lastReport.medication}</span></td>
			                </tr>
			            </table></center>
			        </div>
        
   				 </div>
		</div></center>
	
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
