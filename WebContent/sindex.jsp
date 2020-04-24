<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "std.css" />

<meta charset="ISO-8859-1">
<title>Student</title>
<style>

a{
	text-decoration:none;

}

button{
	
	width:49%;

}

</style>
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

	<br><br>
  <div class="modal-content">
    <div class="container">
      <h2 align="center">Select Option</h2>
      <p align="center" style="color:grey;">Please select correct option</p>
      
      <hr><br>
      
      <label style="color:white;"><b>Question</b></label><br>
    
      <a href="student.jsp?stdid=<%=stdid%>"><button >Ask</button></a>  
      				<c:url var="updatelink2" value="StudentControllerServlet">
						<c:param name="command" value="LIST" />
						<c:param name="stdid" value="<%=stdid%>" />
					</c:url>
      <a href="StudentControllerServlet?stdid=<%=stdid%>"><button >Manage</button></a>  
	
	<br><hr><br>
     <label style="color:white;"><b>Appointment</b></label><br>
     	<c:url var="tempLink"  value="appointmentControllerServlet"> 
					<c:param name="command" value="ADDAPPO"/>
					<c:param name="stdid" value="<%=stdid%>" />
		</c:url>
     
       <a href="${tempLink}"><button style="width:100%">Make</button></a>
      
     <br>
    </div> 
  </div>
  


</body>
</html>