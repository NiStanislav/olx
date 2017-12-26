<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://olxkz-static.akamaized.net/static/olxkz/naspersclassifieds-regional/olxeu-atlas-web-olxkz/static/img/favicon.ico?v=4">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add Post</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script>
$(document).ready(function(){
	var frm = $('#addform');
	frm.submit(function( event ) {
		$.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
            		window.location.replace("http://localhost:8080/rest/NewPostServlet");
            },
			error: function (error) {
				alert('Announcement was not saved');
			}
        });
        event.preventDefault();
	});
});
</script>
</head>
<body>
	
	<%@include file="header.jsp" %>
	<div class="container" style="padding-top:20px;">
	<form id="addform" method="POST" action="/rest/resources/post/create">
			<div class="form-group">
			    <label for="name">Title:</label>
			    <input type="text" required="required" class="form-control" id="title" placeholder="Enter name" name="title">
			</div>
			
			<label for="name">Category:</label>
			<select class="form-control" name="category">
    			 <option>Electronic</option>
   				 <option>Home</option>
   				 <option>Cloth</option>
   				 <option>Hobby</option>
   				 <option>Animals</option>
   				 <option>Children</option>
   				 <option>Service</option>
   				 <option>Accessories</option>
   				 <option>Other</option>
  				</select>
			<label for="name">City:</label>
			<select class="form-control" name="city">
   				<option checked="checked">Almaty</option>
    			<option>Astana</option>
   				<option>Karaganda</option>
   				<option>Shymkent</option>
   				<option>Taraz</option>
   				<option>Other</option>
  			</select>
			
			<div class="form-group">
			    <label for="name">Image link:</label>
			    <input type="text" required="required" class="form-control" id="image" name="image">
			</div>
			<label for="name">State:</label>
			<select class="form-control" name="state">
   				 <option checked="checked">new</option>
    			<option>used</option>
   				 <option>emergency</option>
  			</select>
			<div class="form-group">
			    <label for="name">Price:</label>
			    <input type="number" required="required" class="form-control" id="price" name="price">
			</div>	
			<div class="form-group">
			    <label for="name">Description:</label>
			    <input type="text" required="required" class="form-control" id="desc" name="desc">
			</div>
			  
			<button type="submit" class="btn btn-primary">Add</button>
	</form>
	</div>
	<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>