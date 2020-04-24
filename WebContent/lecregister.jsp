<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>Sign up</title>
		<link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
        <style type="text/css">	
        
        a{
        
        	text-decoration:none;
        }
        
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
        	.login,.register{
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
                #main input[type="submit"]:hover
                {
                     cursor: pointer;
                     background:#54D654;
                     color: #000;

                }



        </style>
      
       
	</head>
<body>
	<div id="main">
		<div id="tab-btn">
			
			<a href="#" class="login active">Lecture Sign up</a>
		</div>
		
		<div class="content">
			<h2>Register as a Lecture</h2>
			<form action="LectureUpdateController" method="get" id="login-box">
              		<input type="hidden" name="command" value="REG">
              		
                <input type="text" name="name" placeholder="Name" class="inp" required autofocus><br>
                 
                <input type="text" name="nic" placeholder="NIC" class="inp" required autofocus><br>
                
             	 <select id="lec" name="lecmodule" class="inp">
             	 	<option >Module</option>
  					<option value="OOP">OOP</option>
 					<option value="SE">SE</option>
 					<option value="DMS">DMS</option>
 					<option value="CN">CN</option>
  			  	 </select>
             	
                        
               
                
                <input type="text" name="email" placeholder="Email" class="inp" required autofocus><br>
                   
                 <input type="text" name="tel" placeholder="Tel" class="inp" required autofocus><br>
              
           		 <input type="password" name="pass" placeholder="password" class="inp" required autofocus><br>
                
                 <input type="password" name="repass" placeholder="password" class="inp" required autofocus><br>
                
                <input type="submit" name="submit" value="Register" id="sub-btn">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="index.jsp"><input type="button" name="submit"  style="background-color:#E81717" value="cancel" id="sub-btn"> </a>
            </form>
		</div>
	</div>
</body>
</html>



