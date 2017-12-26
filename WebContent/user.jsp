<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://olxkz-static.akamaized.net/static/olxkz/naspersclassifieds-regional/olxeu-atlas-web-olxkz/static/img/favicon.ico?v=4">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${user.name}</title>
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
</head>
<body>
<%@include file="header.jsp" %>
		<div class="main">
 	<center>
 	<div class="card-user">
  <img src="https://www.w3schools.com/howto/img_avatar.png"  >
  <div class="container">
    <h4><b>${user.name}</b></h4> 
    <p>${user.surname}</p>
    <p>${email}</p> 
    <p>${user.phone}</p>
  </div>
</div>
<table>
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
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>