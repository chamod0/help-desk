<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>Log in</title>
		<link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
        <style type="text/css">	
        	*{
        		margin: 0;
        		padding: 0;
        		-webkit-box-sizing: border-box;
        		-moz-box-sizing: border-box;
        		box-sizing: border-box;
        		font font-family: sans-serif;
                        border-radius: 5px;

        	}
                body{
                        background: url(img/regcover.jpg);
                        background-size: cover;
                        background-attachment: fixed;
                        background-repeat: no-repeat;
                        background-position: center;
                        
                }
        	
        	#main{
        		width: 35%;
        		margin: 50px auto;

        	}
        	#tab-btn{
        		display: -webkit-flex;
        		display: -moz-flex;
        		display: -ms-flex;
        		display: -o-flex;
        		display: flex;
        		width: 100%;
        		justify-content: center;
        	}
        	.login{
        		text-decoration: none;
        		display: block;
        		width: 100%;
        		background-color:  #413A3A;
        		text-align: center;
        		color: #fff;
        		font-size: 25px;
        		padding: 10px;
                        background:rgba(0,0,0,0.5);
        	}
        	.register{
        		text-decoration: none;
        		display: block;
        		width: 100%;
        		background-color:  #413A3A;
        		text-align: center;
        		color: #fff;
        		font-size: 25px;
        		padding: 10px;
                        background:rgba(0,0,0,0.5);
        	}
        	.active{
        		background-color: #eee;
        		color: #000;

        	}
        	.content,.other{
        		width: 100%;
        		background-color: #eee;
        		padding: 20px 30px 30px 30px;
        		box-shadow: 2px 2px 5px #333;
                          background:rgba(0,0,0,0.5);
                        
        	}
        	.other{
        		display: none;
        	}
        	.inp{
        		width: 100%;
        		padding: 12px;
        		margin-bottom: 15px;
        		font-size: 20px;
        		border: 0px solid #888;
        		border-bottom: 3px solid #888;
        		background-color: #fff;
        		color: #666;
                          background:rgba(0,0,0,0.5);
        	}
        	.inp:focus{
        		outline: none;
        		border: 2px solid #555;
        		border-bottom: 5px solid #555;
        	}
        	#sub-btn{
        		width: 100%;
        		padding: 12px;
        		border: none;
        		font-size: 20px;
        		font-weight: bold;
        		background-color: #54D654;
        		color: #fff;
        		cursor: pointer;
        		border-bottom: 5px solid #444;
        	}
        	#sub-btn:focus{
        		outline: none;
        	}
        	#sub-btn:active{
        		border: none;
        		margin-top: 5px;
        	}
        	
        	h2{
        		text-align: center;
        		padding-bottom: 15px;
        		color: #FBFCFC;
        		font-size: 30px;
        		font-variant: small-caps;
        	}
                #main input[type="button"]:hover
                {
                     cursor: pointer;
                     background:#54D654;
                     color: #000;

                }
                
            a {
            
            text-decoration:none;
            }



        </style>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
        <script type="text/javascript">
        	$(document).ready(function(){
        		$(".register").click(function(){
        			$(".other").show();
        			$(".content").hide();
        			$(".register").addClass('active');
        			$(".login").removeClass('active');
        		});
        		$(".login").click(function(){
        			$(".content").show();
        			$(".other").hide();
        			$(".login").addClass('active');
        			$(".register").removeClass('active');
        		});
        	});
        </script>
	</head>
<body>

<br><br><br><br><br><br>
	<div id="main">
		<div id="tab-btn">
			<a href="#" class="login active">Log in</a>
			<a href="#" class="register">Register</a>
		</div>
		<div class="content">
		<br><br>
				<h2>Login</h2>
			<form action="#" method="post" id="reg-box">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="stlogin.jsp"><input type="button" name="submit" value="As a Student" id="sub-btn"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="leclog.jsp"><input type="button" name="submit" value="As a Lecturer" id="sub-btn"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="index.jsp"><input type="button" name="submit" style="background-color:#E81717" value="cancel" id="sub-btn"> </a>
            </form>
		</div>
		<div class="other">
		<br><br><h2>Register</h2>
			<form action="#" method="post" id="login-box">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="register.jsp"><input type="button" name="submit" value="As a Student" id="sub-btn"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="lecregister.jsp"><input type="button" name="submit" value="As a Lecturer" id="sub-btn"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="index.jsp"><input type="button" name="submit"  style="background-color:#E81717" value="cancel" id="sub-btn"> </a>
                
            </form>
		</div>
	</div>
</body>
</html>



