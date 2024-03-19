<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
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
</style>

</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
		<%@include file="all_component/navbar.jsp" %>
		<%User u = (User)session.getAttribute("userObj"); %>
		<div class="container-fluid p-4">
			<div class="row d-flex align-items-center">
				
		
			<%
			 String ch = request.getParameter("ch");
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list2 = dao2.getBookBySearch(ch);
				for(BookDetails b : list2){
			%>	
				
			<div class="col-md-3 m-0.5 pb-2">
				
				<div class="card card-ho"  style="background-color: rgba(211, 211, 211, 0.7);">
					<div class="card-body text-center">
					    <p><%= b.getRefId() %></p>
						<p><%= b.getBookName() %></p>
						<p><%= b.getAuthor() %></p>
						<p> Category: <%= b.getBookCategory() %> </p>
						
						<%
							if(b.getBookCategory().equals("Old")){ %>
							<div class="row d-flex justify-content-around">
								<a href="view_books.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm mr-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
							</div>
							<%}else{ %>
							<div class="row d-flex justify-content-around" >
							<% if(u == null){ %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1"><i class="fa-solid fa-cart-plus fa-2xs"></i> Add Cart</a>
							<%}else{ %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm mr-1"><i class="fa-solid fa-cart-plus fa-2xs"></i> Add Cart</a>
							<%} %>	
								<a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
							</div>
							
						<%	}
						%>
						
						
					</div>
				</div>
					
			</div>
			
			<%	}
			%>
			
		</div>
					
				
		</div>
		
</body>
</html>