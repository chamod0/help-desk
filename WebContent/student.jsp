<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "std.css" />

<meta charset="ISO-8859-1">
<title>Student</title>

<style>

button{

	margin:20px 40px;
	width:80%;

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


  <div class="modal-content">
    <div class="container">
      <h2 align="center">Select Module</h2>
      <p align="center" style="color:grey;">Please select module for ask question</p>
      
      <hr>
      
      <labell style="color:white;"><b>Object Oriented Concept</b></label><br>
      <a href="oop.jsp?stdid=<%=stdid%>"><button class="formbtn">OOP</button></a>  <br>

     <labell style="color:white;"><b>Software Engineering</b></label><br>
       <a href="se.jsp?stdid=<%=stdid%>"><button class="formbtn">SE</button></a><br>

      <labell style="color:white;"><b>Database Management</b></label><br>
      <a href="dms.jsp?stdid=<%=stdid%>"> <button class="formbtn">DMS</button></a><br>

      <label style="color:white;"><b>Computer Network</b></label><br>
      <a href="cn.jsp?stdid=<%=stdid%>"> <button class="formbtn">CN</button></a><br>
     
    </div> 
  </div>
  
  


</body>
</html>