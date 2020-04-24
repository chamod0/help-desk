<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<title>Update Student</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-student-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Update Student Details</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Update Student's Following Fields</h3>
		
		<form action="adminStudentController" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="studentId" value="${THE_STUDENT.id}" />
			
			<table>
				<tbody>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="name" 
								   value="${THE_STUDENT.name}" /></td>
					</tr>

					<tr>
						<td><label> Email</label></td>
						<td><input type="text" name="email" 
								   value="${THE_STUDENT.email}" /></td>
					</tr>

					<tr>
						<td><label>Registration No </label></td>
						<td><input type="text" name="regno" 
								   value="${THE_STUDENT.regno}" /></td>
					</tr>
					<tr>
						<td><label>NIC</label></td>
						<td><input type="text" name="nic" 
								   value="${THE_STUDENT.nic}" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="adminStudentController">Back to List</a>
		</p>
	</div>
</body>

</html>











    