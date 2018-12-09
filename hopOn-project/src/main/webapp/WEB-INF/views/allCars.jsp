<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Cars with HopOn!</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<form action="${contextPath }/">
<input type="submit" value="<<Home" style="background-color: highlight;"/>
</form>	

<h1><u>HopOn Cars</u></h1>

<br>
<c:choose>
	<c:when test="${action eq 'sedan'}">
			<c:if test="${empty sedanCars}">
				Oops, No Sedan cars Registered with us yet!
			</c:if>
				<b>Here are the available <mark>Sedan</mark> Cars with HopOn</b>
				<br> 
				<table border="1">
					<tr>
					<th>Manufacturing Company</th>
					<th>Registeration Number</th>
					<th>Model</th>
					<th>Colour</th>
					<th></th>
					</tr>
					<c:forEach items="${sedanCars}" var="car">
						<tr>
						<td>${car.company }</td>
						<td>${car.registerationNo }</td>
						<td>${car.model }</td>
						<td>${car.colour }</td>
						<td><a href="${contextPath}/delete?id=${car.carId}&type=sedan">Remove this Car</a></td>
						</tr>
					</c:forEach>
				</table>
	</c:when>
	<c:otherwise>
			<c:if test="${empty suvCars}">
				Oops, No Sedan cars Registered with us yet!
			</c:if>
				<b>Here are the available <mark>SUV</mark> Cars with HopOn</b>
				<br>
				<table border="1">
					<tr>
					<th>Manufacturing Company</th>
					<th>Registeration Number</th>
					<th>Model</th>
					<th>Colour</th>
					</tr>
					<c:forEach items="${suvCars}" var="car">
						<tr>
						<td>${car.company }</td>
						<td>${car.registerationNo }</td>
						<td>${car.model }</td>
						<td>${car.colour }</td>
						<td><a href="${contextPath}/delete?id=${car.carId}&type=suv">Remove this Car</a></td>
						</tr>
					</c:forEach>
				</table>
	</c:otherwise>
</c:choose>

<br>
<br>
</body>
</html>