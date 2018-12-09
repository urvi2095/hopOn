<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book your Ride</title>

<meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      #map {
        height: 100%;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
      .rightpane{
      float: right;
      }
    </style>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form action="${contextPath }/">
	<input type="submit" value="<<Home" style="background-color: highlight;"/>
	</form>
	<div class = "container">
		<div class= "rightpane">
		<a href="${contextPath}/?action=logout" class="main-btn" role="button">Logout</a>
		</div>
	</div>
	<div style: align="center" ><b><u>List of available drivers with HopOn</u></b></div>
	<button onclick="getLocation()">Confirm your Location</button>
	<p id="demo"></p>
	<b>${message}</b>
	<form action="${contextPath}/book" method="POST">
	<h3>Choose your Destination Location:</h3>
	<input id="location" type="text" name="location" required=required/> 
	<input id="lat" type="hidden" name="latitude">
	<input id="lng" type="hidden" name="longitude">
	<input id="pickup_lat" type="hidden" name="pickup_latitude">
	<input id="pickup_lon" type="hidden" name="pickup_longitude">
	<input type="submit" value ="Book Cab"/>
	</form>
	<div id="map"></div>
    <script>
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else { 
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function showPosition(position) {
    	var x = document.getElementById("demo");
        x.innerHTML = "Latitude: " + position.coords.latitude + 
        "<br>Longitude: " + position.coords.longitude;
    }
    
   /*  function showPosition(position) {
    	var x = document.getElementById("demo");
    	document.getElementById("demo").innerHTML = "Latitude: " + position.coords.latitude + 
        "<br>Longitude: " + position.coords.longitude;
        document.getElementById("pickup_lat").value= position.coords.latitude;
        document.getElementById("pickup_lat").value= position.coords.longitude;
    }  */   
    
      function initMap() {
        var position = {lat: 42.342865, lng: -71.100288};
       
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: position
           
        });
		 var markers = [
		     ['Boston Common, Boston', 42.353821,-71.070930, 1],
		     ['75 Peterborough Street, Boston', 42.343793,-71.098106, 2],
		     ['Boston Harbour, Boston', 42.337638,-70.975530, 3],
		     ['Fenway, Boston', 42.342865,-71.100288, 4],
		     ['South Boston, Boston', 42.338144,-71.047577, 5],
		     ['Columbus Ave, Boston', 42.343361,-71.078374, 6],
		     ['Longwood, Boston', 42.339836,-71.108878, 7],
		     ['Harvard University, Boston', 42.377003,-71.116660, 8],
		     ['MIT University, Boston', 42.360091,-71.094160, 9],
		     ['Northeastern University, Boston',42.339807,-71.089172, 10]
		 ];
		 
		 var infoWindow = new google.maps.InfoWindow(), marker, i;
		 var id;
        for( i=0; i<markers.length;i++){
	        var uluru = {lat: markers[i][1], lng: markers[i][2]};
	        var marker = new google.maps.Marker({
	        position: uluru,
	        map: map,
	        title: markers[i][0]
	      });
	        
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	            return function() {
	                infoWindow.setContent(markers[i][0]);
	                infoWindow.open(map, marker);
	                document.getElementById("location").value = markers[i][0];
	                document.getElementById("lat").value = markers[i][1];
	                document.getElementById("lng").value = markers[i][2];
	                var mapId = markers[i][0];
	            }
	        })(marker, i));
	       
        }
        
        var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
            this.setZoom(14);
            google.maps.event.removeListener(boundsListener);
        });
        
        }
    </script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZzAUtT6_y8EsypWUerujmzjNR6fSVw2A&callback=initMap"
  type="text/javascript"></script>
  
</body>
</html>