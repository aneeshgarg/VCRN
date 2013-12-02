<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
	<div id="logincanvas" >
		
		<div id="PageHeader">
			<jsp:include page="pageheader.jsp"/>
		</div>
		
	
		<center>
		<div id="contentpage" class="contentpage">
			<center><h3>Welcome</h3></center>			
		
			<% if(request.getAttribute("errormessage")!=null){%>
				<strong class="alert"><%=request.getAttribute("errormessage")%></strong>
			<%}%>
			<form id="login" name="login" action="home" method="post" >
				<table>
				
					<tbody>
						<tr>
							<td><label for="username">Username:</label></td>
							<td><input type="text" name="username" placeholder="Username" required/></td>
							
						</tr>
						<tr>
							<td><label for="password">Password:</label></td>
							<td><input type="password" name="password" placeholder="Password" required/></td>
							
						</tr>
						<tr>
							<td/>
							<td><input type="submit" value="Login"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<br>
		</div></center>
		
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>