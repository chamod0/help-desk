<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> <form   action="orderController"  method="get"> 
<input type="hidden" name="command" value="ADD" />
						
						<label>nic:</label>
						<input type="text" name="price" /><br>
					
						<label>repass:</label>
						<input type="text" name="chackingdate" /><br>
					
						<label>tel:</label>
						<input type="text" name="chackoutdate" /><br>
						
						<input type="submit" value="da">
					</form>
</body>
</html>