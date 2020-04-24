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

<style type="text/css">

a{
  	text-decoration:none;
  }

</style>


</head>

<body>
<div class ="bg"></div>
<% 
String stdid = request.getParameter("stdid");
%>

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

<br><br><br><br><br><br><br><br><br><br><br>
<h1 class="topic" style="color:black;margin:0 100px"> Online Help Desk </h1><br><br>
<h3 class="post" style="color:white">Welcome Student!</h3>
<img src="img\indexlogo.png" alt="Student_png" class="std" height="543px">


</body>
</html>