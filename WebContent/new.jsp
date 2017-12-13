<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add Post</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
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
	<%
    session=request.getSession(false);
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("http://localhost:8080/rest/");
    }

	%>
	<%@include file="header.jsp" %>
	<div class="container" style="padding-top:20px;">
	<form id="addform" method="POST" action="/rest/resources/post/create">
			<div class="form-group">
			    <label for="name">Title:</label>
			    <input type="text" required="required" class="form-control" id="title" placeholder="Enter name" name="title">
			</div>
			<div class="form-group">
			    <label for="name">City:</label>
			    <input type="text" required="required" class="form-control" id="city" placeholder="Enter name" name="city">
			</div>
			
			<div class="form-group">
			    <label for="name">Image link:</label>
			    <input type="text" required="required" class="form-control" id="image" name="image">
			</div>
			
			<div class="form-check">
				  <label class="form-check-label">
				    <input class="form-check-input" type="radio" name="state" value="new" checked>
				    New
				  </label>
				  <label class="form-check-label">
				    <input class="form-check-input" type="radio" name="state" value="Used" >
				    Used
				  </label>
				  <label class="form-check-label">
				    <input class="form-check-input" type="radio" name="state" value="emergency">
				    Emergency
				  </label>
			  </div>
			<div class="form-group">
			    <label for="name">Price:</label>
			    <input type="text" required="required" class="form-control" id="price" name="price">
			</div>
			<div class="form-group">
			    <label for="name">Description:</label>
			    <input type="text" required="required" class="form-control" id="desc" name="desc">
			</div>
			  
			<button type="submit" class="btn btn-primary">Add</button>
	</form>
	</div>
	
</body>
</html>