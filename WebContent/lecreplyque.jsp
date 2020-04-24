<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "student.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Reply for question</title>

<style type="text/css">

.btn{
	background-color:lightblue;
}

</style>

</head>
<body>
<div class="bg"></div>
<ul>
  <li><a href="loglecindex.jsp">Home</a></li>
  <li><a href="lindex.jsp">Lecturer</a></li>
  <li><a href="contactlec.jsp">Contact</a></li>
  <li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
</ul>

<div >
  <form class="modal-content" onclick="submit">
    <div class="container">
      <h3 align="center">Reply for Question</h3>

      <hr><br>
      
      <label ><b>Student ID</b></label>
      <input type="text" placeholder="id number" name="id" style=" background-color:   #d7e0d3 " disabled>
      
      <label ><b>Topic</b></label>
      <input type="text" placeholder="Question Topic" name="topic" style=" background-color:   #d7e0d3 " disabled>

      <label ><b>Question</b></label>
      <input type="text" placeholder="Question.." name="top" style=" background-color:   #d7e0d3 " disabled>
      
      <label ><b>Download Attachment</b></label>
      <button class="btn"><i class="fa fa-download"></i> Download</button>

      <label><b>Reply</b></label>
      <textarea rows="4" cols="50" style=" background-color:   #d7e0d3 ">Enter Reply...
      </textarea >
      
      <label><b>Attachment</b></label>
	  <input type="file" name="file">
	  
      <div class="clearfix">
        <a href="lindex.jsp"><button style="background-color:darkred;opacity:0.7;" type="button"class="cancelbtn">Cancel</button></a>
        <input type="submit" style="width:50%" onclick="myFunction()" value="Send reply">
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