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
<table>
	
			
			<c:forEach var="tempLecture"  items="${LECTURE_LIST}">
				
				<c:url var="tempLink"  value="LectureUpdateController"> 
					<c:param name="command" value="LOAD2"/>
					<c:param name="lectureId" value="${tempLecture.id}" />
					<c:param name="lecid" value="<%=lecid%>" />
				</c:url>
				
				<h3><b>Lecture Profile</b></h3>
			<p>Hello, ${tempLecture.name}</p>
	
   			<img src="img/lectureprofile.png" alt="profile picture" style="width:200px;height:200px;margin: 10px 40px">
   			<br>
				
				<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="name" 
								   value=" ${tempLecture.name}" readonly/></td>
					</tr>

					
					<tr>
						<td><label>NIC</label></td>
						<td><input type="text" name="nic" 
						 value="${tempLecture.nic}" readonly/></td>
					</tr>
					<tr>
						<td><label>Module</label></td>
						<td><input type="text" name="lecmodule" 
								   value="${tempLecture.lecmodule}"readonly /></td>
					</tr>

					
					<tr>
						<td><label>Email</label></td>
						<td><input type="text" name="email" 
								   value="${tempLecture.email}" readonly/></td>
					</tr>
					<tr>
						<td><label>Telephone</label></td>
						<td><input type="text" name="tel" 
								   value="${tempLecture.tel}"readonly /></td>
					</tr>
					<tr>
						<td><label>Lecture ID</label></td>
						<td><input type="text" name="lecid" 
								   value="${tempLecture.lecid}" readonly/></td>
					</tr>

					
					
					<tr>
						
					<td><a href="loglecindex.jsp?lecid=<%=lecid%>"><input type="button" class="active" name="cancel" value=" Cancel"> </a></td>
						<td><a href="${tempLink}"><input type="submit" value="EDIT" class="active" /></a></td>
					</tr>
					
				
			</c:forEach>
		</table>
	</div>
</body>
</html>