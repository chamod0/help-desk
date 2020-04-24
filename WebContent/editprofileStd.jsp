<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Edit profiles</title>


<link rel="stylesheet" type="text/css" href="css/profilestyle.css">
<link rel="stylesheet" type="text/css" href="index.css">

</head>

<body>
<div class = "bg"></div>

  <% String stdid = request.getParameter("stdid");%>
  
  <br>
<ul>
 <li><a href="logindex.jsp?stdid=<%=stdid%>">Home</a></li>
  <li><a href="sindex.jsp?stdid=<%=stdid%>">Student</a></li>
  <li><a href="contact.jsp?stdid=<%=stdid%>">Contact</a></li>



<li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
<li style="float: right"><a> </a></li>


 <c:url var="updatelink" value="adminStudentController">
		<c:param name="command" value="LIST2" />
		<c:param name="stdid" value="<%=stdid%>" />
	</c:url>
   <br>
<label  style="float: right" >Student Id<a href="${updatelink}"><% out.println(": "+stdid);%></a></label>
</ul>

<div class = "box">
		<h3>Edit Student Profile</h3>
		
		<form action="adminStudentController?stdid=<%= stdid %>" method="GET">
		
			<input type="hidden" name="command" value="PROUPDATE" />

			<input type="hidden" name="studentId" value="${THE_STUDENT.id}" />
			
			<input type="hidden"name="stdid" value="<%= stdid %>" />
			<input type="hidden"name="regno" value="${THE_STUDENT.regno}" />
			<table>
				<tbody>
				<img src="img/studentprofile.png" alt="profile picture" style="width:200px;height:200px;margin: 10px 40px">
   
   						 <br>
   	 				<input type="file" name="pic" accept="image/*" style="width:50px height:50px">
    				<input type="button" name="delete" value="Remove Profile Picture" style="padding: 0;float:none; border-radius: 0;">
   					 <br>
				
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="name" 
								   value="${THE_STUDENT.name}" /></td>
					</tr>

					
					<tr>
						<td><label>NIC</label></td>
						<td><input type="text" name="nic" 
						 value="${THE_STUDENT.nic}" /></td>
					</tr>
					

					
					<tr>
						<td><label>Email</label></td>
						<td><input type="text" name="email" 
								   value="${THE_STUDENT.email}" /></td>
					</tr>
					<tr>
						<td><label>Telephone</label></td>
						<td><input type="text" name="tel" 
								   value="${THE_STUDENT.tel}" /></td>
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><input type="text" name="address" 
								   value="${THE_STUDENT.address}" /></td>
					</tr>
					<tr>
						<td><label>Date of Birth</label></td>
						<td><input type="text" name="dob" 
								   value="${THE_STUDENT.dob}" /></td>
					</tr>
					<tr>
						<td><label>Password</label></td>
						<td><input type="password" name="pass" 
								   value="${THE_STUDENT.pass}" /></td>
					</tr>
					<tr>
						<td><label> Confirm  password</label></td>
						<td><input type="password" name="repass" 
								   value="${THE_STUDENT.repass}" /></td>
					</tr>
					
				
					
					
					

					
					
					<tr>
						<td><input type="submit" value="Save" class="save" /></td>
						
						
						 <c:url var="updatelink" value="adminStudentController">
						<c:param name="command" value="LIST2" />
						<c:param name="stdid" value="<%=stdid%>" />
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

