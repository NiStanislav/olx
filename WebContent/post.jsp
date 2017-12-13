<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	var frm = $('#buy');
	frm.submit(function( event ) {
		$.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
            		window.location.replace("http://localhost:8080/rest/buy.jsp");
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

<style>
.card img{
	margin: 0 auto;
	max-height: 350px;
	width: auto;

}

.card{
margin: 50px;
}
.buy-btn{
	margin: 15px;
}

</style>
<div class="main container">	 
	<center>
    <div class="card">
    <div class="alert alert-primary" role="alert">
  <h3>${post.title}</h3>
</div>
  <div class="thumbnail"><img class="left" src="${post.image}"></div>
  <div class="right">
  
    <div class="author">
      <h2>${post.author}</h2>
    </div>
    <div class="separator"></div>
    <div>
    <table>
               <tbody>
          
            <tr>
                <td>City: </td>
                <td> ${post.city}</td>
            </tr>
             <tr>
                <td>Price: </td>
                <td><span class="badge badge-success"> ${post.price}</span></td>
            </tr>
            <tr>
                <td>State: </td>
                <td>  ${post.state}</td>
            </tr>
           
   
     
            </tbody>
        </table>
        <h5 class="desc"> 
	            Description: 
	            ${post.description}
	          </h5>

        
       	<form id="buy" method="POST" action="/rest/buy/">
			    <input type="text"  class="form-control" id="customer"  name="customer" hidden="true" value="${sessionScope.email}">
			    <input type="text"  class="form-control" id="seller"  name="seller" hidden="true" value="${post.author}">
			    <input type="text"  class="form-control" id="title"  name="title" hidden="true" value="${post.title}">
			  <button type="submit" class="btn btn-primary buy-btn" value="submit">Buy</button>
			  </form>
			  
			          <p>views:${post.views}</p>
   		 </div>
 </div>
</div>
    </center>
 </div>
</body>
</html>