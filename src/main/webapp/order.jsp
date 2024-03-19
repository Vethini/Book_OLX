<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Details</title>
<%@ include file="all_component/allCss.jsp" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.*" %>

<style>
  body {
    background-image: url('img/order4.jpg');
    background-size: cover;
    background-position: center-top;
  }
  .table-container {
    padding-top: 50px; /* Adjust the padding as needed */
    overflow-y: auto; /* Enable vertical scrolling */
    max-height: 80vh; /* Set maximum height to 80% of the viewport height */
  }
  /* Hide scrollbar for Chrome, Safari and Opera */
  .table-container::-webkit-scrollbar {
    display: none;
  }
  /* Hide scrollbar for IE and Edge */
  .table-container {
    -ms-overflow-style: none;
    scrollbar-width: none;
  }
  /* Responsive styles */
  @media (max-width: 768px) {
    .table-container {
      padding-top: 80px;
    }
  }
</style>

</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<%@include file="all_component/navbar.jsp" %>
    
<c:if test="${empty userObj}">
  <c:redirect url="login.jsp" />
</c:if>


<div class="container p-1 table-container mt-3">
  <h3 class="text-center text-primary">Your Order</h3>
  <table class="table table-striped mt-3">
    <thead class="bg-primary text-white">
      <tr>
        <th scope="col">Order Id</th>
        <th scope="col">Name</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
      </tr>
    </thead>
    <tbody>
      <%
        User u = (User)session.getAttribute("userObj");
        BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
        List<BookOrder> blist =  dao.getBook(u.getEmail());
        for(BookOrder b: blist){
      %>
        <tr>
          <th scope="row"><%= b.getOrderId() %></th>
          <td><%= b.getUserName() %></td>
          <td><%= b.getBookname() %></td>
          <td><%= b.getAuthor() %></td>
          <td><%= b.getPrice() %></td>
          <td><%= b.getPaymentType() %></td>
        </tr>
      <% }
      %>
    </tbody>
  </table>
</div>
        
</body>
</html>
