<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
    
<title>Driving with HopOn!</title>

<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        width: 350px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
      #latlng {
        width: 225px;
      }
    </style>
    
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form action="${contextPath }/" method="post">
	<input type="submit" value="<<Home" style="background-color: highlight;"/>
	</form>		
	<h1>Hello ${driver.firstName} ${driver.lastName }</h1>
	<c:choose>
		<c:when test="${empty customer}">
		<div style="align-content: center;">
			
			<b>${errorMessage}</b><br><br>
			<a href="${contextPath}/?action=logout">[Logout]</a>
		</div>
		</c:when>
		<c:otherwise>
			<h1>You have a new Booking!</h1>
			<b>Customer Name:</b> ${customer.firstName} ${customer.lastName} <br>
			<b>Customer Contact:</b> ${customer.contact}<br>
			<form action="${contextPath}/completeRide" method="post">
			<input type="hidden" name="pickupAddress" />
			<input type="submit" value="Complete Ride" />
			</form>
			<div id="floating-panel">
      		<input id="lat" type="text" value="42.339807">
      		<input id="lng" type="text" value="-71.089172">
      		<input id="submit" type="button" value="View Customer Location">
    		</div>
    		<div id="map"></div>
		</c:otherwise>
	</c:choose>
	
<script>
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: {lat: 40.352, lng: -71.108}
    });
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow;

    document.getElementById('submit').addEventListener('click', function() {
      geocodeLatLng(geocoder, map, infowindow);
    });
  }

  function geocodeLatLng(geocoder, map, infowindow) {
    var lat = document.getElementById('lat').value;
    var lng = document.getElementById('lng').value;
    var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
    geocoder.geocode({'location': latlng}, function(results, status) {
      if (status === 'OK') {
        if (results[0]) {
          map.setZoom(5);
          var marker = new google.maps.Marker({
            position: latlng,
            map: map
          });
          infowindow.setContent(results[0].formatted_address);
          document.getElementById("pickupAddress").value = results[0].formatted_address;
          infowindow.open(map, marker);
        } else {
          window.alert('No results found');
        }
      } else {
        window.alert('Geocoder failed due to: ' + status);
      }
    });
  }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7ICL5J1DOgCwWZQ8kzLYZTbWnQXVjZaM&callback=initMap"
  type="text/javascript"></script>
</body>
</html>