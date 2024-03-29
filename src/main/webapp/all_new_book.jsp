<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
<%@ include file="all_component/allCss.jsp" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.*" %>
<style type=text/css>
	.card-ho:hover{
		background-color: #fcf7f7;
	}
	::-webkit-scrollbar {
    display: none;
	}
	body {
		background-image: url('img/book3.png');
		background-size: cover;
		background-repeat: no-repeat;
	}
	#toast {
		min-width: 300px;
		position: fixed;
		bottom: 30px;
		left: 50%;
		margin-left: -125px;
		background: #333;
		padding: 10px;
		color: white;
		text-align: center;
		z-index: 1;
		font-size: 18px;
		visibility: hidden;
		box-shadow: 0px 0px 100px #000;
	}
	#toast.display {
		visibility: visible;
		animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
	}
	@keyframes fadeIn {from { bottom:0;
		opacity: 0;
	}
	to {
		bottom: 30px;
		opacity: 1;
	}
	}
	@keyframes fadeOut {form { bottom:30px;
		opacity: 1;
	}
	to {
		bottom: 0;
		opacity: 0;
	}
}
</style>
 
</head>
<body>
 <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<%User u = (User)session.getAttribute("userObj"); %>
 
<c:if test="${not empty addCart}">
<div id="toast"> ${addCart} </div>
 
	<script type="text/javascript">
			showToast();
			function showToast(content)
			{
			    $('#toast').addClass("display");
			    $('#toast').html(content);
			    setTimeout(()=>{
			        $("#toast").removeClass("display");
			    },2000)
			}	
</script>
<c:remove var="addCart" scope="session"/>
</c:if>
 
	<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid p-4" >
<div class="row d-flex align-items-center">

<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = dao.getAllNewBooks();
				for(BookDetails b : list){
			%>	
<div class="col-md-3 m-0.5 pb-2">
<div class="card card-ho" style="background-color: rgba(211, 211, 211, 0.7);">
<div class="card-body text-center">
<!--  	<img src="book/<%= b.getRefId() %>" style="height:200px; width: 150px" class="img-thumblin"/> -->

<h4><%= b.getBookName() %></h4>
<p><%= b.getAuthor() %></p>
<p><%= b.getRefId() %></p>
<p> Category: <%= b.getBookCategory() %> </p>
<div class="row d-flex justify-content-around">
<% if(u == null){ %>
<a href="login.jsp" class="btn btn-danger btn-sm mr-1"><i class="fa-solid fa-cart-plus fa-2xs"></i> Add Cart</a>
<%}else{
	 String returnTo = request.getParameter("returnTo");
	    if (returnTo == null || returnTo.isEmpty()) {
	        returnTo = request.getRequestURI(); // Default return page if not specified
	    }
	%>
<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&returnTo=<%=returnTo%>" class="btn btn-danger btn-sm mr-1"><i class="fa-solid fa-cart-plus fa-2xs"></i> Add Cart</a>
<%} %>
<a href="view_books.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm mr-1">View Details</a>
<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
</div>
</div>
</div>
</div>
<%	}
			%>

</div>
 
	</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>