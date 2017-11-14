<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>FAA Webapp</title>
<link rel="stylesheet" type = "text/css" href="resources/css/style.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="resources/javascript/moment.js" type="text/javascript"></script>
<script src="resources/javascript/javascript.js" type="text/javascript"></script>
</head>
<body>
	<div id="title">
		<img id="logo" src="resources/images/logo.png" alt="FAA Logo">
		<span id="title1">IPPT</span> <span id="title2">Fix Search</span>
	</div> 
	<form id="primaryForm" action="/fix_Search_Results">
		<div id="searchInput">
  			Search Term:<br>
  			<input type="text" name="searchText" value=${searchText}>
  		</div>
  		<div id=searchSubmit>
  			<br><input type="radio" name="searchType" value="5 LNC" onclick="javascript:hidePopupReserved()" checked>Search 5 LNC Database<br>
 			<input type="radio" name="searchType" value="FAA Reserved" onclick="javascript:showPopupReserved()">Search FAA Reserved<br>
  			<input id="submitBtn" type="submit" value="Search">
  		</div>
  		<div id="topFormSep">
  			<div style="display: inline-block;margin-left:45px">
  					Latitude: <br>
  					Longitude:
  			</div>
  			<div id="stateCalc">
  					<input type="text" name="latDegrees" id="latDegrees" size="3"> -
  					<input type="text" name="latMinutes" id="latMinutes" size="3"> -
  					<input type="text" name="latSeconds" id="latSeconds" size="8">
  					<select id="northSouth">
  						<option value="north">North</option>
  						<option value="south">South</option>
					</select> <br>

  					<input type="text" name="lonDegrees" id="lonDegrees" size="3"> -
  					<input type="text" name="lonMinutes" id="lonMinutes" size="3"> -
  					<input type="text" name="lonSeconds" id="lonSeconds" size="8">
  					<select id="westEast">
  						<option value="west">West</option>
  						<option value="east">East</option>
					</select> <br>
  					<input id="calcStateBtn" type="button" value="Estimate State" onclick="javascript:calcState()">
  					<span id="stateResult"></span>
  			</div>
 		</div>
  		
	</form>
	<span id="popupReserved" class="hide">Enter Keywords for Reservee, separated by a space.</span>
	<div id="tableDiv"> 
	<table> 
		<thead>
			<tr>
				<th>Name</th>
				<th>Database</th>
				<th>ICAO Region</th>
				<th>Country</th>
				<th>State</th>
				<th>Latitude</th>
				<th>Longitude</th>
				<th>Comments</th>
				<th>Database Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items = "${fixNames}" var = "item">
				<tr>
					<td title="Name">${item.id}</td>
					<td title="Database">${item.database}</td>
					<td title="ICAO Region">${item.region}</td>
					<td title="Country">${item.country}</td>
					<td title="State">${item.state}</td>
					<td class="location" headers="Latitude" title="Click to find State">${item.latitude}</td>
					<td class="location" headers="Longitude" title="Click to find State">${item.longitude}</td>
					<td title="Comments">${item.comments}</td>
					<td title="Database Date">${item.databaseDate}</td>
				</tr><!-- Table Row -->
			</c:forEach>
		</tbody>
	</table>
	</div>
	<br> <br>
	<div id="access">
  		<input id = "passwordBtn" class="line" type="button" value="Update Database" onclick="javascript:checkPassword()">
  		Password:
  		<form id="passwordForm" class="line" action="#" onsubmit="javascript: handle(event)">
  			<input type="text" name="password" id = "password" >
  		</form>
 		<div id="popup4" class="hide">
 			Invalid password
		</div>
  	</div>
  	
  	<div class="center">
	<div id="loadAlign"class="formField">
		<form id="loadTool" class="hide">
			<div id="dateInput">
  				<br>Date of Data (mm/dd/yyyy):<br>
  				<input type="text" name="dataDate" id = "dataDate" >
  			</div>
  			<input type="hidden" id="dataType" name="dataType">
  			<div id="toolSubmit">
  				<input class="toolBtn" type="button" value="Load NGA" onclick="javascript:loadNGA()">
  				<input class="toolBtn" type="button" value="Load Jeppesen" onclick="javascript:loadJepp()">
  				<input class="toolBtn" type="button" value="Load AVNIS" onclick="javascript:loadAVNIS()">
  				<input class="toolBtn" type="button" value="Load NavCanada" onclick="javascript:loadNavCan()">
  				<input class="toolBtn" type="button" value="Load ICARD" onclick="javascript:loadICARD()">
  			</div>
  			<div id="popupDateError" class="hide">
  				Invalid date
			</div>
			<span id="updateComplete" class="hide"></span>
		</form>
		</div>
	</div>
	<body onload="javascript:clickable()" >
</body>
</html>