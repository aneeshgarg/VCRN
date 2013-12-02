<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.pioneers.vcrn.data.Patient"%>
<%@ page import="com.pioneers.vcrn.data.MedicalProfessional"%>
<%@ page import="java.util.List"%>
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
						<c:choose>
						<c:when test="${(accountBean.role == 'patient')}">
								<td><a class="aheader" href="ViewRehabPlan.jsp">View Rehab Plan</a></td>
								<td><a class="aheader" href="CreateRehabLog.jsp">Create Rehab Log</a></td>
								<td><a class="aheader" href="report">View Progress Report</a></td>
						</c:when>
						<c:otherwise>
							<td><a class="aheader" href="PatientList.jsp">View Patient List</a></td>
								<td><a class="aheader" href="rehabplan">Create Rehab Plan</a></td>
							
						</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</div>
		</div>
		<center>
			<div id="contentpage" class="contentpage">
				<div class="wideCenter">
					<c:if test="${message != null}">
						<center>
							<div class="wideCenter">
								<h3>
									<strong>${message}</strong>
								</h3>
							</div>
						</center>
					</c:if>
					<%
						String patientId = request.getParameter("currPatientId");
						if (patientId == null) {
							Patient patient = (Patient) session.getAttribute("accountBean");
							request.setAttribute("currPat", patient);
						} else {
							MedicalProfessional medProf = (MedicalProfessional) session
									.getAttribute("accountBean");
							List<Patient> patientList = medProf.getPatientList();
							long patId = Long.valueOf(patientId);
							Patient currPat = null;
							for (Patient p : patientList) {
								if (patId == p.getAccountId()) {
									currPat = p;
								}
							}
							request.setAttribute("currPat", currPat);
						}
					%>
					<c:choose>
						<c:when test="${currPat.lastLog!=null}">

							<div class="wideCenter">
								<h3>Rehab Log For ${currPat.firstName} ${currPat.lastName}</h3>
								<div>

									<center>
										<table>
											<tr>
												<td style="text-align: center"><strong>Rehab
														Data</strong></td>
											</tr>
											<tr>
												<td style="text-align: right">Pulse:</td>
												<td style="text-align: left">${currPat.lastLog.pulse}</td>
											</tr>
											<tr>
												<td style="text-align: right">Blood Pressure:</td>
												<td style="text-align: left">${currPat.lastLog.bloodPressure}</td>
											</tr>
											<tr>
												<td style="text-align: right">Weight:</td>
												<td style="text-align: left">${currPat.lastLog.weight}</td>
											</tr>
											<tr>
												<td style="text-align: right">Exercise done:</td>
												<td style="text-align: left">${currPat.lastLog.exerciseDone==true?'YES':'NO'}</td>
											</tr>
											<tr>
												<td style="text-align: right">Medicine Taken:</td>
												<td style="text-align: left">${currPat.lastLog.medicineTaken==true?'YES':'NO'}</td>
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
										<c:forEach var="diet" items="${currPat.lastLog.dietList}">
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
						</c:when>
						<c:otherwise>
							<h3>Rehab Log is not created yet</h3>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</center>

		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
