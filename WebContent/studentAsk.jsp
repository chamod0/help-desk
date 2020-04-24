
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>


<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="ISO-8859-1">
<title>Online Help Desk</title>

</head>

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
  background-color: #fefefe;
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

<body>
	<div class="bg"></div>
	<ul>
<% 
request.getSession(false);
if (session == null) { %>
<li><a href="http://localhost:8082/HelpDesk/home.jsp"> Home</a></li>
  
  <a href="http://localhost:8082/HelpDesk/login.jsp"> Login</a>
  <% 
} else {
    // Already created.
    %>
  &nbsp;&nbsp;  <li style="float:right"><a href="http://localhost:8082/HelpDesk/leclog.jsp" class="active" href="index.jsp">Log out</a></li>

  <% 
}

String name = request.getParameter("name");
%>

<li style="float:right"> <% out.println("User name: "+name); %></li>&nbsp;&nbsp;

  <li><a href="#lecture">Lecturer</a></li>
  <li><a href="contactlec.jsp">Contact</a></li>
  
</ul>

	   <div class="w3-container">
	<table class="w3-table w3-striped w3-bordered">


		<tr><td></td>
			<td>Search<input type="text" name=search /></td>
			
		</tr>
		<tr style="background-color:lightgreen;">
			<td>|name  </td>
			<td> |Subject </td>
			<td>|Topic </td>
			<td>|Qiz</td>
			<td>|update</td>
		</tr>
<c:forEach var="tempStudent" items="${STUDENT_LISTl}">
					<c:url var="showlink" value="StudentControllerServlet">
						<c:param name="command" value="STDLOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>

					
					<input type="hidden" name="studentId" value="${tempstudent.answer}" />
					<input type="hidden" name="studentId" value="${tempstudent.lecattachment}" />
					<tr >
						<td> ${tempStudent.firstName} </td>
						<td> ${tempStudent.lastName} </td>
						<td> ${tempStudent.email} </td>
						<td> ${tempStudent.header} </td>
						<td> <a href="${showlink}">Update Answer</a>
						
					</tr>
				
				</c:forEach>

	</table>
</div>








</body>
</html>