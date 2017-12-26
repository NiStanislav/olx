<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://olxkz-static.akamaized.net/static/olxkz/naspersclassifieds-regional/olxeu-atlas-web-olxkz/static/img/favicon.ico?v=4">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OLX</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
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
	
	<%@include file="header.jsp" %>
	<div class="container">
	<form action="/rest/search" style="margin: 50px">
     <div class="modal_dropdown-content">
     	<div class="dropdown-content">
     		<input type="text" name="search"  class="form-control" placeholder="I'm searching for...">
     		<div class="row" style="margin-top:14px;">
     			<div class="col">
				<label>Sort by:</label>
     		<select class="form-control" name="order">
   				 <option checked="checked">price</option>
    				<option>views</option>
   				 <option>date</option>
  			</select>
  			</div>
  				<div class="col">
  			<label>Category:</label>
  				<select class="form-control" name="category">
   				 <option checked="checked">All</option>
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
  				</div>
  				</div>
  			<div class="row" style="margin-top:14px;">
  				<div class="col-12">
  				<label>Price range:</label>
  				</div>
  				
     			<div class="col">	
  					<input type="text" class="form-control" name="from" placeholder="from">
  				</div>
  				<div class="col">	
  					<input type="text" class="form-control" name="to" placeholder="to">
				</div>
			</div>
				<center>
				<input type="submit" class="btn btn-primary btn-block" value="Search" style="margin-top:14px;">
		</center>
     	</div>
     </div>
     </form>
     </div>
	<div class="main container">
	<center>
	<table>
	<style>
	td{
		padding: 0;
	}
	div.image{
		background: #f7f7f7;
	}
	.image img{
		display: block;
		margin: 15px auto;
	}
	.card{
		min-width: 250px;
		min-height: 250px;
		text-align: center;
		border-radius: 0;
		margin: 7px;
	}
	.card:hover {
    		box-shadow: 0 2px 20px rgba(0,0,0,.1), 0 1px 14px rgba(0,0,0,.2);
    }
	a{
		cursor: pointer;
		text-decoration: none;
	}
	
	</style>
			<c:forEach items="${posts}" var="a" varStatus="cnt">
				<c:if test = "${ cnt.index % 4 == 0 }">
    				<tr>
				</c:if>
					<td>
					<a class="card-link" href='http://localhost:8080/rest/post?id=<c:out value="${a.id}" />'>
					   <div class="card">
					       <div class="image">
                                
                                    <img src="${a.image }"  width="180" height="180" />
                                		       
					       </div>
					       
					       <div class="content">
								 
									<c:out value="${a.title}" />
									<br>
									<b><p><c:out value="${a.price} TG" /></p></b>
								
					       </div>
					   </div>
					</a>
					
					</td>
	
   	            <c:if test = "${ cnt.last ||  cnt.index % 4 == 3 }">
    				</tr>
                </c:if>
    
				
			</c:forEach>
		</table>
	</center>
	</div>
	<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>