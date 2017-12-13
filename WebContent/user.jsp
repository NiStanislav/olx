<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

        
    </center>
    </div>
</body>
</html>