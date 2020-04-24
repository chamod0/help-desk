<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel = "stylesheet"  type = "text/css"  href = "std.css" />
<link rel = "stylesheet"  type = "text/css"  href = "index.css" />

<style>

.qizLable{
	background-color: #474e5d;
	color:#ffffff;
	width:85%;
	height:375PX;
	border:1px solid black;
	margin: 70px;
	background-color: #000000;
  	opacity:0.6;
  	box-shadow:6px 5px 6px #707070;
  	 border-radius:15px;
	
}


</style>

<title>Reply</title>
</head>
<body>
<div class ="bg"></div>
<br>
	
  <% 


String lecid = request.getParameter("lecid");
%>
	<br>
	<ul>
	 <li><a href="loglecindex.jsp?lecid=<%=lecid%>">Home</a></li>
  <li><a href="lindex.jsp?lecid=<%=lecid%>">Lecturer</a></li>
  <li><a href="contactlec.jsp?lecid=<%=lecid%>">Contact</a></li>
  <li ><a href="LectureConntrolerServlet?lecid=<%=lecid%>">Qiz view</a></li>
  
  <li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
<li style="float: right"><% out.println("Lectuer ID: "+lecid);%></li>&nbsp;&nbsp;

</ul>

	<div class="qizLable">
		<input type="hidden" name="command" value="UPDATE" /> <input
			type="hidden" name="studentId" value="${THE_STUDENT.id}" /><br>
		&nbsp&nbsp&nbsp<label style="color:white;"><b>Student  :</b></label> <br>
		&nbsp&nbsp&nbsp&nbsp<input style="width:40%;height:30px;border-radius:20px;background-color:#5d6d7e  " type="text" name="firstName" value="${THE_STUDENT.stdid}"  readonly/><br>
		<hr>
		
		&nbsp&nbsp&nbsp<label style="color:white"><b>Topic</b></label> <br>
		&nbsp&nbsp&nbsp&nbsp<input style="width:40%;height:40px;border-radius:20px;background-color:#34495e;color:white" type="text" name="firstName" value="${THE_STUDENT.firstName}"  readonly/><br>
		
		&nbsp&nbsp&nbsp<label style="color:white"><b>Question</b></label> <br>
		 &nbsp&nbsp&nbsp&nbsp<textarea rows="4" cols="50" style="width:90%;height:70px;border-radius:20px;background-color:#34495e;color:white" name="firstName" readonly/>${THE_STUDENT.lastName}</textarea><br>
		 <br>
		 &nbsp&nbsp&nbsp<label style="color:white"><b>Attachment</b></label>
		${THE_STUDENT.email}
		 &nbsp&nbsp&nbsp&nbsp<input style="color:white;background-color:green;width:10%;height:30px;border-radius:20px" type="button" value="download" name="firstName" value="${THE_STUDENT.email}" />


	</div>


	<div>

		

		<form class="modal-content" onclick="submit" method="get" action="LectureConntrolerServlet">



			<div class="container">

				<h3 align="center" style="color:white">Reply Student question</h3>
				
				<input type="hidden" name="command" value="UPDATE" />
				 <input	type="hidden" name="studentId" value="${THE_STUDENT.id}" />
				 <input	type="hidden" name="lecid" value="<%=lecid%>" />

				<hr>
				<br>
				 <label style="color:white"><b>header</b></label> <br>
				 <input type="text" name="header" style="background-color: #d7e0d3;color:black" value="${THE_STUDENT.header}" required><br> 
				 <label style="color:white"><b>Answers</b></label><br>
			
				<textarea rows="4" cols="50" style="background-color: #d7e0d3;color:black" name="answer" >${THE_STUDENT.answer}</textarea>

				<input type="file" name="lecattachment" value="${THE_STUDENT.lecattachment}">

				<div class="clearfix">
				
					<input type="submit" style="color:black;width: 48%; border-color: White; " onclick="if (!(confirm('Are you confirm'))) return false" value="Send" name="save" />
					
					<button style="color:white;background-color:darkred;width: 48%; border-color: White; class="cancelbtn">Cancel</button> 
					
					 
				</div>
			</div>
		</form>

	

	</div>



	
</body>
</html>