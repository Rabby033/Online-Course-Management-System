<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.Courselist_dao"%>
<%@page import="com.entity.retrive_course_model"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher</title>
<%@include file="component/allcss.jsp"%>
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
.my-btn {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
}

.my-btn:hover {
    background-color: #3e8e41;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	Connection conn = DBconnect.getConn();
	%>















	<%
	String name = (String) session.getAttribute("user_reg");
	List<String> list = new ArrayList<String>();
	String s = null;
	try {

		String sql = "SELECT course_name FROM assign_course where teacher_name=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, name);

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
	<%
	String selectedCourse = null;
	if (request.getMethod().equals("POST")) {
		selectedCourse = request.getParameter("course_name");
		// Your database query code here   
	}
	%>
	<%
	List<String> slist = new ArrayList<String>();
	int count = 0;
	try {

		String sql = "SELECT reg FROM register_course where course=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, selectedCourse);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString(1));
			slist.add(rs.getString(1));
	%>
	<%
	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<div class="container">
		<div class="card">
			<h3 class="kechal">Assigned Courses</h3>

			<%
			for (String x: list) {
			%>
                <button class="my-btn"><%=x%></button>
			<%
			}
			%>
		</div>
	</div>


	<div class="container">
		<div class="card">
			<h3 class="kechal"></h3>
			<form method="post">
				<label for="courseList">Select a course:</label> <select
					name="course_name" onchange="this.form.submit()">
					<option >select</option>
					<%
					for (String ss : list) {
					%>
					<option value="<%=ss%>"
						<%=ss.equals(selectedCourse) ? "selected" : ""%>>
						<%=ss%>
					</option>
					<%
					}
					%>
				</select>
			</form>
		</div>
		<div class="card">
			<h3 class="kechal">Registered Students</h3>
			<table id="course-table">
				<thead>
					<tr>
						<th>Serial No</th>
						<th>Course Name</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (String ss : slist) {
						count++;
					%>
					<tr>
						<td><%=count%></td>
						<td><%=ss%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>