<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Update Page</title>
<%@ include file="all_component/allCss.jsp" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.*" %>

</head>
<!-- <body style="background-color: #f7f7f7;"> -->
<body style="background-image: url('img/address1.jpg'); background-size: cover;">
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<%@include file="all_component/navbar.jsp" %>
		
<c:if test="${empty userObj}">
	<c:redirect url="login.jsp" />
</c:if>


	<div class="container" >
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card" style="background-color: rgba(173, 216, 230, 0.5);">
					<div class="card-body">
						<h3 class="text-center text-success">Add Address</h3>
					
						<form action="">
						
						  <div class="form-row">
						    
						    <div class="form-group col-md-6">
						      <label for="inputPassword4">Address</label>
						      <input type="text" class="form-control" id="inputPassword4" >
						    </div>
						    
						    <div class="form-group col-md-6">
						      <label for="inputPassword4">Landmark</label>
						      <input type="text" class="form-control" id="inputPassword4" >
						    </div>
						    
						  </div>
						  
						  <div class="form-row">
						    <div class="form-group col-md-4">
						      <label for="inputEmail4">City</label>
						      <input type="text" class="form-control" id="inputEmail4" >
						    </div>
						    <div class="form-group col-md-4">
						      <label for="inputPassword4">State</label>
						      <input type="text" class="form-control" id="inputPassword4" >
						    </div>
						    <div class="form-group col-md-4">
						      <label for="inputPassword4">Pincode</label>
						      <input type="number" class="form-control" id="inputPassword4" >
						    </div>
						  </div>
							
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

		<%@include file="all_component/footer.jsp" %>
</body>
</html>