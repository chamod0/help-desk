<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "pstudent.css" />

<meta charset="ISO-8859-1">
<title>CN</title>
</head>
<body>
<div class="bg"></div>
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

<div >
  <form class="modal-content" onclick="submit" action="StudentControllerServlet"  method="get"> 
    <div class="container">
	<input type="hidden" name= command value="ADD">
	      <h3 align="center"  style="color:white;"><b>Computer Network</b></h3>
      <hr>

      <input type="hidden"name="module" value="CN" style=" background-color:   #d7e0d3 " >
      <br>
        <input type="hidden" name= "stdid" value="<%=stdid%>">
      <label style="color:white;"><b>Select Lecturer</b></label>
        <select id="lec" name="lecture">
  			<option value="">Amila Dewawansha </option>
 			<option value="Deepika Rajakaruna">Deepika Rajakaruna</option>
  	   </select>

      <label  style="color:white;"><b>Topic</b></label>
      <input type="text" placeholder="Enter topic...." name="topic" style=" background-color:   #d7e0d3 " required>

      <label style="color:white;"><b>Question</b></label>
      <textarea rows="4" cols="50" name="qiz" style=" background-color:   #d7e0d3 "></textarea >
      
   <label style="color:white;"><b>Attachment</b></label>
	  <input type="file" name="attachment">
	  
      <div class="clearfix">
        <a href="student.jsp"><button style="background-color:darkred;opacity:0.7;" type="button"class="cancelbtn">Cancel</button></a>
        <input type="submit" style="width:50%;background-color:#45a29e;"  value="save" >
        
      </div>
    </div>
  </form>
</div>

<!-- Script -->

<script>
function myFunction() {
  alert("Confirm ");
}

function upload() {
	  var x = document.createElement("INPUT");
	  x.setAttribute("type", "file");
	  document.body.appendChild(x);
	}
</script>
</body>
</html>