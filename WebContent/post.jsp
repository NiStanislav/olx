<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://olxkz-static.akamaized.net/static/olxkz/naspersclassifieds-regional/olxeu-atlas-web-olxkz/static/img/favicon.ico?v=4">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${post.title}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"	>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>

<%@include file="header.jsp" %>

<style>
body{
background: #f7f7f7;
}
.card img{
	display: block;
	width: 100%;
	height: auto;
	

}

.card{
margin: 50px;
}
.buy-btn{
	margin: 15px;
}
.price-label {
    padding: 9px 5px;
    margin: 0 0 10px -5px;
    position: relative;
    border: 1px solid #efefef;
    border-left: none;
    border-radius: 0 4px 4px 0;
    background: #fff;
    color: #414e41;
    text-align: center;
    line-height: 34px;
    height: 67px;
    
  }
  .price-label:before {
    width: 17px;
    height: 67px;
    background: url(https://olxkz-static.akamaized.net/static/olxkz/packed/img/2f21e1fceb819e1f26ef3f8d8eb7930ddb.png) no-repeat;
    position: absolute;
    top: 0;
    left: -17px;
    content: '';
}

.offer-user__image {
    width: 80px;
    height: 80px;
    border: 3px solid #007bff;
    border-radius: 50%;
    box-sizing: border-box;
    background: #fff;
    text-align: center;
    overflow: hidden;
    margin: 0 auto;
    display: block;
}


</style>

<div class="container">
<div class="row">
  <div class="col-8">
  	<div class="card">
  	  <img class="card-img-top" src="${post.image}" alt="Card image cap">
  	   <div class="card-body">
	    <h4 class="card-title">${post.title}</h4>
	    
	    	 <p class="card-text"> State: 
	    	   ${post.state}
	    	   </p>
                
              <p class="card-text">   Category: <a href="http://localhost:8080/rest/search?search=&order=price&category=${post.category}&from=&to="> ${post.category}</a></p>
	    <p class="card-text"> ${post.description}</p>
	  </div>
  	</div>
  </div>
  <div class="col-4 text-center">
  	<div class="price-label" style="margin: 50px 0; margin-bottom: 20px;">
  		<strong style="margin-top: 7px;"><h2>${post.price} tenge</h2></strong>
  	</div>
<%--   	<h4>${post.author}</h4> --%>
  	<h3 style="margin-bottom: 20px;" ><span class="badge badge-info">${post.city}</span></h3>
  	
  	<div class="offer-user__image"  style="margin-bottom: 20px;">
          <i style="color:#007bff; margin:10px" class="fa fa-user-o fa-3x" aria-hidden="true"></i>
   </div>
  	<h3><span class="badge badge-light"><a href="http://localhost:8080/rest/user?email1=${post.author}">${post.author}</a></span></h3>
  	<h3><span class="badge badge-primary" style="margin-bottom: 20px;">${post.phone}</span></h3>
        
        	<form id="buy" method="POST" action="/rest/buy/"  style="margin-bottom: 20px;">
  <div class="form-group" >
    <input type="text"  class="form-control" id="customer"  name="customer" hidden="true" value="${sessionScope.email}">
    <input type="text"  class="form-control" id="seller"  name="seller" hidden="true" value="${post.author}">
    <input type="text"  class="form-control" id="title"  name="title" hidden="true" value="${post.title}">
    <textarea class="form-control" name="text" rows="3"></textarea>
    <button type="submit" class="btn btn-primary" style="margin-top:20px;">Contact with author</button>
  </div>
</form>
  </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>