<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Edit Lecture Profiles</title>

<link rel="stylesheet" type="text/css" href="css/profilestyle.css">
<link rel="stylesheet" type="text/css" href="index.css">

</head>

<body>
<div class="bg"></div>

 <% String lecid = request.getParameter("lecid");%>

<br>
<ul>
  <li><a href="loglecindex.jsp?lecid=<%=lecid%>">Home</a></li>
  <li><a href="lindex.jsp?lecid=<%=lecid%>">Lecturer</a></li>
  <li><a href="contactlec.jsp?lecid=<%=lecid%>">Contact</a></li>
	<li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
    <li style="float:right"><a >   </a></li>
   <li style="float: right"><% out.println();%></li>
    
    <c:url var="updatelink" value="LectureUpdateController">
		<c:param name="command" value="LIST2" />
		<c:param name="lecid" value="<%=lecid%>" />
	</c:url>
   <br>
  <a  style="float: right" href="${updatelink}">Lecture ID <% out.println(": "+lecid);%></a>
</ul>

<div class = "box">
		<h3>Edit Lecture profile</h3>
		
		<form action="LectureUpdateController?lecid=<%= lecid %>" method="GET">
		
			<input type="hidden" name="command" value="PROUPDATE" />

			<input type="hidden" name="lectureId" value="${THE_LECTURE.id}" />
			
			<table>
				<tbody>
					<img src="img/lectureprofile.png" alt="profile picture" style="width:200px;height:200px;margin: 10px 40px">
   
   						 <br>
   	 				<input type="file" name="pic" accept="image/*" style="width:50px height:50px">
    				<input type="button" name="delete" value="Remove Profile Picture" style="padding: 0;float:none; border-radius: 0;">
   					 <br>
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
				
					
					<input type="hidden"name="lecid" value="${THE_LECTURE.lecid}" />
					

					
					
					<tr>
						<td><input type="submit" value="Save" class="save" /></td>
						 <c:url var="updatelink" value="LectureUpdateController">
						<c:param name="command" value="LIST2" />
						<c:param name="lecid" value="<%=lecid%>" />
						</c:url>
						<td><input type="reset" name=reset value="Reset"></td>
  								
  						<td><a  style="float: right" href="${updatelink}"> cancel </a></td>
					</tr>
		
						
				</tbody>
			</table>
		</form>
		
	</div>
</body>
</html>

