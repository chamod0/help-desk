<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

					<c:forEach var="tempOrder"  items="${ORDER_LIST}">
				
			
				
				<h3><b>Lecture Profile</b></h3>
		
	

   			<br>
				<tr>
						<td><label>ID</label></td>
						<td><input type="text" name="nic" 
						 value="${tempOrder.id}" readonly/></td>
					</tr>
				<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="PRICE" 
								   value=" ${tempOrder.price}" readonly/></td>
					</tr>

					
					<tr>
						<td><label>NIC</label></td>
						<td><input type="text" name="nic" 
						 value="${tempOrder.chackingdate}" readonly/></td>
					</tr>
					<tr>
						<td><label>Module</label></td>
						<td><input type="text" name="lecmodule" 
								   value="${tempOrder.chackoutdate}"readonly /></td>
					</tr>

					
				
						<c:url var="deleteLink" value="orderController">
						<c:param name="command" value="DELETE" />
						<c:param name="id" value="${tempOrder.id}" />
						
					</c:url>
					
					<td><a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false"><input type="button" value="Delete" class="delete"></a>	 </td>
					
						
					
					
				
			</c:forEach>
		<hr>
</body>
</html>