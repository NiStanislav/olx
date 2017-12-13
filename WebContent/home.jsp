<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OLX</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script>
$(document).ready(function(){
	$('#signout').click(function() {
		$.get("/rest/resources/auth/signOut", function(data, status){
			window.location.replace("http://localhost:8080/rest/home/");
	    });
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
	<form action="/rest/search" style="margin: 50px">
     <div class="modal_dropdown-content">
     	<div class="dropdown-content">
     		<input type="text" name="search"  class="form-control">
     		<ul class="header-registration_sub-menu list-inline">
     	
				<li><input type="radio" name="order" value="price" checked="checked"> Price</li>
				<li><input type="radio" name="order" value="views"> Popularity</li>
				<li><input type="radio" name="order" value="date"> Date</li>
				<li><input type="submit" class="btn btn-dark" value="Search"></li>
			
     		</ul>
     	</div>
     </div>
     </form>
	<div class="main">
	<center>
	<table>
	<style>
	td{
		padding: 0;
	}
	.image img{
		display: block;
		margin: 10px auto;
		margin-top: 30px;
	}
	.card{
		min-width: 450px;
		min-height: 450px;
		text-align: center;
	}
	a{
		cursor: pointer;
		text-decoration: none;
	}
	
	</style>
			<c:forEach items="${posts}" var="a" varStatus="cnt">
				<c:if test = "${ cnt.index % 3 == 0 }">
    				<tr>
				</c:if>
					<td>
					<a class="card-link" href='http://localhost:8080/rest/post?id=<c:out value="${a.id}" />'>
					   <div class="card">
					       <div class="image">
                                
                                    <img src="${a.image }"  width="255" height="255" />
                                		       
					       </div>
					       
					       <div class="content">
								 
									<c:out value="${a.title}" />
								
					       </div>
					   </div>
					</a>
					
					</td>
	
   	            <c:if test = "${ cnt.last ||  cnt.index % 3 == 2 }">
    				</tr>
                </c:if>
    
				
			</c:forEach>
		</table>
	</center>
	</div>
</body>
</html>