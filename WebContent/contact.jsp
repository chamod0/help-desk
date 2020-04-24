<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "student.css" />
<title>Contact</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text],input[type=email], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  margin: 0 250px;
  width: 60%;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
<div class="bg"></div>
<br>

<ul>
  <li><a href="logindex.jsp">Home</a></li>
  <li><a href="sindex.jsp">Student</a></li>
  <li><a href="contact.jsp">Contact</a></li>
  <li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
</ul>

<br><br>
<div class="container" >
  <form action="/action_page.php">
    <label for="fname">ID Number</label>
    <input type="email" id="idnum" name="idnum" placeholder="id Number..">

    <label for="lname">Name</label>
    <input type="text" id="name" style="background-color:white" name="name" placeholder="Your last name..">

    <label for="country">E-mail</label>
    <input type="text" id="email" name="email" style="background-color:white"  placeholder="E mail ..">
    <label for="subject">Subject</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit" style="background-color:#45a29e;">
  </form>
</div>

</body>
</html>
