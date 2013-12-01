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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
	function addMedicine(){
		var newrow = $('<tr><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td></tr>');
		$("#medicine").append($(newrow).html());
	}
	function addExercise(){
		var newrow = $('<tr><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td><td style="text-align: center; width: 200px;"><input type="text" style="width: 150px" /></td></tr>');
		$("#exercise").append($(newrow));
	}
	
	</script>
	<title>Virtual Cardiac Rehabilitation Nurse - Login</title>
</head>

<body class="page">

	<div id="logincanvas">
		<div id="PageHeader" class="pageheader">
			<jsp:include page="pageheader.jsp"/>		
			<div class="logout">Hi ${accountBean.firstName} !!!<a href="logout"><input type="button" style="float:right" value="Logout"/></a></div>
			<a class="currentpage" href="CreateRehabPlan.jsp">Create Rehab Plan</a>		
			<div id="menu" class="menu">
					<table style="width:100%">
						<tr>
							<td ><a class="aheader" href="home.jsp">Home</a></td>
							<td ><a class="aheader" href="PatientList.jsp">View Patient List</a></td>
					</tr></table>
			</div>
		</div>	
			<% if(request.getAttribute("errormessage")!=null){%>
				<strong class="alert"><%=request.getAttribute("errormessage")%></strong>
			<%}%>
		<center>
		<div id="contentpage" class="contentpage">
			
			<form action="rehabplan" method="post">
			  Select Rehab Plan Template To Use: 	<select id="templt" class="firstletter" name="selectedTemplate" onChange="this.form.submit()">
			  											<option value="">Select Template</option>
			  											<c:forEach var="template" items="${templateBean.rehabTemplateList}">
							           					 <option value="${template.planName}" ${template.planName==plantemplate.planName?'selected':'' }>${template.planName}</option>
							      						 </c:forEach>
													  </select>

			 </form>
			 <form action="SavePlan.jsp" method="post">
			    <div class="wideCenter">
			        <h3>Create Rehab Plan For Patient John Smith</h3>
			
			        <div style="float: left; text-align: right; width: 50%">
			        	<center>
			            <table >
			                <tr>
			                    <td style="text-align:center"><strong>Vitals</strong></td>
			                </tr>
			                <tr >
			                    <td style="text-align:right">Lowest Acceptable Pulse: </td>
			                    <td style="text-align:left"><input name="lap" type="text" style="width: 50px" id="labp" value="${plantemplate.lap}"/></td>	
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
			                <c:forEach var="exercise" items="${plantemplate.exerciseList}" >
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="excerciseName" type="text" style="width: 150px" value="${exercise.exerciseName}"/></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="timeToSpend" type="text" style="width: 150px" value="${exercise.timeToSpend}"/></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="weight" type="text" style="width: 150px" value="${exercise.weight}"/></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="repetitions" type="text" style="width: 150px" value="${exercise.repetitions}"/></td>
			                </tr>
			                </c:forEach>
			                </c:if>
			                <c:if test="${plantemplate.exerciseList==null}">
			                	<tr>
			                		<td style="text-align: center; width: 200px;">
			                		<input name="excerciseName" type="text" style="width: 150px" /></td>
			                		<td style="text-align: center; width: 200px;">
			                		<input name="timeToSpend" type="text" style="width: 150px" /></td>
			                		<td style="text-align: center; width: 200px;">
			                		<input name="weight" type="text" style="width: 150px" /></td>
			                		<td style="text-align: center; width: 200px;">
			                		<input name="repetitions" type="text" style="width: 150px" /></td></tr>
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
			                <c:forEach var="medic" items="${plantemplate.medicationList}">
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="medicineName" type="text" style="width: 150px" value="${medic.medicineName}"/></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="timeToTake" type="text" style="width: 150px" value="${medic.timeToTake}"/></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="dosage" type="text" style="width: 150px" value="${medic.dosage}"/></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input name="type" type="text" style="width: 150px" value="${medic.type}"/></td>
			                </tr>
			                </c:forEach>
			                </c:if>
			                <c:if test="${plantemplate.medicationList==null}">
			               		 <tr>
			               		 	<td style="text-align: center; width: 200px;">
			               		 	<input name="medicineName" type="text" style="width: 150px" /></td>
			               		 	<td style="text-align: center; width: 200px;">
			               		 	<input name="timeToTake" type="text" style="width: 150px" /></td>
			               		 	<td style="text-align: center; width: 200px;">
			               		 	<input name="dosage" type="text" style="width: 150px" /></td>
			               		 	<td style="text-align: center; width: 200px;">
			               		 	<input name="type" type="text" style="width: 150px" /></td>
			               		 </tr>
			                </c:if>
			            </table></center>
			            <input type="button" value="Add New Medicine" onClick="addMedicine()"/>
			        </div>
			
			        <br />
			        	
			        <input type="submit" value="Save Plan" />
				
			    </div>
			  </form> 
		</div></center>
	
		<div class="footer"><p>@ 2013 - Virtual Cardiac Rehabilitation Nurse</p></div>	
	</div>
</body>
</html>
