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
			<div class="logout">Hi ${accountBean.firstName} !!!<a href="login"><input type="button" style="float:right" value="Logout"/></a></div>
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
			  Select Rehab Plan Template To Use: 	<select class="firstletter" name="selectedTemplate">
			  											<option value="">Select Template</option>
													  	<c:forEach var="template" items="${templateBean.rehabTemplateList}">
							           					 <option value="${template.planName}">${template.planName}</option>
							       						 </c:forEach>
													  </select>
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
			                    <td style="text-align:left"><input type="text" style="width: 50px" /></td>	
			                </tr>
			                <tr >
			                    <td style="text-align:right">Highest Acceptable Pulse:</td>
			                    <td style="text-align:left"><input type="text" style="width: 50px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Lowest Acceptable Blood Pressure:</td>
			                    <td style="text-align:left"> <input type="text" style="width: 50px" /></td>
			                </tr>
			                <tr >
			                    <td style="text-align:right">Highest Acceptable Blood Pressure:</td>
			                    <td style="text-align:left"> <input type="text" style="width: 50px" /></td>
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
			                    <td style="text-align:left"><input type="text" style="width: 50px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Fat Goal:</td>
			                    <td style="text-align:left"><input type="text" style="width: 50px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Sodium Goal:</td>
			                    <td style="text-align:left"><input type="text" style="width: 50px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align:right">Cholesterol Goal:</td>
			                    <td style="text-align:left"><input type="text" style="width: 50px" /></td>
			                </tr>
			            </table>
			        </div>
			        <div class="clear-fix"></div>
			        <div class="wideCenter">
			            <h3>Exercise</h3>
			            <center>
			            <table>
			                <tr>
			                    <th style="text-align: center;">Exercise Name</th>
			                    <th style="text-align: center;">Time To Spend</th>
			                    <th style="text-align: center;">Weight</th>
			                    <th style="text-align: center;">Repetitions</th>
			                </tr>
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                </tr>
			            </table></center>
			            <input type="button" value="Add New Exercise" />
			        </div>
			
			        <div class="wideCenter">
			            <h3>Medicine</h3><center>
			            <table>
			                <tr>
			                    <th style="text-align: center;">Medicine Name</th>
			                    <th style="text-align: center;">Time To Take</th>
			                    <th style="text-align: center;">Dosage</th>
			                    <th style="text-align: center;">Type</th>
			                </tr>
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                </tr>
			                <tr>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                    <td style="text-align: center; width: 200px;">
			                        <input type="text" style="width: 150px" /></td>
			                </tr>
			            </table></center>
			            <input type="button" value="Add New Medicine" />
			        </div>
			
			        <br />
			        <input type="button" value="Save Plan" />
			
			    </div>
		</div></center>
	
		<div class="footer"><p>@ 2013 - Virtual Cardiac Rehabilitation Nurse</p></div>	
	</div>
</body>
</html>
