function validateForm() 
{
	var x = document.forms["myForm"]["name"].value;
	if (x == "") {
    alert("Name must be filled out");
    return false;
	}
  
	var x = document.forms["myForm"]["pwd1"].value;
	if (x == "") {
	 alert("Password must be filled out");
	 return false;
	}
  
	var x = document.forms["myForm"]["pwd2"].value;
	if (x == "") {
    alert("Confirm Password must be filled out");
    return false;
	}
  
    var x = document.forms["myForm"]["email"].value;
	  if (x == "") {
	  alert("Email must be filled out");
	  return false;
	  }
	  
	 var x = document.forms["myForm"]["dateofbirth"].value;
	 if (x == "") {
	alert("Date Of Birth must be filled out");
	return false;
	 }
		  
	 var x = document.forms["myForm"]["tel"].value;
	 if (x == "") {
	 alert("Telephone must be filled out");
	 return false;
	}
			  
	var x = document.forms["myForm"]["address"].value;
	if (x == "") {
	alert("Address must be filled out");
	return false;
			  }
			  
	var x = document.forms["myForm"]["description"].value;
	if (x == "") {
	alert("Descrption must be filled out");
	return false;
	}
			  
	var password = document.getElementById("pwd1").value;
	var confirmPassword = document.getElementById("pwd2").value;
	if (password != confirmPassword) {
	alert("Passwords do not match.");
	return false;
	}  
	return true;	
  }


