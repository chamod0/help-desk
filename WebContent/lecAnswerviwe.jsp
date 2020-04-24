
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css" />
<link rel="stylesheet" type="text/css" href="stdcss.css" />

<meta charset="ISO-8859-1">
<title>Online Help Desk</title>

<style type="text/css">
.update{

	background-color:#78e8a4;

}

</style>

</head>


<body>
<div class="bg"></div>

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

	
	<table>


		<tr><td></td>
			<td>Search<input  type="text" name=search /></td>
			
		</tr>
		<tr>
			<td>|Topic  </td>
			<td> |Qiz </td>
			<td>|Student Attachment </td>
			<td>|Header</td>
			<td>|Answer</td>
			<td>|Lecture Attachment </td>
		</tr>
<c:forEach var="tempStudent" items="${STUDENT_LIST}">
				
					
					<c:url var="tempLink" value="LectureConntrolerServlet">
						<c:param name="command" value="LOAD2" />
					
					
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>
					
					<tr CLASS="qiz">
						<td class="qizcoloum"> ${tempStudent.firstName} </td>
						<td class="qizcoloum"> ${tempStudent.lastName} </td>
						<td class="qizcoloum"> ${tempStudent.email} </td>
						
						<td class="answercoloum"> ${tempStudent.header} </td>
						<td class="answercoloum"> ${tempStudent.answer} </td>
						<td class="answercoloum"> ${tempStudent.lecattachment} </td>
						<td> <a href="${tempLink}"><input type="button" value="update" class="update"></a></td>
					
						
					</tr>
				
				</c:forEach>

	</table>









</body>
</html>