<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
	
<!DOCTYPE html>
<html>


<head>

<meta charset="ISO-8859-1">
<title>Online Help Desk</title>
 <link rel="stylesheet" href="lecAppointment.css">
 <link rel = "stylesheet"  type = "text/css"  href = "index.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=submit],input[type=reset],input[type=datetime-local],select,textarea {
  width: 40%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
    border-radius: 25px;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=submit],select,textarea:focus {
  background-color: #ddd;
  outline: none;
}

.btn{
	
	
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

.download{
	
	  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
	background-color:lightgreen;
	color:black
}

.download : hover{
	
	background-color:grey;
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
    border-radius: 25px;
    
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
  margin: 5% auto 8% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 35%; /* Could be more or less, depending on screen size */
  border-radius: 25px;
  background-color: #000000;
  opacity:0.7;
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

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}


</style>


</head>
<body>
<div class="bg"></div>
<br>
<ul>
	
  

  <% String lecid = request.getParameter("lecid");
%>

  <li><a href="loglecindex.jsp?lecid=<%=lecid%>">Home</a></li>
  <li><a href="lindex.jsp?lecid=<%=lecid%>">Lecturer</a></li>
  <li><a href="contactlec.jsp?lecid=<%=lecid%>">Contact</a></li>


<li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
<li style="float: right"><% out.println("Lectuer ID: "+lecid);%></li>&nbsp;&nbsp;

  
  
</ul>

<form class="modal-content"  method="get" action="appointmentControllerServlet">
	 <div class="container">


    <input type="hidden" name="studentId" value="${THE_APPOINTMENT.appid}" /> 

 		 <c:url var="link" value="appointmentControllerServlet">
						<c:param name="command" value="LIST" />
						<c:param name="appId" value="${tempAppointment.appid}" />
			</c:url>
          
			<c:url var="deleteLink" value="appointmentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="appId" value="${tempAppointment.appid}" />
			</c:url>
				
			<input type="hidden" name="lecture" value="${tempAppointment.lecture}" />
			
		<label style="color:white;"><b>Module</b></label><br>
		<input  type="text" name="module" value="${THE_APPOINTMENT.module}" readonly/><br>
		
		<label style="color:white;"><b>Date </b></label><br>
		<input  type="text" name="datetime" value="${THE_APPOINTMENT.datetime}" readonly/><br>
		
		<label style="color:white;"><b>Comment</b></label><br>
		<input  type="text" name="module" value="${THE_APPOINTMENT.comment}" readonly/><br>
		
		<label style="color:white;"><b>Action</b></label><br>
		<input  type="text" name="module" value="${THE_APPOINTMENT.status}" readonly/>



				<input type="hidden" name="command" value="UPDATE" />
				 <input	type="hidden" name="appId" value="${THE_APPOINTMENT.appid}" />

          <input	type="hidden" name="lecid" value="<%=lecid %>" />
			
			
				<h4 style="color:white">Accept</h4><label class="switch">
 					<input type="radio"  name="status" value="Accept">
 					 <span class="slider round"></span>
					</label><br></th>
				<h4 style="color:white">Reject</h4><label class="switch">
 					<input type="radio"   name="status" value="Rejected">
 					 <span class="sliderRed round"></span>
					</label></th>
			<br>
			
					
					
					 <input type="submit" style="width: 21%; border-color: White; "  value="Send" name="save" />
		<a  href="lindex.jsp" ><button style="width: 21%; color: White;background-color:darkred;  border-radius: 25px;" > Cancel</button></a>
						
			</div>
			
		</form>



<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
   

</body>
</html>