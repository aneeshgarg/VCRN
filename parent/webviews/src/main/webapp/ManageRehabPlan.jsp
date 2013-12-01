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
	<title>Virtual Cardiac Rehabilitation Nurse - Manage Rehab Plan</title>
</head>

<body class="page">

	<div id="logincanvas">
		<div id="PageHeader" class="pageheader">
			<jsp:include page="pageheader.jsp"/>	
			<div class="logout">Hi ${accountBean.firstName} !!!<a href="logout"><input type="button" style="float:right" value="Logout"/></a></div>
			<a class="currentpage" href="ManageRehabPlan.jsp">Manage Rehab Plan</a>	
			
					<div id="menu" class="menu">
						<table style="width:100%">
								<tr>
									<td ><a class="aheader" href="home.jsp">Home</a></td>
									<td ><a class="aheader" href="PatientList.jsp">View Patient List</a></td>		
									<td ><a class="aheader" href="rehabplan">Create Rehab Plan</a></td>								
								</tr></table>
					</div>
		</div>
					<center>
					<div id="contentpage" class="contentpage">
						<c:if test="${message != null}">
						 <center>
						 <div class="wideCenter">
					        <h3><strong >${message}</strong></h3>
			    		</div>
			    		</center>
			    		</c:if>
			    		<form action="UpdatePlan.jsp" method="post">
							    <div class="wideCenter">
							    	<h3>Update Rehab Plan For Patient ${patientRadio.firstName} ${currPatient.lastName}</h3>
									 			
							        <div style="float: left; text-align: right; width: 50%">
							        	<center>
				
							            <table >
							                <tr>
							                    <td style="text-align:center"><strong>Vitals</strong></td>
							                </tr>
							                <tr >
							                    <td style="text-align:right">Lowest Acceptable Pulse: </td>
							                    <td style="text-align:left"><input name="lap" type="text" style="width: 50px" id="labp" value="${selectedPatient.rehabPlan.lap}"/></td>	
							                </tr>
							                <tr >
							                    <td style="text-align:right">Highest Acceptable Pulse:</td>
							                    <td style="text-align:left"><input name="hap" type="text" style="width: 50px" value="${plantemplate.hap}"/></td>
							                </tr>
							                <tr>
							                    <td style="text-align:right">Lowest Acceptable Blood Pressure:</td>
							                    <td style="text-align:left"> <input name="labp" type="text" style="width: 50px" value="${plantemplate.labp}" /></td>
							                </tr>
							                <tr >
							                    <td style="text-align:right">Highest Acceptable Blood Pressure:</td>
							                    <td style="text-align:left"> <input name="habp" type="text" style="width: 50px" value="${plantemplate.habp}"/></td>
							                </tr>
							            </table>
							            </center>
							        </div>
							
							        <div style="float: right; text-align: left; width: 50%">
							        	<center>
							            <table >
							                <tr>
							                    <td style="text-align:center"><strong>Diet</strong></td>
							                </tr>			
							                <tr>
							                    <td style="text-align:right">Calorie Goal:</td>
							                    <td style="text-align:left"><input name="calorieGoal" type="text" style="width: 50px" value="${plantemplate.calorieGoal}"/></td>
							                </tr>
							                <tr>
							                    <td style="text-align:right">Fat Goal:</td>
							                    <td style="text-align:left"><input name="bmiGoal" type="text" style="width: 50px" value="${plantemplate.bmiGoal}"/></td>
							                </tr>
							                <tr>
							                    <td style="text-align:right">Sodium Goal:</td>
							                    <td style="text-align:left"><input name="sodiumGoal" type="text" style="width: 50px" value="${plantemplate.sodiumGoal}"/></td>
							                </tr>
							                <tr>
							                    <td style="text-align:right">Cholesterol Goal:</td>
							                    <td style="text-align:left"><input name="cholestrolGoal" type="text" style="width: 50px" value="${plantemplate.cholestrolGoal}"/></td>
							                </tr>
							            </table>
							        </div>
							        <div class="clear-fix"></div>
							        <div class="wideCenter">
							            <h3>Exercise</h3>
							            <center>
							            <table id=exercise>
							                <tr>
							                    <th style="text-align: center;">Exercise Name</th>
							                    <th style="text-align: center;">Time To Spend</th>
							                    <th style="text-align: center;">Weight</th>
							                    <th style="text-align: center;">Repetitions</th>
							                </tr>
							                <c:if test="${plantemplate.exerciseList!=null}">
							                <c:forEach var="exercise" items="${plantemplate.exerciseList}" varStatus="status" >
							                <tr>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="excerciseName${status.count}" type="text" style="width: 150px" value="${exercise.exerciseName}"/></td>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="timeToSpend${status.count}" type="text" style="width: 150px" value="${exercise.timeToSpend}"/></td>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="weight${status.count}" type="text" style="width: 150px" value="${exercise.weight}"/></td>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="repetitions${status.count}" type="text" style="width: 150px" value="${exercise.repetitions}"/></td>
							                </tr>
							                </c:forEach>
							                </c:if>
							                <c:if test="${plantemplate.exerciseList==null}">
							                	<tr>
							                		<td style="text-align: center; width: 200px;">
							                		<input name="excerciseName1" type="text" style="width: 150px" /></td>
							                		<td style="text-align: center; width: 200px;">
							                		<input name="timeToSpend1" type="text" style="width: 150px" /></td>
							                		<td style="text-align: center; width: 200px;">
							                		<input name="weight1" type="text" style="width: 150px" /></td>
							                		<td style="text-align: center; width: 200px;">
							                		<input name="repetitions1" type="text" style="width: 150px" /></td></tr>
							                </c:if>
							            </table></center>
							            <input type="button" value="Add New Exercise" onClick="addExercise()" />
							        </div>
							
							        <div class="wideCenter">
							            <h3>Medicine</h3>
							            <center>
							            <table id="medicine">
							                <tr>
							                    <th style="text-align: center;">Medicine Name</th>
							                    <th style="text-align: center;">Time To Take</th>
							                    <th style="text-align: center;">Dosage</th>
							                    <th style="text-align: center;">Type</th>
							                </tr>
							                <c:if test="${plantemplate.medicationList!=null}">
							                <c:forEach var="medic" items="${plantemplate.medicationList}" varStatus="status">
							                <tr>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="medicineName${status.count}" type="text" style="width: 150px" value="${medic.medicineName}"/></td>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="timeToTake${status.count}" type="text" style="width: 150px" value="${medic.timeToTake}"/></td>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="dosage${status.count}" type="text" style="width: 150px" value="${medic.dosage}"/></td>
							                    <td style="text-align: center; width: 200px;">
							                        <input name="type${status.count}" type="text" style="width: 150px" value="${medic.type}"/></td>
							                </tr>
							                </c:forEach>
							                </c:if>
							                <c:if test="${plantemplate.medicationList==null}">
							               		 <tr>
							               		 	<td style="text-align: center; width: 200px;">
							               		 	<input name="medicineName1" type="text" style="width: 150px" /></td>
							               		 	<td style="text-align: center; width: 200px;">
							               		 	<input name="timeToTake1" type="text" style="width: 150px" /></td>
							               		 	<td style="text-align: center; width: 200px;">
							               		 	<input name="dosage1" type="text" style="width: 150px" /></td>
							               		 	<td style="text-align: center; width: 200px;">
							               		 	<input name="type1" type="text" style="width: 150px" /></td>
							               		 </tr>
							                </c:if>
							            </table></center>
							            <input type="button" value="Add New Medicine" onClick="addMedicine()"/>
							        </div>
							
							        <br />
							        <input type="hidden" name="doctorId" value="${accountBean.accountId}">	
							        <input type="submit" value="Save Plan" />
								
							    </div>
							  </form> 
							 
						</div></center>	
					</div>
					</center>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>