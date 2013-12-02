<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

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
			<jsp:include page="pageheader.jsp" />
			<div class="logout">
				Hi ${accountBean.firstName} !!!<a href="logout"><input
					type="button" style="float: right" value="Logout" /></a>
			</div>
			<a class="currentpage" href="ViewRehabLog.jsp">Create Rehab Log</a>
			<div id="menu" class="menu">
				<table style="width: 100%">
					<tr>
						<td><a class="aheader" href="home.jsp">Home</a></td>
						<td><a class="aheader" href="ViewRehabPlan.jsp">View
								Rehab Plan</a></td>
						<td><a class="aheader" href="ViewRehabLog.jsp">View Rehab
								Log</a></td>
						<td><a class="aheader" href="report">View Progress Report</a></td>
					</tr>
				</table>
			</div>
		</div>
		<form action="SaveRehabLog.jsp" method="post">
			<center>
				<div id="contentpage" class="contentpage">
					<div class="wideCenter">

						<div class="wideCenter">
							<h3>Rehab Log For ${accountBean.firstName}
								${accountBean.lastName}</h3>

							<div>
								<center>

									<table>
										<tr>
											<td style="text-align: center"><strong>Rehab
													Data</strong></td>
										</tr>
										<tr>
											<td style="text-align: right">Pulse:</td>
											<td style="text-align: left"><input name="pulse"
												type="text" style="width: 50px" id="pulse"
												value="${accountBean.rehabPlan.lap}" required/></td>
										</tr>
										<tr>
											<td style="text-align: right">Blood Pressure:</td>
											<td style="text-align: left"><input name="bloodPressure"
												type="text" style="width: 50px"
												value="${accountBean.rehabPlan.labp}" required/></td>
										</tr>
										<tr>
											<td style="text-align: right">Weight:</td>
											<td style="text-align: left"><input name="weight"
												type="text" style="width: 50px"
												value="${accountBean.healthData.weight}" required/></td>
										</tr>
										<tr>
											<td style="text-align: right">Exercise done:</td>
											<td style="text-align: left"><input name="exerciseDone"
												type="checkbox" style="width: 50px" /></td>
										</tr>
										<tr>
											<td style="text-align: right">Medicine Taken:</td>
											<td style="text-align: left"><input name="medicineTaken"
												type="checkbox" style="width: 50px" /></td>
										</tr>
									</table>
								</center>
							</div>
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
										<c:if test="${accountBean.rehabPlan.exerciseList!=null}">
											<c:forEach var="exercise"
												items="${accountBean.rehabPlan.exerciseList}"
												varStatus="status">
												<tr>
													<td style="text-align: center; width: 200px;">${exercise.exerciseName}</td>
													<td style="text-align: center; width: 200px;">${exercise.timeToSpend}</td>
													<td style="text-align: center; width: 200px;">${exercise.weight}</td>
													<td style="text-align: center; width: 200px;">${exercise.repetitions}</td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</center>
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
										<c:if test="${accountBean.rehabPlan.medicationList!=null}">
											<c:forEach var="medic"
												items="${accountBean.rehabPlan.medicationList}"
												varStatus="status">
												<tr>
													<td style="text-align: center; width: 200px;">${medic.medicineName}</td>
													<td style="text-align: center; width: 200px;">${medic.timeToTake}</td>
													<td style="text-align: center; width: 200px;">${medic.dosage}</td>
													<td style="text-align: center; width: 200px;">${medic.type}</td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</center>
							</div>
						</div>
						<div class="clear-fix"></div>
						<div class="wideCenter">
							<h3>Diet</h3>
							<center>
								<table id=dietTable>
									<tr>
										<th style="text-align: center;">Food Name</th>
										<th style="text-align: center;">Calories</th>
										<th style="text-align: center;">Sodium</th>
										<th style="text-align: center;">Cholestrol</th>
										<th style="text-align: center;">Fat</th>
									</tr>
									<tr>
										<td style="text-align: center; width: 200px;"><input
											name="foodName1" type="text" style="width: 150px" required/></td>
										<td style="text-align: center; width: 200px;"><input
											name="calories1" type="text" style="width: 150px" value="${accountBean.rehabPlan.calorieGoal}" required/></td>
										<td style="text-align: center; width: 200px;"><input
											name="sodium1" type="text" style="width: 150px" value="${accountBean.rehabPlan.sodiumGoal}" required/></td>
										<td style="text-align: center; width: 200px;"><input
											name="cholestrol1" type="text" style="width: 150px" value="${accountBean.rehabPlan.cholestrolGoal}" required/></td>
										<td style="text-align: center; width: 200px;"><input
											name="fat1" type="text" style="width: 150px" value="${accountBean.rehabPlan.bmiGoal}" required/></td>
									</tr>
								</table>
							</center>
						</div>
						<br /> 
						<input type="hidden" name="patientId" value="${accountBean.accountId}"> 
						<input type="hidden" name="planId" value="${accountBean.rehabPlan.planId}"> 
						<input type="hidden" name="patientId" value="${accountBean.accountId}">
						<input type="submit" value="Save Rehab Log" />
					</div>
				</div>
			</center>
		</form>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
