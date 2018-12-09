<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot password</title>
</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<form action="${contextPath }/">
	<input type="submit" value="<<Home" style="background-color: highlight;"/>
	</form>
	<font color="red">${captchamsg}</font>
	<form action="${contextPath}/user/forgotpassword" method="POST">
		<table>
			<tr>
				<td>Enter your email:</td>
				<td><input type="text" name="useremail" size="30"/></td>
			</tr>

			<tr>
				<td colspan="2">
				<label for="captchaCode" class="prompt">Retype the characters from the picture:</label> 
				<!-- Captcha code block -->
				<%
				  // Adding BotDetect Captcha to the page
				  Captcha captcha = Captcha.load(request, "exampleCaptcha");
				  String captchaHtml = captcha.getHtml();
				  out.write(captchaHtml);
				%>
				<!-- Captcha code block-->
				<input id="captchaCode" type="text" name="captchaCode"/>
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Submit" /></td>
			</tr>
		</table>


	</form>

</body>
</html>