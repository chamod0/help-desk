<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link href='https://fonts.googleapis.com/css?family=Aclonica' rel='stylesheet'>
<meta charset="ISO-8859-1">
<title>Welcome</title>

<style>


</style>


</head>

<body>
<div class ="bg"></div>
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

<br><br><br><br><br><br><br><br><br><br><br>
<h1 class="topic" style="color:black;margin:0 100px"> Online Help Desk </h1><br><br>
<h3 class="post" style="color:white">Welcome Lecturer!</h3>
<img src="img\lecpng.png" alt="Student_png" class="std" height="480px">

</body>
</html>