<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script>
$(document).ready(function(){
	$('#signout').click(function() {
		$.get("/rest/resources/auth/signOut", function(data, status){
			window.location.replace("http://localhost:8080/rest/");
	    });
	});
});
</script>
</head>
<body>
		<nav class="navbar navbar-expand flex-column flex-md-row navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Olx.kz</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav bd-navbar-nav flex-row">
		      <li class="nav-item">
		        <a class="nav-link" href="/rest/home/">Home</a>
		      </li>
		    </ul>
		    <ul class="navbar-nav bd-navbar-nav flex-row">
		      <li class="nav-item">
		        <a class="nav-link" href="/rest/new.jsp">Add</a>
		      </li>
		    </ul>
		    <ul class="navbar-nav bd-navbar-nav flex-row">
		      <li class="nav-item">
		        <a class="nav-link" href="/rest/user">Profile</a>
		      </li>
		    </ul>
		    <ul class="navbar-nav bd-navbar-nav flex-row">
		      <li class="nav-item">
		        <a class="nav-link" href="#" id="signout">Sign Out</a>
		      </li>
		  </div>
	</nav>
</body>
</html>