<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.Courselist_dao"%>
<%@page import="com.entity.retrive_course_model"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.btn-color {
	background-color: #0e1c36;
	color: #fff;
}

.mycss {
	color: #007bff;
	font-size: 35px;
	text-align: center;
	font-family: Open Sans;
	margin-bottom: 30px;
}

.profile-image-pic {
	height: 200px;
	width: 200px;
	object-fit: cover;
}

.cardbody-color {
	background-color: #ebf2fa;
}

.container {
	height: 1500px;
	width: 1000px;
	margintop: -50px;
}

a {
	text-decoration: none;
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card my-5">
						<form class="card-body cardbody-color p-lg-5" action='user_register' method="post">
							<h3 class="mycss">Student Login</h3>
							<div class="text-center">
								<img
									src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png"
									class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
									width="200px" alt="profile">
							</div>
                            <div class="mb-3">
								<input type="text" class="form-control" name="fullname"
									aria-describedby="emailHelp" placeholder="Fullname">
							</div>
							<div class="mb-3">
								<input type="text" class="form-control" name="reg"
									aria-describedby="emailHelp" placeholder="Registration no">
							</div>
							<div class="mb-3">
								<input type="password" class="form-control" name="password"
									placeholder="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-color px-5 mb-5 w-100">Register</button>
							</div>
							<div id="emailHelp" class="form-text text-center mb-5 text-dark">
								Already Registered? <a href="index.jsp" class="text-dark fw-bold">
									Login</a>
							</div>
							<div id="emailHelp" class="form-text text-center mb-5 text-dark ">
								<a href="adminlogin.jsp" class="text-dark fw-bold">AdminLogin</a> 
								<a href="teacherlogin.jsp" class="text-dark fw-bold">TeacherLogin</a>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

	</div>







</body>
</html>