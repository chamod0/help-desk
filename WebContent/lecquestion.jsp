
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="stdcss.css" />
<link rel = "stylesheet"  type = "text/css"  href = "index.css" />
<link rel = "stylesheet"  type = "text/css"  href = "student.css" />


<meta charset="ISO-8859-1">
<title>Online Help Desk Lecture</title>

<style>

.update{

	background-color:#78e8a4;
	width:30

}

.delete{

	background-color:#ee795f;

}

</style>

</head>


<body>
<div class="bg"></div>
<br>
<ul>
	
  <% String lecid = request.getParameter("lecid");%>

  	<li><a href="loglecindex.jsp?lecid=<%=lecid%>">Home</a></li>
  	<li><a href="lindex.jsp?lecid=<%=lecid%>">Lecturer</a></li>
  	<li><a href="contactlec.jsp?lecid=<%=lecid%>">Contact</a></li>
    
   					<c:url var="updatelink" value="LectureConntrolerServlet">
						<c:param name="command" value="LIST2" />
						<c:param name="lecid" value="<%=lecid%>" />
					</c:url>
 
 	<li ><a href="${updatelink}">All Answer & Qize </a></li>
 	<li style="float:right"><a class="active" href="index.jsp">Log out</a></li>
	<li style="float: right"><% out.println("Lectuer ID: "+lecid);%></li>

  
  
</ul>

	
	<table>


		<tr>
			<td><input class="search" value ="Search.."type="text" name=search /></td>
			<td></td>
			
		</tr>
		<tr>
			<td>|Student id </td>
			<td>|Module </td>
			<td> |Topic </td>
			<td>|Question</td>
			<td>|Check_reply</td>
			<td>|Reply</td>
			<td>|Update Answer</td>
			<td>|Delete</td>
			
		</tr>
				<c:forEach var="tempStudent" items="${STUDENT_LIST}">
						
					<c:url var="tempLink" value="LectureConntrolerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="studentId" value="${tempStudent.id}" />
						<c:param name="lecid" value="<%=lecid %>" />
					</c:url>
					
					
					<c:url var="updatelink2" value="LectureConntrolerServlet">
						<c:param name="command" value="LOAD2" />
						<c:param name="studentId" value="${tempStudent.id}" />
						<c:param name="lecid" value="<%=lecid %>" />
					</c:url>
					
				
					<c:url var="deleteLink" value="LectureConntrolerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="studentId" value="${tempStudent.id}" />
						<c:param name="lecid" value="<%=lecid %>" />
					</c:url>
					
					
					<input type="hidden" name="studentId" value="${tempStudent.email}" />
					<input type="hidden" name="answer" value="${tempstudent.answer}" />
					<input type="hidden" name="lecattachment" value="${tempstudent.lecattachment}" />
				
					<tr CLASS="qiz">
						
						<td> ${tempStudent.stdid} </td>
						
						<td> ${tempStudent.module} </td>
						
						<td> ${tempStudent.firstName} </td>
						
						<td> ${tempStudent.lastName} </td>
				
						<td> ${tempStudent.header} </td>
						
						<td> <a href="${tempLink}"><input type="button" value="reply" class="show"></a> </td>
						
						<td><a href="${updatelink2}"><input type="button" value="Update" class="update"></a> </td>
						
						<td><a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false"><input type="button" value="Delete" class="delete"></a>	 </td>
										
						
					</tr>
				
				</c:forEach>

	</table>

</body>
</html>