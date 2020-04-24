<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>

	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Student Login Page</title>
	

<style>
		
body{
	margin: 0;
	padding: 0;
	background: url(img/studentbg.jpg);
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
	color: #3498DB;
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
.login-box input[type="text"], input[type="password"]
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
.login-box input[type="submit"]
{
	border: none;
	outline: none;
	height: 40px;
	background: #1c8adb;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;



}

.login-box input[type="button"]
{
	opacity:0.8;
	border: none;
	outline: none;
	height: 40px;
	background: darkred;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;
}

.login-box input[type="submit"]:hover
{
	cursor: pointer;
	background:#39dc79;
	color: #000;

}

.login-box input[type="button"]:hover
{
	cursor: pointer;
	background:red;
	color: #000;

}

a {
text-decoration: none;
}



</style>
</head>
<body>
<div class ="bg"></div>


	<div class="login-box">
		<img src="img/student.png" class="user">
		<h1>Student Login </h1>
	
		<form action="StdLog" method="post">
			&nbsp;
			<p>Registration Number</p>
			<input type="text" name="regno" placeholder="Register Number" required>
			&nbsp;
			<br>
			&nbsp;
			<p>Password</p>
			<input type="Password" name="pass" placeholder="Password">
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="submit" name="submit" value="Login" required><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="logform.jsp"><input type="button" name="submit" value="Cancel" required></a>
		</form>
	</div>
</body>



</html>