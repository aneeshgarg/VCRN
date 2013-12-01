<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.pioneers.vcrn.data.Patient"%>
<%@ page import="com.pioneers.vcrn.data.MedicalProfessional"%>
<%@ page import="java.util.List"%>
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
<script type="text/javascript">
	function selectPatient() {
		var jspcall = "rehabplan?patientId=" + $('#patientId').val();
		window.location.href = jspcall;
	}
</script>
<title>Virtual Cardiac Rehabilitation Nurse</title>
</head>

<body class="page">

	<div id="logincanvas">
		<center>
			<div id="contentpage" class="contentpage">
						<div class="wideCenter">
							<center>
								Select Patient for Rehab Plan: <select id="patientId"
									class="firstletter" name="patientId" onChange="selectPatient()">
									<option value="">Select Patient</option>
									<c:forEach var="patient" items="${accountBean.patientList}"
										varStatus="status">
										<c:if test="${patient.rehabPlan ==null}">
											<option value="${patient.accountId}"
												${patient.accountId==selectedPatID?'selected':'' }>${patient.firstName}
												${patient.lastName}</option>
										</c:if>
									</c:forEach>
								</select>
							</center>
							<c:if test="${currPat!=null }">
								<div id="patientDataDiv" class="wideCenter">
									<center>
										<strong>Patient File Data</strong>
										<table>
											<tr>
												<td style="text-align: right">File ID:</td>
												<td style="text-align: left">${currPat.healthData.fileId}</td>
											</tr>
											<tr>
												<td style="text-align: right">Pulse:</td>
												<td style="text-align: left">${currPat.healthData.pulse}</td>
												<td style="text-align: right">Blood Pressure:</td>
												<td style="text-align: left">${currPat.healthData.bloodPressure}</td>
											</tr>
											<tr>
												<td style="text-align: right">Calorie Index:</td>
												<td style="text-align: left">${currPat.healthData.calorieIndex}</td>
												<td style="text-align: right">Sodium Consumption:</td>
												<td style="text-align: left">${currPat.healthData.sodiumConsumption}</td>
											</tr>
											<tr>
												<td style="text-align: right">BMI Index:</td>
												<td style="text-align: left">${currPat.healthData.bmiIndex}</td>
												<td style="text-align: right">Cholestrol Index:</td>
												<td style="text-align: left">${patient.healthData.cholestrolIndex}</td>
											</tr>
											<tr>
												<td style="text-align: right">Weight:</td>
												<td style="text-align: left">${currPat.healthData.weight}</td>
												<td style="text-align: right">Height:</td>
												<td style="text-align: left">${currPat.healthData.height}</td>
											</tr>
										</table>
									</center>
								</div>
							</c:if>
	</div>
	</div></center></div>
</body>
</html>
