<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form Success</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form action="${contextPath }/">
	<input type="submit" value="<<Home" style="background-color: highlight;"/>
	</form>
	<c:choose>
		<c:when test="${action eq 'register'}">
		Your Car is now Registered with HopOn!<br>
		    <a href="${contextPath }/savePDFForm" style="margin-left:25px" type="button" class="form-submit-print" data-component="button">
              <img src="https://cdn.jotfor.ms/images/printer.png" style="vertical-align:middle" />
              <span id="span_print_32" class="span_print">
                Preview PDF Form
              </span>
            </a>
            
            <a href="${contextPath }/saveExcelForm" style="margin-left:25px" type="button" class="form-submit-print" data-component="button">
              <img src="https://cdn.jotfor.ms/images/printer.png" style="vertical-align:middle" />
              <span id="span_print_32" class="span_print">
                Download Excel Form
              </span>
            </a>
            <br>
            <br>
            <b> Your Registered Car: </b><br>
            <img src="resources/img/cars/${carPhoto}" />
            
		</c:when>
		
		<c:when test="${action } eq 'save'">
		
		Form downloaded successfully!<br>
		</c:when>
	</c:choose>
	
</body>
</html>