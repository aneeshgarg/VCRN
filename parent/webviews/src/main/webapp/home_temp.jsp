<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.pioneers.vcrn.data.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<%
	Object object = request.getAttribute("account");
	MedicalProfessional mp = null;
	Patient patient = null;
	if (object instanceof MedicalProfessional)
	    mp = (MedicalProfessional) object;
	else if (object instanceof Patient)
	    patient = (Patient) object;
	if (mp != null)
	    out.println(mp.toString());
	else if (patient != null)
	    out.println(patient.toString());
%>
</body>
</html>