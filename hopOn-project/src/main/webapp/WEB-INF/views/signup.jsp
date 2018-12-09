 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@page import="com.captcha.botdetect.web.servlet.Captcha"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Signup</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<form action="${contextPath }/">
	<input type="submit" value="<<Home" style="background-color: highlight;"/>
	</form>
	<b>${errorMessage}</b>	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="${contextPath}/signup" method="post">
					<span class="login100-form-title p-b-26">
						Sign Up to HopOn!
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter firstname">
						<input class="input100" name="firstName" placeholder="First Name" required="required"/>
						<!-- <span class="focus-input100" data-placeholder="First Name"></span> -->
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter Lastname">
						<input class="input100" type="text" name="lastName" placeholder= "Last Name"/>
<!-- 						<span class="focus-input100" data-placeholder="Last Name"></span>
 -->					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter email">
						<input class="input100" type="email" name="email" placeholder="Email Address" required="required"/>
<!-- 						<span class="focus-input100" data-placeholder="Email Address"></span>
 -->					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="Enter Username" required="required" onkeyup="ajaxEvent()"/>
 					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<!-- <span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span> -->
						<input id="password" class="input100" type="password" name="password" placeholder="Enter Password" required="required"/>
						<span class="status">
 					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter contact"> 
						<input class="input100" type="text" name="contact" placeholder="Contact Number"/>
<!-- 						<span class="focus-input100" data-placeholder="Contact NUmber"></span>
 -->					</div>
					
					<c:if test="${requestScope.action eq 'driveSignup' }">
						<div class="wrap-input100 validate-input" data-validate = "Enter Driver's License Number">
							<input class="input100" type="text" name="license" placeholder="Driver's License Number" required="required"/>
<!-- 							<span class="focus-input100" data-placeholder="Driver's License Number"></span>
 -->						</div>
					</c:if>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<input type="submit" class="login100-form-btn" value="Sign Up" style="background-color:highlight"/>
<%-- 							<a href="${contextPath}/signup" class="login100-form-btn" role="button">Sign Up</a>
 --%>						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>
<script>
var contexPath = "<%=request.getContextPath() %>";
$(function(){
    $("#password").blur(function(){
        var password = $('#password').val();
       // var patt = new RegEx("[^a-zA-Z0-9-]");
        var check = password.split("");
       // if(password.length <= 3){
        	if(check.includes(" ")){
        		$(".status").html("<font color=red>Password cannot contains <b>spaces</b></font>")
        	}
        	else if(password.length<=3){
        		$(".status").html("<font color=red>Password should be more than <b>3</b> characters long.</font>")
        	}/* 
        	else if (patt.test(password)){
        			alert("Passwords must be"+ 
        				" * - At least 8 characters long, max length anything"+
        				" * - Include at least 1 lowercase letter"+
        				" * - 1 capital letter"+
        				" * - 1 number"+
        				" * - 1 special character => !@#$%^&* ");
        	} */
           // $(".status").html("<font color=red>Password should be more than <b>3</b> characters long.</font>");
      //  }

    });
 });

function ajaxEvent() {

	var xmlHttp;
	try // Firefox, Opera 8.0+, Safari
	{
		xmlHttp = new XMLHttpRequest();
	} catch (e) {
		try // Internet Explorer
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}

	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			document.getElementById("username").innerHTML = xmlHttp.responseText;
		}
	}
	
	var queryString = document.getElementById("queryString").value;

	xmlHttp.open("POST", "../ajaxservice?username="+queryString, true);
	xmlHttp.send();
}
</script>
</script>


</body>
</html>