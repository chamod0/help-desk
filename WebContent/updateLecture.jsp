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
<div class ="bg"></div>
	<div id="wrapper">
		<div id="header">
			<h2>Update Lecture Details</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Update Lecture's Following Fields</h3>
		
		<form action="LectureUpdateController" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="lectureId" value="${THE_LECTURE.id}" />
			
			<table>
				<tbody>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="name" 
								   value="${THE_LECTURE.name}" /></td>
					</tr>

					
					<tr>
						<td><label>NIC</label></td>
						<td><input type="text" name="nic" 
						 value="${THE_LECTURE.nic}" /></td>
					</tr>
					<tr>
						<td><label>Module</label></td>
						<td><input type="text" name="lecmodule" 
								   value="${THE_LECTURE.lecmodule}" /></td>
					</tr>

					
					<tr>
						<td><label>Email</label></td>
						<td><input type="text" name="email" 
								   value="${THE_LECTURE.email}" /></td>
					</tr>
					<tr>
						<td><label>Telephone</label></td>
						<td><input type="text" name="tel" 
								   value="${THE_LECTURE.tel}" /></td>
					</tr>
					<tr>
						<td><label>Lecture ID</label></td>
						<td><input type="text" name="lecid" 
								   value="${THE_LECTURE.lecid}" /></td>
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
			<a href="LectureUpdateController">Back to List</a>
		</p>
	</div>
</body>

</html>











    