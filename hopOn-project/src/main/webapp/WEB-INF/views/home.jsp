<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>HopOn! Travel Safe</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css" />

	<!-- Owl Carousel -->
	<link type="text/css" rel="stylesheet" href="resources/css/owl.carousel.css" />
	<link type="text/css" rel="stylesheet" href="resources/css/owl.theme.default.css" />

	<!-- Magnific Popup -->
	<link type="text/css" rel="stylesheet" href="resources/css/magnific-popup.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="resources/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<!-- Header -->
	<header id="home">
		<!-- Background Image -->
		<div class="bg-img" style="background-image: url('resources/img/background1.jpg');">
			<div class="overlay"></div>
		</div>
		<!-- /Background Image -->

		<!-- Nav -->
		<nav id="nav" class="navbar nav-transparent">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<a href="index.jsp">
							<img class="logo" src="resources/img/logo.png" alt="logo">
							<img class="logo-alt" src="resources/img/logo.png" alt="logo">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Collapse nav button -->
					<div class="nav-collapse">
						<span></span>
					</div>
					<!-- /Collapse nav button -->
				</div>

				<!--  Main navigation  -->
				<ul class="main-nav nav navbar-nav navbar-right">
					<li><a href="${contextPath}/profile">Hi ${firstname}! </a></li>
					<li class="main-btn"><a href="${contextPath }/?action=logout">LOGOUT</a></li>
				</ul>
				<!-- /Main navigation -->
				
			</div>
		</nav>
		<!-- /Nav -->

		<!-- home wrapper -->
		<div class="home-wrapper">
			<div class="container">
				<div class="row">

					<!-- home content -->
					<div class="col-md-10 col-md-offset-1">
						<div class="home-content">
							<h1 class="white-text">Travel Smart. Drive Safe.</h1>
							<p class="white-text">Your day belongs to you!
							</p>
								
							<c:choose>
							    <c:when test="${empty license}">
 							    	<a href="${contextPath}/ride" class="white-btn" role="button">Ride</a>
 							    </c:when>
							    <c:otherwise>
							         <a href="${contextPath}/drive" class="white-btn" role="button">Drive</a>            
							    </c:otherwise>
							</c:choose>

						    <!-- <button class="white-btn" onclick="login()">Ride</button>
							<button class="white-btn" onclick="login()">Drive</button> -->
						</div>
					</div>
					<!-- /home content -->

				</div>
			</div>
		</div>
		<!-- /home wrapper -->
		
	</header>
	
	<!-- /Header -->
	
	<!-- Footer -->
	<footer id="footer" class="sm-padding bg-dark">

		<!-- Container -->
		<div class="container">

			<!-- Row -->
			<div class="row">

				<div class="col-md-12">

					<!-- footer logo -->
					<div class="footer-logo">
						<a href="index.jsp"><img src="resources/img/logo.png" alt="logo"></a>
					</div>
					<!-- /footer logo -->

					<!-- footer copyright -->
					<div class="footer-copyright">
						<p>Copyright © 2017. All Rights Reserved.</p>
					</div>
					<!-- /footer copyright -->

				</div>

			</div>
			<!-- /Row -->

		</div>
		<!-- /Container -->

	</footer>
	<!-- /Footer -->

	<!-- Back to top -->
	<div id="back-to-top"></div>
	<!-- /Back to top -->

	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
		</div>
	</div>
	<!-- /Preloader -->

	<!-- jQuery Plugins -->
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.magnific-popup.js"></script>
	<script type="text/javascript" src="resources/js/main.js"></script>
	
	<!-- jQuery Plugins -->
	
</body>

</html>
	