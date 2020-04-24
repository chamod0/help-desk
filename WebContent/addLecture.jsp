<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Lecture </title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-student-style.css">
	
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Lecture Accounts</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Add Lecture</h3>
		
		<form action="LectureUpdateController" method="GET">
			<input type="hidden" name="command" value="ADD">
			
						<label>Name:</label>
						<input type="text" name="name" /><br>
					
						<label>NIC:</label>
						<input type="text" name="nic" /><br>
					
						<label>Lecture module:</label>
						 <select id="lec" name="lecmodule">
             	 			<option >Module</option>
  							<option value="OOP">OOP</option>
 							<option value="SE">SE</option>
 							<option value="DMS">DMS</option>
 							<option value="CN">CN</option>
  			  			 </select><br>
				
						<label>email:</label>
						<input type="text" name="email" /><br>
					
			
					
						<label>pass:</label>
						<input type="text" name="pass" /><br>
					
						<label>repass:</label>
						<input type="text" name="repass" /><br>
					
						<label>tel:</label>
						<input type="text" name="tel" /><br>
					
						<label>Lecture ID:</label>
						<input type="text" name="lecid" /><br>
				
					
					
	
						<label></label>
						<input type="submit" value="Save" class="save" />
					
				</form>
			<div style="clear":both;"> </div>
			<p>
				<a href="LectureUpdateController">Back </a>
			</p>
	</div>
</body>
</html>