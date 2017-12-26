<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel ="stylesheet" href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css">
<script>
$(document).ready(function(){
	var frm = $('#login');
	frm.submit(function( event ) {
		$.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
            		window.location.replace("http://localhost:8080/rest/home/");
            },
			error: function (error) {
				alert('Wrong credentials');
			}
        });
        event.preventDefault();
	});
	var frm2 = $('#signupform');
	frm2.submit(function( event ) {
		$.ajax({
            type: frm2.attr('method'),
            url: frm2.attr('action'),
            data: frm2.serialize(),
            success: function (data) {
            		window.location.replace("http://localhost:8080/rest/home/");
            },
			error: function (error) {
				alert('All fields are required');
			}
        });
        event.preventDefault();
	});
	$('#signup').click(function() {
		$('#signinrow').hide(500, function(){
			$('#signuprow').show(500);	
		});
	});
	$('#signin').click(function() {
		$('#signuprow').hide(500, function(){
			$('#signinrow').show(500);	
		});
	});
});
</script>
</head>
<body>
<%
    session=request.getSession(false);
    if(session.getAttribute("email")!=null)
    {
        response.sendRedirect("http://localhost:8080/rest/home/");
    }

	%>

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="#">
			<img class="logo" src="https://olxkz-static.akamaized.net/static/olxkz/packed/font/2f4f22766be42e5eac379976b5237b92ca.svg">
		</a>
	</nav>
	<div class="container">
		<div id="signinrow" class="row" style="padding-top:20px;">
		
			<div class="col">
		    </div>
		    <div class="col">
		      <form id="login" method="POST" action="/rest/resources/auth/signIn" class="form-signin">
		      <h2 class="form-signin-heading">Please sign in</h2>
			  <input type="hidden" value="/" name="requestURI" />
			  <div class="form-group">
			   <!--  <label for="email">Email address</label> -->
			    <input type="email" required="required" class="form-control" id="email" placeholder="Email address" name="email">
			  </div>
			  <div class="form-group">
			  <!--   <label for="password">Password</label> -->
			    <input type="password" required="required" class="form-control" id="password" placeholder="Password" name="password">
			  </div>
			  <button type="submit" class="btn btn-lg btn-primary btn-block">Sign in</button>
			  </form>
			  <button id="signup" class="btn btn-lg btn-secondary btn-block" style="margin:25px; max-width:300px;">Sign up</button>
		    </div>
		    <div class="col">
		    </div>
	  	</div>
	  	<div id="signuprow" class="row" style="padding-top:20px;display:none;">
			<div class="col">
		    </div>
		    <div class="col">
		      <form id="signupform" method="POST" action="/rest/resources/auth/signUp">
			  <input type="hidden" value="/" name="requestURI" />
			  <div class="form-group">
			    <label for="name">Name</label>
			    <input type="text" required="required" class="form-control" id="name" placeholder="Enter name" name="name">
			  </div>
			  <div class="form-group">
			    <label for="surname">Surname</label>
			    <input type="text" required="required" class="form-control" id="surname" placeholder="Enter surname" name="surname">
			  </div>
			  <div class="form-group">
			    <label for="email">Email address</label>
			    <input type="email" required="required" class="form-control" id="email" placeholder="Enter email" name="email">
			  </div>
			  <div class="form-group">
			    <label for="password">Password</label>
			    <input type="password" required="required" class="form-control" id="password" placeholder="Password" name="password">
			  </div>
			  
			  <div class="form-group">
			    <label for="phone">Phone</label>
			    <input type="text" required="required" class="form-control" id="phone" placeholder="phone" name="phone">
			  </div>
			  <button type="submit" class="btn btn-primary">Sign Up</button>
			  </form>
			  <button id="signin" class="btn btn-secondary" style="margin-top:10px">Sign in</button>
		    </div>
		    <div class="col">
		    </div>
	  	</div>
	</div>
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
	body{
		padding: 0 !important;
	}
	
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</body>
</html>