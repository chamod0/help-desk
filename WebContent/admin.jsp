
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Admin Login</title>
	

<style>
		
body{
	margin: 0;
	padding: 0;
	background: url(img/adminbg.jpg);
	background-size: cover;
	background-position: center;
	font font-family: sans-serif;
	background-repeat: no-repeat;
	height: 100%;
	background-attachment: fixed;
}

.login-box{
	width: 320px;
	height: 420px;
	background:rgba(0,0,0,0.5);
	color: #25B205;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	padding: 70px 30px;
	border-radius: 20px;
}

.user{
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -22%;
	left:  35%;
}
h1{
	margin: 0;
	padding: 0 0 20px;
	text-align: center;
	font-size: 22px;
}
.login-box p{
	margin: 0;
	padding: 0;
	font-weight: bold;
}
.login-box input{
	width: 100%;
	margin-bottom:20px:;

}
.login-box input[type="text"], input[type="password"],input[type="button"]
{
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 16px;
	left: -30px;
}
.login-box input[type="submit"],input[type="button"]
{
	border: none;
	outline: none;
	height: 40px;
	background: #393232;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;



}

.login-box input[type="submit"],input[type="button"]:hover
{
	cursor: pointer;
	background:#25B205;
	color: #000;

}

a{

text-decoration:none;

}


</style>
</head>
<body>



	<div class="login-box">
		<img src="img/admin.png" class="user">
		<h1>Admin</h1>
		<form action="AdminLoging" method="post">
			&nbsp;
			<p>Admin Username</p>
			<input type="text" name="name" placeholder="username" required>
			&nbsp;
			<br>
			&nbsp;
			<p>Admin Password</p>
			<input type="password" name="pass" placeholder="* * * * * *">
			 
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a><input type="submit" name="submit" value="login" ></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href ="index.jsp" ><input type="button" name="cancel" value="Cancel"></a>
		</form>
	</div>
</body>



</html>