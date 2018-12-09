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
		<div class="bg-img" style="background-image: url('resources/img/background3.jpg');">
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
					<li><a href="#home">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#pricing">Prices</a></li>
					<li><a href="#team">Team</a></li>
					<li><a href="#contact">Contact</a></li>	
					<li><a href="${contextPath}/new?action=driveSignup">Drive with HopOn?</a></li>
					<li class="main-btn"><a href="${contextPath}/login">LOGIN</a></li>			
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
							<h2 class="white-text">Travel Smart. Drive Safe.</h2>
							<p class="white-text">Your day belongs to you!
							</p>
							<a href="${contextPath}/login" class="white-btn" role="button">Get your Ride Now!</a>
							<form action="${contextPath}/register"><input type="submit" class="white-btn" value="Register your Car with us!" /></form>
							<%-- <a href="${contextPath}/register" class="white-btn" role="button">Register your Car with us!</a> --%>
							<%-- <br>
							<a href="${contextPath}/login" class="white-btn" role="button">Drive</a> --%>
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
	
		<!-- About -->
	<div id="about" class="section md-padding">

		<!-- Container -->
		<div class="container">

			<!-- Row -->
			<div class="row">

				<!-- Section header -->
				<div class="section-header text-center">
					<h2 class="title">Welcome to HopOn</h2>
				</div>
				<!-- /Section header -->

				<!-- about -->
				<div class="col-md-4">
					<div class="about">
						<i class="fa fa-cogs"></i>
						<h3>Easiest Way Around</h3>
						<p>One tap and a car comes directly to you. Hop in and your driver knows exactly where to go. And when you get there, just step out.</p>
					</div>
				</div>
				<!-- /about -->

				<!-- about -->
				<div class="col-md-4">
					<div class="about">
						<i class="fa fa-magic"></i>
						<h3>Anywhere Anytime</h3>
						<p>Daily commute. Errand across town. Early morning flight. Late night drinks. Wherever you're headed, count on Uber for a ride, no reservations required.</p>
					</div>
				</div>
				<!-- /about -->

				<!-- about -->
				<div class="col-md-4">
					<div class="about">
						<i class="fa fa-mobile"></i>
						<h3>Low-cost to Luxury</h3>
						<p>Economy cars at everyday prices are always available. For special occasions, no occasion at all, or when you just need a bit more room, call a black car or SUV.</p>
					</div>
				</div>
				<!-- /about -->

			</div>
			<!-- /Row -->

		</div>
		<!-- /Container -->

	</div>
	<!-- /About -->
	
	<!-- Pricing -->
	<div id="pricing" class="section md-padding">

		<!-- Container -->
		<div class="container">

			<!-- Row -->
			<div class="row">

				<!-- Section header -->
				<div class="section-header text-center">
					<h2 class="title">Pricing Table</h2>
				</div>
				<!-- /Section header -->

				<!-- pricing -->
				<div class="col-sm-4">
					<div class="pricing">
						<div class="price-head">
							<span class="price-title">HopOn Pool</span>
							<div class="price">
								<h3>$4<span class="duration">/mile</span></h3>
							</div>
						</div>
						<ul class="price-content">
							<li>
								<p>Shared Ride</p>
							</li>
							<li>
								<p>Sedan Cars</p>
							</li>
							<li>
								<p>24/24 Support</p>
							</li>
						</ul>
						<div class="price-btn">
							<a href="${contextPath }/login" class="outline-btn">Book now</a>
							<a href="${contextPath }/allCars?action=sedan" class="outline-btn">View all cars</a>
						</div>
					</div>
				</div>
				<!-- /pricing -->

				<!-- pricing -->
				<div class="col-sm-4">
					<div class="pricing">
						<div class="price-head">
						 	<span class="price-title">HopOn X</span>
							<div class="price">
								<h3>$7<span class="duration">/mile</span></h3>
							</div> 
						</div>
						<ul class="price-content">
							<li>
								<p>Seats 4 Passengers</p>
							</li>
							<li>
								<p>Sedan Cars</p>
							</li>
							<li>
								<p>24/24 Support</p>
							</li>
						</ul>
						<div class="price-btn">
							<a href="${contextPath }/login" class="outline-btn">Book now</a>
							<a href="${contextPath }/allCars?action=sedan" class="outline-btn">View all cars</a>
						</div>
					</div>
				</div>
				<!-- /pricing -->
				
				<!-- pricing -->
				<div class="col-sm-4">
					<div class="pricing">
						<div class="price-head">
							<span class="price-title">HopOn XL</span>
							<div class="price">
								<h3>$9<span class="duration">/mile</span></h3>
							</div>
						</div>
						<ul class="price-content">
							<li>
								<p>Seats 6 Passengers</p>
							</li>
							<li>
								<p>SUV Cars</p>
							</li>
							<li>
								<p>24/24 Support</p>
							</li>
						</ul>
						<div class="price-btn">
							<a href="${contextPath }/login" class="outline-btn">Book now</a>
							<a href="${contextPath }/allCars?action=suv" class="outline-btn">View all cars</a>
						</div>
					</div>
				</div>
				<!-- /pricing -->

			</div>
			<!-- Row -->

		</div>
		<!-- /Container -->

	</div>
	<!-- /Pricing -->
	
	<!-- Team -->
	<div id="team" class="section md-padding">

		<!-- Container -->
		<div class="container">

			<!-- Row -->
			<div class="row">

				<!-- Section header -->
				<div class="section-header text-center">
					<h2 class="title">Our Team</h2>
				</div>
				<!-- /Section header -->

				<!-- team -->
				<div class="col-sm-12">
					<div class="team">
						<div class="team-img">
							<img class="img-responsive" src="resources/img/team1.jpg" alt="">
							<div class="overlay">
								<div class="team-social">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-google-plus"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</div>
							</div>
						</div>
						<div class="team-content">
							<h3>Urvi Maru</h3>
							<span>Graduate Student</span>
						</div>
					</div>
				</div>
				<!-- /team -->

			</div>
			<!-- /Row -->

		</div>
		<!-- /Container -->

	</div>
	<!-- /Team -->
	
	<!-- Contact -->
	<div id="contact" class="section md-padding">

		<!-- Container -->
		<div class="container">

			<!-- Row -->
			<div class="row">

				<!-- Section-header -->
				<div class="section-header text-center">
					<h2 class="title">Get in touch</h2>
				</div>
				<!-- /Section-header -->

				<!-- contact -->
				<div class="col-sm-4">
					<div class="contact">
						<i class="fa fa-phone"></i>
						<h3>Phone</h3>
						<p>+1 857-334-0933</p>
					</div>
				</div>
				<!-- /contact -->

				<!-- contact -->
				<div class="col-sm-4">
					<div class="contact">
						<i class="fa fa-envelope"></i>
						<h3>Email</h3>
						<p>maru.u@husky.neu.edu</p>
					</div>
				</div>
				<!-- /contact -->

				<!-- contact -->
				<div class="col-sm-4">
					<div class="contact">
						<i class="fa fa-map-marker"></i>
						<h3>Address</h3>
						<p>Boston, United States</p>
					</div>
				</div>
				<!-- /contact -->

				<!-- contact form -->
				<div class="col-md-8 col-md-offset-2">
					<form class="contact-form" action="${contextPath}/message" method="post">
						<input type="text" class="input" placeholder="Name">
						<input type="email" class="input" placeholder="Email" name="email">
						<input type="text" class="input" placeholder="Subject" name="subject">
						<textarea class="input" placeholder="Message" name="message" required=required></textarea>
						<input id ="message" type="submit" onclick="message()" value="Send message" class="main-btn"/>

					</form>
				</div>
				<!-- /contact form -->

			</div>
			<!-- /Row -->

		</div>
		<!-- /Container -->

	</div>
	<!-- /Contact -->
	
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
						<p>Copyright © 2018. All Rights Reserved.</p>
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
	
	<script>
	function message(){
		alert("Message successfully sent!"); 
		
	}
	</script>
	<!-- <script type="text/javascript"> -->

</body>

</html>
	