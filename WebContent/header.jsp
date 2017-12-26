<script>
$(document).ready(function(){
	$('#signout').click(function() {
		$.get("/rest/resources/auth/signOut", function(data, status){
			window.location.replace("http://localhost:8080/rest/logout");
	    });
	});
});
</script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"  href="/rest/home/">
			<img class="logo" src="https://olxkz-static.akamaized.net/static/olxkz/packed/font/2f4f22766be42e5eac379976b5237b92ca.svg">
		</a>
		<ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link " href="/rest/home/">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="/rest/new.jsp">Add Ad</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/rest/user">${sessionScope.email}</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="/rest/logout">Logout</a>
  </li>
</ul>
	</nav>
	
	
<style>
	img.logo{
		height: 60px;
    		width: 60px;
    		margin: 20px;
    		margin-top:40px;
    		
	}
	nav{
		max-height: 60px;
	}
	
	
</style>
