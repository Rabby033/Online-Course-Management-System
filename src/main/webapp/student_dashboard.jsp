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
<title>Student</title>
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
	margin-bottom:30px;
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
  text-align:center;
  color: #333;
}
head{
  text-align:center;
  text-color:red;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	Connection conn = DBconnect.getConn();
	//out.print(conn);
	%>
	<br>
	<br>
	<br>
	<%
	String regi = (String) session.getAttribute("user_reg");
	%>

	<%
	List<String> list2 = new ArrayList<String>();
	int count = 0;
	String s2 = null;
	try {

		String sql = "SELECT course FROM register_course WHERE reg='" + regi + "'";
		PreparedStatement ps = conn.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			s2 = rs.getString(1);
			list2.add(s2);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>


	<div class="container">
		<div class="card">
			<h3 class="kechal">Enroll new course</h3>
			<form action="enrollCourse" method="post">
				<label for="courseList" class="act"><h5 class="head">Select a course  :</h3></label><select
					name="course_name">
					<%
					Courselist_dao dao = new Courselist_dao(DBconnect.getConn());
					List<String> list = dao.Course_list();
					for (String s : list) {
					%>
					<option value=<%=s%>>
						<%=s%></option>
					<%
					}
					%>
				</select>
				<br>
				<button type="submit" class="but">Enroll</button>
			</form>
		</div>
		<div class="card">
			<h3 class="kechal">Registered course</h3>
			<table id="course-table">
				<thead>
					<tr>
						<th>Serial No</th>
						<th>Course Name</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (String name : list2) {
						count++;
					%>
					<tr>
						<td><%=count%></td>
						<td><%=name%></td>
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