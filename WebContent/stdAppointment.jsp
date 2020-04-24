<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "pstudent.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<head>

<meta charset="ISO-8859-1">
<title>Make Appointment</title>

<style>

#table-wrapper {
  position:relative;
}
#table-scroll {
  height:150px;
  overflow:auto;  
  margin-top:20px;
}
#table-wrapper table {
  width:100%;

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


 
<form style="width:50%" class="modal-content" onclick="submit" action="appointmentControllerServlet"  method="get"> 
  
  <div class="container">
  
      <h3 align="center"  style="color:white;">Create an appointment</h3>
      <hr>
      
	<input type="hidden" name= command value="ADDAPPO"><br>
    
        <label  style="color:white;"><b>Module</b></label><br><br>
        <select name="module">
  			<option value="OOP">OOP</option>
 			<option value="SE">SE</option>
 			<option value="DMS">DMS</option>
 			<option value="CN">CN</option>
  	   </select><br>
      
      <br>
      <label  style="color:white;"><b>Select Lecturer</b></label><br>
        <select id="lec" name="lecture">
  			<option value="l10001002">Manoj Chamara</option>
 			<option value="l10001001">Lushaka Nisansala</option>
  	   </select><br>
		<br>
      <label  style="color:white;"><b>Busy Days</b></label><br>
      
     <div id="table-wrapper">
  	<div id="table-scroll">
     	<table class="w3-table w3-striped w3-bordered"  style="background-color:white;width:100%">
     	<tr>
     		<th>Module</th>
     		<th>Date-Time</th>
     		<th>Lecture</th>
     	</tr>
     	<tr>
     			 <c:forEach var="tempAppointment" items="${APPOINTMENT_LIST}">
					<input type="hidden" name="studentId" value="${tempAppointment.appid} " />
					<tr >
						
						<td> ${tempAppointment.module} </td>
						<td> ${tempAppointment.datetime} </td>
						<td> ${tempAppointment.lecture} </td>
	
					</tr>
				</c:forEach>     	
     	</tr>
     </table>
	</div>
	</div>
     <br>
      <label  style="color:white;"><b>Select date</b></label>
     <br>
	  <input type="datetime-local" name="datetime"><br>
	   <label  style="color:white;"><b>Comment</b></label>
     
	  <input type="text" name="comment">
	  

	  
	  
	  
	  <input type="submit" style="width:48%;background-color:#45a29e;color:white"  value="save" >
	  <input type="reset" style="width: 48%;background-color:darkred;color:white;">
      
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