 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "pstudent.css" />

<title>Question Details</title>

</head>
<body>
<div class ="bg"></div>
<br>
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

  
  <form class="modal-content" onclick="submit" method="get" action="StudentControllerServlet">
  
  	<div class="container">
  	
  		<h3 align="center"  style="color:white;">Question Details</h3>
  	
		<input type="hidden" name="command" value="UPDATE" />

		<input type="hidden" name="studentId" value="${THE_STUDENT.id}" />
	  <input type="hidden" name= "stdid" value="<%=stdid%>">
		<hr>
			
		<br> <label  style="color:white;"><b>Module</b></label> <br>
		<input class="btn" type="text" name="module"  value="${THE_STUDENT.module}" />
		
		<br> <label  style="color:white;"><b>Lecture</b></label> <br>
	<input class="btn" type="text" name="lecture"  value="${THE_STUDENT.lecture}" />
		
		<br> <label  style="color:white;"><b>Topic</b></label> <br>
		<input class="btn" type="text" name="topic"  value="${THE_STUDENT.firstName}" />
		<br> 
		
		<br> <label  style="color:white;"><b>Question</b></label> <br>
		<input class="btn" type="text" name="qiz"  value="${THE_STUDENT.lastName}" />
		<br> 
		
		<br> <label  style="color:white;"><b>Attachment</b></label> <br>
		<input class="btn" style="background-color:lightgreen" type="file" name="attachment" value="${THE_STUDENT.email}"> <br>
		<br>

			
				<h3 align="center"   style="color:white;">Lecturer Reply for the question</h3>
				
				<input type="hidden" name="command" value="UPDATE" />

				<input type="hidden" name="studentId" value="${THE_STUDENT.id}" />
		
				<hr>
				<br> <label  style="color:white;"><b>Answer topic</b></label> <br>
				<input type="text" placeholder="Enter topic...." name="header" style="background-color: #d7e0d3" value="${THE_STUDENT.header}"  readonly><br>
				
				 <label  style="color:white;"><b>Answer</b></label><br>
				<textarea rows="4" cols="50" style="background-color: #d7e0d3" name="answer""value="" readonly>${THE_STUDENT.answer}</textarea>
				
				 <label  style="color:white;"><b>Attachment</b></label><br>
				<input class="download"  type="button" style="background-color: #d7e0d3" name="lecattachment" value="Download" >
					
				<div class="clearfix">
					<a href="student.jsp"><button style="background-color: #ff0000; color: White; opacity: 1;" type="button" class="cancelbtn">Cancel</button>
							</a> <input type="submit" style="width: 50%; color: White;background-color:#45a29e;" onclick="myFunction()" value="save"name="save"/>
				</div>
			</div>
			
	</form>

		<!--up to now-->


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