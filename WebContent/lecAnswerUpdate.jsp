<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "std.css" />


<title>Appointment</title>
</head>
<body>

<div class="bg"></div>
<br>


  <% 


String lecid = request.getParameter("lecid");
%>

<ul>

   <li><a href="loglecindex.jsp?lecid=<%=lecid%>">Home</a></li>
  <li><a href="lindex.jsp?lecid=<%=lecid%>">Lecturer</a></li>
  <li><a href="contactlec.jsp?lecid=<%=lecid%>">Contact</a></li>
  <li ><a href="LectureConntrolerServlet">Qiz view</a></li>
  
  <li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
<li style="float: right"><% out.println("Lectuer ID: "+lecid);%></li>&nbsp;&nbsp;

</ul>



	<div>

		

		<form class="modal-content" onclick="submit" method="get"action="LectureConntrolerServlet">



			<div class="container">
				<h3 align="center"  style="color:white">Update Answer</h3>

				<input type="hidden" name="command" value="UPDATE" />
				 <input type="hidden" name="studentId" value="${THE_STUDENT.id}" />
				 	 <input	type="hidden" name="lecid" value="<%=lecid%>" />
		

				<hr>
				<br> <label style="color:white"><b>header</b></label> <br>
				 <input type="text"  name="header"style="background-color: #d7e0d3;color:black" value="${THE_STUDENT.header}"required><br> 
				 
			<label style="color:white"><b>Answers</b></label><br>
			<textarea rows="8" cols="60" style="background-color: #d7e0d3;color:black" name="answer" >${THE_STUDENT.answer}</textarea>

				<input type="file" name="lecattachment" value="${THE_STUDENT.lecattachment}">

				<div class="clearfix">
					<a href="LectureConntrolerServlet"><button style="width:48%;background-color:darkred;color:white">Cancel</button> </a>
					 <input type="submit" style="width:48%" onclick="if (!(confirm('Are you confirm'))) return false" value="save" name="save" />
				</div>
			</div>
		</form>

		<!--up to now-->

	</div>




		
	
		
</body>
</html>