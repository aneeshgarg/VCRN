<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!--  Login page :  Author: Rajini Mamidi -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/vcrn.css" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<title>Virtual Cardiac Rehabilitation Nurse - View Rehab Plan</title>
</head>

<body class="page">

	<div id="logincanvas">
		<div id="PageHeader" class="pageheader">
			<jsp:include page="pageheader.jsp" />
			<div class="logout">
				Hi ${accountBean.firstName} !!!<a href="logout"><input
					type="button" style="float: right" value="Logout" /></a>
			</div>
			<a class="currentpage" href="ViewRehabPlan.jsp">View Rehab Plan</a>

			<div id="menu" class="menu">
				<table style="width: 100%">
					<tr>
						<td><a class="aheader" href="home.jsp">Home</a></td>
						<td><a class="aheader" href="ViewRehabLog.jsp">View Rehab
								Log</a></td>
					</tr>
				</table>
			</div>
		</div>
		<center>
			<div id="contentpage" class="contentpage">
				<c:if test="${message != null}">
					<center>
						<div class="wideCenter">
							<h3>
								<strong>${message}</strong>
							</h3>
						</div>
					</center>
				</c:if>
				<div class="wideCenter">
				<c:choose>
				<c:when test="${accountBean.rehabPlan.exerciseList!=null}">
					<div style="float: left; text-align: right; width: 50%">
						<center>
							<table>
								<tr>
									<td style="text-align: center"><strong>Vitals</strong></td>
								</tr>
								<tr>
									<td style="text-align: right">Lowest Acceptable Pulse:</td>
									<td style="text-align: left">${accountBean.rehabPlan.lap}</td>
								</tr>
								<tr>
									<td style="text-align: right">Highest Acceptable Pulse:</td>
									<td style="text-align: left">${accountBean.rehabPlan.hap}</td>
								</tr>
								<tr>
									<td style="text-align: right">Lowest Acceptable Blood
										Pressure:</td>
									<td style="text-align: left">${accountBean.rehabPlan.labp}</td>
								</tr>
								<tr>
									<td style="text-align: right">Highest Acceptable Blood
										Pressure:</td>
									<td style="text-align: left">${accountBean.rehabPlan.habp}</td>
								</tr>
							</table>
						</center>
					</div>

					<div style="float: right; text-align: left; width: 50%">
						<center>
							<table>
								<tr>
									<td style="text-align: center"><strong>Diet</strong></td>
								</tr>
								<tr>
									<td style="text-align: right">Calorie Goal:</td>
									<td style="text-align: left">${accountBean.rehabPlan.calorieGoal}</td>
								</tr>
								<tr>
									<td style="text-align: right">Fat Goal:</td>
									<td style="text-align: left">${accountBean.rehabPlan.bmiGoal}</td>
								</tr>
								<tr>
									<td style="text-align: right">Sodium Goal:</td>
									<td style="text-align: left">${accountBean.rehabPlan.sodiumGoal}</td>
								</tr>
								<tr>
									<td style="text-align: right">Cholesterol Goal:</td>
									<td style="text-align: left">${accountBean.rehabPlan.cholestrolGoal}</td>
								</tr>
							</table>
						</center>
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
					</c:when>
					<c:otherwise>
					<h3>Rehab Plan is not created yet</h3>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</center>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
