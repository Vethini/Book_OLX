<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book Page</title>
<%@ include file="all_component/allCss.jsp" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.*" %>

</head>
<!-- <body style="background-color: #f7f7f7;"> -->
<body style="background-image: url('img/book.jpg'); background-size: cover;">
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<%@include file="all_component/navbar.jsp" %>
		
<c:if test="${empty userObj}">
	<c:redirect url="login.jsp" />
</c:if>
<%User u = (User)session.getAttribute("userObj"); %>

	<div class="container mt-3">
	
		<div class="row">
			<div class="col-md-4 offset-md-5">
				<div class="card" style="background-color: rgba(173, 216, 230, 0.5);">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Sell Old Book</h5>
						
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger"> ${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success"> ${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action="add_old_Books" method="post" enctype="multipart/form-data">
						
							<input name="user" type="hidden" value="<%=u.getEmail()%>" >
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> 
								<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> 
								<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> 
								<input name="price" type="number" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Reference Id*</label> 
								<input name="referenceId" type="number" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							
							
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
		<%@include file="all_component/footer.jsp" %>
</body>
</html>