
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Table </title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<style type="text/css">
	
	body{

		margin: 0px;
		border:0px;
		background: url(img/adminbg1.jpg);
		background-size: cover;
		background-position: center;
		background-attachment: fixed;
	}

	.header{
		width: 100%px;
		height: 120%px;
		background-color: black;
		color: white;
		border-radius: 20px;
		font-size: 25px;

		
	}
	#image{
		height: 100px;
		background-color: white;
		border-radius: 50px;
		position: a
		
		
		
	}
	.main-content{
		display: flex;
	
		flex: 1;
		height: 530px;
		background-color: #1D201D;
		border-radius: 20px;
	}
	.content{
		flex: 3;
		height: 530px;
		background-color: #34495e;
		font-size: 30px;
		font-weight: bold;
		border-radius: 20px;
	}
	ul li{
		padding: 20px;
		border-bottom: 2px solid grey;
		list-style-type: none;
		font-size: 30px;
		color: #FBFCFC;
	}
	ul li:hover{
		background-color: #25B205;
		color: #000;
	}


table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 70%;
  background-color: #5592CF;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 3px;
  

}

.tdm{
	background-color: green;
}

a{

text-decoration:none;

}


</style>

<body>

<div class="bg"></div>
<% 


String name = request.getParameter("name");
%>
	<div class="header"><img src="img/admin1.png" alt="adminicon" id="image" style="position:absolute;left:45%;">
	<br><br><br><h4 align="center">Welcome to the Admin Dashboard!</h4><h3><% out.println("Admin Name: "+name);%></h3>
	
	</div>
	<div class="main-content">
		<div class="sidebar">
		<ul>
			<a href="adminlog.jsp?name=<%= name %>"><li>Home</li></a>
			<a href="adminStudentController?name=<%= name %>"><li>Student details</li></a>
			<a href="LectureUpdateController?name=<%= name %>"><li>Lecture details</li></a>
			<a href="admin.jsp"><li>Logout</li></a>
	</ul>
			</div>
	
	
	
	<div id="container">
		
			<br>
		<input type="button" value="Add Lecture" onclick="window.location.href='addLecture.jsp'; return false;"
		class="add-student-button"
		/>
		<table>
			<tr>
				<th>ID </th>
				<th>Name </th>
				<th>NIC </th>
				<th>MODULE </th>
				<th>TELEPHONE </th>
				<th>Lecture ID </th>
				<th>Update </th>
				<th>Delete </th>
			</tr>
			
			<c:forEach var="tempLecture"  items="${LECTURE_LIST}">
				
				<c:url var="tempLink"  value="LectureUpdateController"> 
					<c:param name="command" value="LOAD"/>
					<c:param name="lectureId" value="${tempLecture.id}" />
				</c:url>
				
				<c:url var="deleteLink"  value="LectureUpdateController"> 
					<c:param name="command" value="DELETE"/>
					<c:param name="lectureId" value="${tempLecture.id}" />
					
			
				</c:url>
				
				<tr>
					<td>   ${tempLecture.id}    </td>
					<td>   ${tempLecture.name}  </td>
					<td>   ${tempLecture.nic}   </td>
					<td>   ${tempLecture.lecmodule}</td>
					<td>   ${tempLecture.tel}</td>
					<td>   ${tempLecture.lecid}   </td>
					<td><a href="${tempLink}">Update</a></td>
						
						<td><a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this Lecture?'))) return false">
							Delete</a>
					
					</td>
					
					
				</tr>
				
			</c:forEach>
		</table>
	
	</div>
	</div>
	</div>
	
</body>
</html>