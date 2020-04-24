<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "student.css" />

<meta charset="ISO-8859-1">
<title>Update Question</title>
</head>
<body>
<div class ="bg"></div>
<ul>
  <li><a href="logindex.jsp">Home</a></li>
  <li><a href="sindex.jsp">Student</a></li>
  <li><a href="contact.jsp">Contact</a></li>
  <li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
</ul>

<div >
  <form class="modal-content" onclick="submit">
    <div class="container">
      <h3 align="center">Update Question</h3>

      <hr><br>
      <label ><b>Lecturer</b></label>
      <input type="text" placeholder="Lecturer...." name="top" style=" background-color:   #d7e0d3 " disabled>

      <label ><b>Topic</b></label>
      <input type="text" placeholder="Enter topic...." name="top" style=" background-color:   #d7e0d3 " required>

      <label><b>Question</b></label>
      <textarea rows="4" cols="50" style=" background-color:   #d7e0d3 ">
      Enter Question .....
      </textarea >

	  <input type="file" name="file">
	  
      <div class="clearfix">
        <a href="sindex.jsp"><button style="background-color:darkred;opacity:0.7;" type="button"class="cancelbtn">Cancel</button></a>
        <input type="submit" style="width:50%" onclick="myFunction()" value="update">
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