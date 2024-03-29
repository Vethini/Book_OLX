<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BOOK OLX: Login</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<!-- <body style="background-color: #f0f1f2;"> -->
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<style>
    body {
        background-image: url('img/login.jpg'); /* Adjust the image URL */
        background-size: cover;
        background-position: center;
    }
</style>

<%@include file="all_component/navbar.jsp" %>

	<div class="container p-3" style="margin-right: -100px;" >
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card" style="background-color: rgba(173, 216, 230, 0.5);">
					<div class="card-body">
						<h4 class="text-center">Login</h4>
						
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger"> ${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success"> ${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action='login' method="POST">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required"  placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required="required"  placeholder="Enter Password">
						     <a href="forgotPassword.jsp">Forgot Password?</a>
						  </div>
						  <div class="text-center">
						  	<button type="submit" class="btn btn-primary">Login</button><br>
						  	<a href="registration.jsp">Create Account</a>
						  </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid fixed-bottom">
		<%@include file="all_component/footer.jsp" %>
	</div>
</body>
</html>