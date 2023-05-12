<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <h2>Teacher and Course Form</h2>
	<form method="post" action="TeacherCourseServlet">
		<label for="teacher_name">Teacher Name:</label>
		<input type="text" id="teacher_name" name="teacher_name"><br><br>
		<label for="course_name">Course Name:</label>
		<input type="text" id="course_name" name="course_name"><br><br>
		<input type="submit" value="Submit">
	</form>
</body>
</html>