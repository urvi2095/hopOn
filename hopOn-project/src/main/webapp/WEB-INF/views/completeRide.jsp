<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Complete Ride</title>
</head>
<body>


	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form action="${contextPath }/">
	<input type="submit" value="<<Home" style="background-color: highlight;"/>
	</form>
	<h1>Booking Details:</h1>
	<b>Customer Name:</b> ${customer.firstName} ${customer.lastName }
	<b>Customer Contact:</b> ${customer.contact }
	<br>
	<h2>Drive Safe!</h2>	
	<a href="${contextPath}/?action=logout">[Logout]</a>

</body>
</html>