<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<meta charset="ISO-8859-1">
<title>Manage Question</title>

<style type="text/css">

@charset "ISO-8859-1";

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=submit],select,textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=submit],select,textarea:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
button,input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

input[type=file] {
  background-color:  #bec4bb ;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.7;
}

button:hover {
  opacity:1;
  background-color:grey;
}


/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .ok {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color:#c5c6c7 ;
  margin: 0% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 70%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
  
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

.update{

	background-color:#78e8a4;

}

.delete{

	background-color:#ee795f;

}

a{

text-decoration:none;

}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}



</style>

</head>
<body>
<div class ="bg"></div>
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
      <h2 align="center">Select Question For further modification</h2>
      <p align="center" style="color:white;">*Please select update button for update</p>
      <p align="center" style="color:white;">*Please select delete button for delete</p>
      
      <hr><br>
      
      <div class="w3-container">

  <table class="w3-table w3-striped w3-bordered"  style="background-color:white" >
    <tr style="background-color:lightgreen;">
      <th>Module</th>
      
      <th>Topic</th>
      <th>Reply</th>
      <th>Show</th>
      <th>Update</th>
      <th>Delete</th>
      
    </tr>
    
    <c:forEach var="tempStudent" items="${STUDENT_LISTL}">
    
   					 <c:url var="showlink" value="StudentControllerServlet">
						<c:param name="command" value="STDLOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
								<c:param name="stdid" value="<%=stdid%>" />
					</c:url>
					<c:url var="showlink" value="StudentControllerServlet">
						<c:param name="command" value="STDLOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
							<c:param name="stdid" value="<%=stdid%>" />
					</c:url>
					<c:url var="deletelink" value="StudentControllerServlet">
						<c:param name="command" value="STDDELETE" />
						<c:param name="studentId" value="${tempStudent.id}" />
							<c:param name="stdid" value="<%=stdid%>" />
					</c:url>
					
					
					
					<input type="hidden" name="studentId" value="${tempStudent.email} " />
					<input type="hidden" name="answer" value="${tempstudent.answer}" />
					<input type="hidden" name="lecattachment" value="${tempstudent.lecattachment}" />
					<input type="hidden" name="lastName" value="${tempStudent.lastName}" />
					<input type="hidden" name="stdid" value="${tempStudent.stdid}" />
					<tr >
						<td> ${tempStudent.module} </td>
						<td> ${tempStudent.firstName} </td>
						<td> ${tempStudent.header} </td>
						
						<td> <a href="${showlink}"><input type="button" value="Show" class="show"></a></td>
						<td> <a href="${showlink}"><input type="button" value="update" class="update"></a></td>
						<td> <a href="${deletelink}"><input type="button" value="Delete" class="delete"></a></td>
					</tr>
					
					
	</c:forEach>
    

  </table>
</div>
      
	
  </div>
  </div>


</body>
</html>