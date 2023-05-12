<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>signup</title>
<%@include file="component/allcss.jsp"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-1">
				<h3>Student Register</h3>
				<form action='user_register' method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="fullname" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="reg" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password" />
					</div>
					<button type=submit >Register </button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>