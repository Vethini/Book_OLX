<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
<%@include file='allCss.jsp' %>
</head>
<!-- <body style="background-color: #f0f2f2;"> -->
<body style="background-image: url('../img/book.jpg'); background-size: cover; background-position: center; background-attachment: fixed; background-color: #f7f7f7;">
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<%@include file="navbar.jsp" %>
 
	<c:if test="${empty userObj}">
<c:redirect url="../login.jsp" />
</c:if>
 
	<div class="container">
<div class="row">
<div class="col-md-4 offset-md-5">
<div class="card m-3" style="background-color: rgba(173, 216, 230, 0.5);">
<div class="card-body">
<h4 class="text-center text-success">Edit Books</h4>

<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>
<form action="../editBooks" method="post">
<div class="form-group">
<input type="hidden"b name="id" value="<%= b.getBookId() %>"  />
</div>
<div class="form-group">
<label for="exampleInputEmail1">Book Name*</label> 
<input name="bname" type="text" class="form-control" id="exampleInputEmail1" value="<%=b.getBookName()%>" aria-describedly="emailHelp">
</div>
<div class="form-group">
<label for="exampleInputEmail1">Author Name*</label> 
<input name="author" type="text" class="form-control" id="exampleInputEmail1" value="<%= b.getAuthor() %>" aria-describedly="emailHelp">
</div>
<div class="form-group">
<label for="exampleInputEmail1">Price*</label> 
<input name="price" type="number" class="form-control" id="exampleInputEmail1"  value="<%= b.getPrice() %>" aria-describedly="emailHelp">
</div>
<div class="form-group">
<label for="exampleInputEmail1">Book Status</label> 
<select id="inputState" name="status" class="form-control">
<% if("Active".equals(b.getStatus())){ %>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>
<%}else{%>
<option value="Inactive">Inactive</option>
<option value="Active">Active</option>
<%}%>
</select>
</div>

<button type="submit" class="btn btn-primary">Add</button>
</form>
</div>
</div>
</div>
</div>
</div>
<%-- <div class="container-fluid" style="margin-top: 15px;">
<%@include file="footer.jsp" %>
</div> --%>
<div class="container-fluid" style="margin-top: 15px;">
<%-- <%@include file="footer.jsp" %> --%>
<%@include file="../all_component/footer.jsp" %>
</div>
</body>
</html>