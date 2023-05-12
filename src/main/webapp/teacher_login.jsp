<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>teacher login</title>
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
				<h3>Login for teacher</h3>
				<form>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Your Email *"
							value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Your Password *" value="" />
					</div>
					<div class="form-group">
						<input type="submit" class="btnSubmit" value="Login" />
					</div>
					<div class="form-group">
						<a href="#" class="ForgetPwd">Forget Password?</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>