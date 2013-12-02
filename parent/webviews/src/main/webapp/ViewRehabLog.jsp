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
			<a class="currentpage" href="ViewRehabLog.jsp">View Rehab Log</a>
			<div id="menu" class="menu">
				<table style="width: 100%">
					<tr>
						<td><a class="aheader" href="home.jsp">Home</a></td>
						<td><a class="aheader" href="ViewRehabPlan.jsp">View
								Rehab Plan</a></td>
					</tr>
				</table>
			</div>
		</div>
		<center>
			<c:if test="${message != null}">
				<center>
					<div class="wideCenter">
						<h3>
							<strong>${message}</strong>
						</h3>
					</div>
				</center>
			</c:if>
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
										<td style="text-align: left">${accountBean.lastLog.pulse}</td>
									</tr>
									<tr>
										<td style="text-align: right">Blood Pressure:</td>
										<td style="text-align: left">${accountBean.lastLog.bloodPressure}</td>
									</tr>
									<tr>
										<td style="text-align: right">Weight:</td>
										<td style="text-align: left">${accountBean.lastLog.weight}</td>
									</tr>
									<tr>
										<td style="text-align: right">Exercise done:</td>
										<td style="text-align: left">${accountBean.lastLog.exerciseDone==true?'YES':'NO'}</td>
									</tr>
									<tr>
										<td style="text-align: right">Medicine Taken:</td>
										<td style="text-align: left">${accountBean.lastLog.medicineTaken==true?'YES':'NO'}</td>
									</tr>
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
								<c:forEach var="diet" items="${accountBean.lastLog.dietList}">
									<tr>
										<td style="text-align: center; width: 200px;">${diet.foodName}</td>
										<td style="text-align: center; width: 200px;">${diet.calories}</td>
										<td style="text-align: center; width: 200px;">${diet.sodium}</td>
										<td style="text-align: center; width: 200px;">${diet.cholestrol}</td>
										<td style="text-align: center; width: 200px;">${diet.fat}</td>
									</tr>
								</c:forEach>
							</table>
						</center>
					</div>
				</div>
			</div>
		</center>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
