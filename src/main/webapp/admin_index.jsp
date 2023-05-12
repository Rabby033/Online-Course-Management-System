<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.Courselist_dao"%>
<%@page import="com.entity.retrive_course_model"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="//component/allcss.jsp"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
</style>
<style type="text/css">
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

.card {
	background-color: #fff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 300px;
	margin: 10px;
	display: inline-block;
	vertical-align: top;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.card-content {
	padding: 10px;
}

.card-title {
	font-size: 1.5em;
	font-weight: bold;
	margin: 10px 0;
}

.card-description {
	font-size: 1.2em;
	line-height: 1.5;
	margin: 10px 0;
}

.card-button {
	display: block;
	background-color: #4CAF50;
	color: #fff;
	text-align: center;
	padding: 10px;
	border-radius: 5px;
	text-decoration: none;
	margin: 10px 0;
}

.card-button:hover {
	background-color: #3e8e41;
}

.container {
	display: flex;
	flex-wrap: wrap;
	margin-top: 50px;
	justify-content: center;
}

.kechal {
	text-align: center;
	font-family: "Helvetica Neue", sans-serif;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 30px;
}

.card {
	background-color: #fff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: calc(50% - 20px);
	margin: 10px;
	display: inline-block;
	padding: 10px;
	transition: 0.3s;
	width: calc(50% - 20px);
	margin: 10px;
	display: inline-block;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	margin-top: 10px;
	background-color: #f2f2f2;
}

th, td {
	text-align: left;
	padding: 8px;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button[type="submit"] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.but {
	display: block;
	margin-left: 50px;
}

button[type="submit"] {
	margin-left: 170px;
	margin-top: 60px;
	background-color: #3e8e41;
}

label.act {
	font-family: "Arial", sans-serif;
	font-size: 18px;
	text-align: center;
	color: #333;
}

head {
	text-align: center;
	text-color: red;
}

.form-group {
	margin-bottom: 20px;
}

.form-control {
	display: block;
	width: 50%;
	height: 40px;
	padding: 10px;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #ccc;
	background-color: #fff;
}

select {
	border: 2px solid #3e8e41;
	border-radius: 4px;
	padding: 8px;
	font-size: 16px;
}

option {
	font-size: 16px;
	background-color: #fff;
	color: #555;
}

.form-control:focus {
	outline: none;
	border: 1px solid #3e8e41;
	box-shadow: 0 0 5px #3e8e41;
}
</style>
</head>
<body>
	<%@include file="//admin/navbar.jsp"%>
	<%
	//connection variable to access database;

	Connection conn = DBconnect.getConn();
	%>
	<%
	//retrive teacherlist from database
	List<String> list = new ArrayList<String>();
	int count = 0;
	try {
		//sql query 
		String sql = "SELECT name FROM teacher_list ";
		PreparedStatement ps = conn.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString(1));
			list.add(rs.getString(1));
	%>
	<%
	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<div class="container">
		<div class="card">
			<h3 class="kechal">Assign Course</h3>
			<form action='assign' method="post">
				<div class="form-group">
					<input type="text" class="form-control" name="coursename"
						placeholder="Enter course name" />
				</div>
				<label for="courseList">Assign teacher:</label> <select
					name="teacher_name">
					<option>select</option>
					<%
					for (String name : list) {
					%>
					<option value=<%=name%>><%=name%></option>
					<%
					}
					%>
				</select> <br>
				<button type=submit>Assign Course</button>
			</form>
		</div>
	</div>
</body>
</html>