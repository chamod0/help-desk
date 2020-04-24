<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
	
<!DOCTYPE html>
<html>


<head>

<meta charset="ISO-8859-1">
<title>Online Help Desk</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
<style>


/*navbar*/
body ,html{
margin:0;
pading:0;
  
 height:100%;
font-family: Arial, Helvetica, sans-serif;
box-sizing: border-box;
}
ul {
  font-size:20px;
  list-style-type: none;
  margin: 20px;
  padding: 0;
  overflow: hidden;
  background-color: #CCD1D1;
  opacity:0.8;
  box-shadow:6px 5px 9px grey;
 
}
.bg{
height:100%;
width:100%;
background-size:cover;
background-repeat:no-repeat;
background-position:center;
position: fixed;


}

li {
  float: left;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  color:white;
  background-color: #111;
}

.active:hover {
  background-color: red;
  color:white;
}

.active {
  background-color: #4CAF50;
  color:white;
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
  width: 90%; /* Could be more or less, depending on screen size */
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
	<br><br>
  
  <div class="modal-content">
    <div class="container">
      <h2 align="center">Manage Appointment</h2>
      <p align="center" style="color:white;">*Please select delete button for delete appointment</p>
      <p align="center" style="color:white;">*Please select action button for check details</p>
      
      <hr><br>
      
     <table class="w3-table w3-striped w3-bordered"  style="background-color:white;">
     	<tr>
     		<th>Module</th>
     		<th>Date</th>
     		<th>Comment</th>
     		<th>Status</th>
     		<th>Delete</th>
     		<th>Action</th>
     	</tr>
     	<tr>
     			 <c:forEach var="tempAppointment" items="${APPOINTMENT_LIST}">
    
   					 
					<c:url var="deleteLink" value="appointmentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="appId" value="${tempAppointment.appid}" />
						<c:param name="lecid" value="<%=lecid %>" />
					</c:url>
					
					<c:url var="updatelink2" value="appointmentControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="appId" value="${tempAppointment.appid}" />
						<c:param name="lecid" value="<%=lecid %>" />
					</c:url>
					
					<input type="hidden" name="lecture" value="${tempAppointment.lecture}" />
				<input type="hidden" name="lecture" value="${tempAppointment.appid}" />
					<tr >
						<td> ${tempAppointment.module} </td>
						<td> ${tempAppointment.datetime} </td>
						<td> ${tempAppointment.comment} </td>
						<td> ${tempAppointment.status} </td>
						<td><a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false"><button class="delete">Delete</button></a>	 </td>
						
					<td><a  href="${updatelink2}" ><button class="update">Action</button></a>	 </td>
						
			
						
						
					</tr>
					
					
	</c:forEach>
		     	
     	</tr>
     
     </table>
     </div>
     </div>
  <input type="hidden" name="command" value="UPDATE" />
        
        
          <input type="hidden" name="studentId" value="${THE_APPOINTMENT.appid}" /> 



	  

	  
	  
	  
	 
      
     
       
        
      

















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