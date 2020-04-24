<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profile</title>


<link rel="stylesheet" type="text/css" href="css/profilestyle.css">
<link rel="stylesheet" type="text/css" href="index.css">
</head>

<body>
<div class="bg"></div>
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
<table>

			<c:forEach var="tempStudent"  items="${STUDENT_LIST}">
				
				<c:url var="tempLink"  value="adminStudentController"> 
					<c:param name="command" value="LOAD2"/>
					<c:param name="studentId" value="${tempStudent.id}" />
					<c:param name="stdid" value="<%=stdid%>" />
				</c:url>
				<h3><b>Student Profile</b></h3>
				<p>Hello, ${tempStudent.name}</p>
	
    				<img src="img/studentprofile.png" alt="profile picture" style="width:200px;height:200px;margin: 10px 40px">
   				<br>
				
				
				<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="name" 
								   value=" ${tempStudent.name}" readonly/></td>
					</tr>

					
					<tr>
						<td><label>NIC</label></td>
						<td><input type="text" name="nic" 
						 value="${tempStudent.nic}" readonly/></td>
					</tr>
					<tr>
						<td><label>Email</label></td>
						<td><input type="text" name="email" 
								   value="${tempStudent.email}"readonly /></td>
					</tr>

					
					<tr>
						<td><label>Register no</label></td>
						<td><input type="text" name="regno" 
								   value="${tempStudent.regno}" readonly/></td>
					</tr>
					<tr>
						<td><label>Telephone</label></td>
						<td><input type="text" name="tel" 
								   value="${tempStudent.tel}" readonly/></td>
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><input type="text" name="tel" 
								   value="${tempStudent.address}" readonly/></td>
					</tr>
					<tr>
						<td><label>Date of birth </label></td>
						<td><input type="text" name="tel" 
								   value="${tempStudent.dob}" readonly/></td>
					</tr>
					
					
					
					<tr>
						
					<td><a href="logindex.jsp?stdid=<%=stdid%>"><input type="button" class="active" name="cancel" value=" Cancel"> </a></td>
						<td><a href="${tempLink}"><input type="submit" value="EDIT" class="active" /></a></td>
					</tr>
					
			</c:forEach>
		
		</table>
	</div>
</body>
</html>