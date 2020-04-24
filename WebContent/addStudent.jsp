<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List, java.util.*, com.student.admin.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student </title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-student-style.css">
	
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Student Accounts</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Add Student</h3>
		
		<form action="adminStudentController" method="GET">
			<input type="hidden" name="command" value="ADD">
			
			<table>
				<tbody>
					<tr>
						<td><label>Name:</label></td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td><label>Email:</label></td>
						<td><input type="text" name="email" /></td>
					</tr>
					<tr>
						<td><label>Registration No:</label></td>
						<td><input type="text" name="regno" /></td>
					</tr>
					<tr>
						<td><label>NIC:</label></td>
						<td><input type="text" name="nic" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
					
					
				
				</tbody>
			
			</table>
		
			
		</form>
			<div style="clear":both;"> </div>
			<p>
				<a href="adminStudentController">Back </a>
			</p>
	</div>
</body>
</html>