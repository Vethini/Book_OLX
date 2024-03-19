<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings Page</title>
<%@ include file="all_component/allCss.jsp" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.*" %>
<style>
	a{
	text-decoration: none;
	color: black;
	text-select: none;
	}
	a:hover{
		color: red:
	}
</style>
</head>
<!-- <body style="background-color: #f7f7f7;"> -->
<body style="background-image: url('img/setting.jpg'); background-size: cover; background-position: center; background-attachment: fixed; background-color: #f7f7f7;">
		<%-- <%@include file="all_component/navbar.jsp" %> --%>
		<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
		<%@include file="all_component/navbar.jsp" %>
		
<c:if test="${empty userObj}">
	<c:redirect url="login.jsp" />
</c:if>

<%User u = (User)session.getAttribute("userObj"); %>	
	
	<%-- <div class="container">
	
			<h3 class="text-center m-2"><%= u.getName() %></h3>
		<div class="row p-2">
			
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			

			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="Edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div> --%>
			<!-- <div class="col-md-4 mt-3">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h3>Your Address</h3>
							<p> Edit Address </p>
						</div>
					</div>
				</a>
			</div> -->
		<!-- <div class="col-md-4">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p> Track your order</p>
						</div>
					</div>
				</a>
			</div> -->
			
			<!-- <div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p> 24 * 7 Service </p>
						</div>
					</div>
				</a>
			</div> -->
			<div class="container">
<%--     <h2 class="text-center m-2"><%= u.getName() %></h2> --%>
<%-- <h1 style="text-align: center; margin: 20px;"><%= u.getName() %></h1> --%>
 <h1 style="text-align: center; margin: 20px; color: blue;"><%= u.getName() %></h1>
<%-- <h1 style="text-align: center; margin: 20px; color: #00008B;"><%= u.getName() %></h1> --%>



    <div class="row p-2">
        <div class="col-md-6">
            <a href="sell_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fa-solid fa-book-open fa-3x"></i>
                        </div>
                        <h3>Sell Old Book</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6">
            <a href="old_books.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fa-solid fa-book-open fa-3x"></i>
                        </div>
                        <h3>Old Book</h3>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="row p-2">
        <div class="col-md-6">
            <a href="Edit_profile.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fa-solid fa-pen-to-square fa-3x"></i>
                        </div>
                        <h3>Edit Profile</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 ">
            <a href="order.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-danger">
                            <i class="fa-solid fa-box-open fa-3x"></i>
                        </div>
                        <h3>My Orders</h3>
              <!--           <p>Track your order</p> -->
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
			
			
		
		</div>
	
	</div>
	
		<%@include file="all_component/footer.jsp" %>
</body>
</html> 