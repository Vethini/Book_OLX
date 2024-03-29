<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file='allCss.jsp' %>
<style>
  body {
    background-image: url('../img/book3.jpg');
    background-size: cover;
}

</style>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<%@include file="navbar.jsp" %>
	
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>
	
	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	
	<table class="table table-striped">
	  <thead class="bg-primary text-white">
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Book Name</th>
	      <th scope="col">referenceId</th>
	      <th scope="col">Author Name</th>
	      <th scope="col">Price</th>
	      <th scope="col">Categories</th>
	      <th scope="col">Status</th>
	      <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	  <%
	  	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	  	List <BookDetails> list = dao.getAllBooks();
	  	for(BookDetails b: list){%>
	  		
	  		 <tr>
		      <td><strong><%= b.getBookId() %></strong></td>
		      <td><strong><%= b.getBookName() %></strong></td>
		      <td><strong><%= b.getRefId() %></strong></td>
		      <td><strong><%= b.getAuthor() %></strong></td>
		      <td><strong><%= b.getPrice() %></strong></td>
		      <td><strong><%= b.getBookCategory() %></strong></td>
		      <td><strong><%= b.getStatus() %></strong></td>
		      <td>
		      	<a href="edit_books.jsp?id=<%= b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
		      	<a href="../delete?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
		      </td>
		    </tr>
	  		
	  	<%}
	  	
	  %>
	   
	  </tbody>
	</table>

<%-- <div class="container-fluid fixed-bottom">
	<%@include file="footer.jsp" %>
</div> --%>
<%-- <div class="container-fluid fixed-bottom"">
    <%@include file="footer.jsp" %>
</div> --%>
<div class="container-fluid" style="margin-top: 15px;">
	<%-- <%@include file="footer.jsp" %> --%>
  <%-- 	<%@include file="../all_component/footer.jsp" %> --%>
</div>

</body>
</html>