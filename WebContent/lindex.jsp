<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "std.css" />

<meta charset="ISO-8859-1">
<title>Lecturer</title>



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

	<br><br>
	
  <div class="modal-content">
      <h2 align="center">Select Option</h2>
      <p align="center" style="color:white;">Please select correct option</p>
      
      <hr><br>
      
      &nbsp&nbsp<label style="color:white;"><b>For response to Question</b></label><br>
      &nbsp&nbsp<a href="LectureConntrolerServlet?lecid=<%= lecid%>"><button style="width:95%" >Question</button></a>  
	<br><br><hr><br><br>
     &nbsp&nbsp<label style="color:white;"><b>For Appointment handling</b></label><br>
       &nbsp&nbsp<a href="appointmentControllerServlet?lecid=<%= lecid%>"> <button style="width:95%">Appointment</button></a>
       <br>
     <br>
    </div> 

</body>
</html>