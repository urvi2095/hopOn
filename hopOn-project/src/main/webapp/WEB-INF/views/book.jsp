<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Cab</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<form action="${contextPath }/">
<input type="submit" value="<<Home" style="background-color: highlight;"/>
</form>

	
	<h1>Your car is arriving in 10 minutes!</h1>
	<h2><u>Booking details:</u></h2>
	<b>Driver name:</b> ${driverFound.firstName} ${driverFound.firstName} </br>
	<b>Destination:</b> ${destination} </br>
	
	<h2>Have a Great Ride!</h2>
	<br>
	
	<a href="${contextPath }/?action=logout">[Logout]</a> 	
</body>
</html>