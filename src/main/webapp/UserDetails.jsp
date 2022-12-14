<%@page import="Training.BusBookingProject.User"%>
<%@page import="Training.BusBookingProject.UserDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="HeaderHm.jsp"/>
<head>
<title>Register Page</title>
<link rel="stylesheet" href="Css/FormDetail.css">
<script type="text/javascript" src="/jquery/jquery-3.6.0.min.js"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>
$(function(){
	$("#cpassword").blur(function(){
		var pss=$("#password").val();
		var cpss=$("#cpassword").val();
		
		if(pss!==cpss){
			$("#error").html("**Password not matched"); 
			$("#password").val("");
			$("#cpassword").val("");
			var setInterval_ID = setInterval(my_alert_func, 6000);  
		}
	});
	$("#fullname").blur(function(){
		var regName = /^[a-zA-Z]+$/;
		 var regName1 = /^[a-zA-Z]+ [a-zA-Z]+$/;
	    var name = document.getElementById('fullname').value;
	    if(!regName.test(name) && !regName1.test(name)){
	    	$("#error").html("**Invalid User Name");
	    	$("#fullname").val(""); 
	    	var setInterval_ID = setInterval(my_alert_func, 6000); 
	        
	    }

	});

	$("#contactno").blur(function(){
		 var phoneno =/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
	    var inputtxt = document.getElementById('contactno').value;
	    if(!phoneno.test(inputtxt)){
	    	$("#error").html("**Invalid Contact Number");
	    	$("#contactno").val(""); 
	    	var setInterval_ID = setInterval(my_alert_func, 6000); 
	        
	        
	    }

	});

	$("#emailaddress").blur(function(){
		 const regex_pattern =/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		 var email_id = document.getElementById('emailaddress').value;
		    if (!regex_pattern.test(email_id)) {
		    	$("#error").html("**Invalid Email Address");
		    	$("#emailaddress").val(""); 
		    	var setInterval_ID = setInterval(my_alert_func, 6000); 
		       
		    }

	});

	$("#password").blur(function(){
		var res;
		 var str = document.getElementById('password').value;
		 if (str.match(/[a-z]/g) && str.match(
         /[A-Z]/g) && str.match(
         /[0-9]/g) && str.match(
         /[^a-zA-Z\d]/g) && str.length >=8 && str.length <=15){
			 $("#error1").html("**Strong password");
			 var setInterval_ID = setInterval(my_alert_func1, 10000); 
			 }
		 else
	 		{
		 		$("#error").html("**Invalid password  e.g Gau@12gau");
			 $("#password").val(""); 
	    	var setInterval_ID = setInterval(my_alert_func, 20000); 
	        
	        }


	});

	
	
	function my_alert_func()
	{
		document.getElementById("error").innerHTML=null;
		
	}

	function my_alert_func1()
	{
		document.getElementById("error1").innerHTML=null;
		
	}
});
</script>
<style>
lottie-player{
margin-top:-10ex;
margin-left:-20ex;
}


</style>
</head>
<h1 id="">New User Details</h1>
<c:out value="${param.result}"/>
<div class="container-fluid">
<div id="error" style="color:red; text-align: center; font-weight: bolder;"></div>
<div id="error1" style="color:green; text-align: center; font-weight: bolder;"></div>
<div class="row">

	<div class="col-7">
	<form method="post" action="" name="myForm">	
	<div class="row">
		<div class="col-30">
		<label for="fname">Full Name :</label>
		</div>	
		<div class="col-80">
		    <input type="text" id="fullname" name="fullname" placeholder="Enter Full Name" required="required"/> <br/><br/>
		</div>
	</div>	
	<div class="row">
		<div class="col-30">
		<label for="number">Contact No :</label>
		
		</div>	
		<div class="col-80">	
			<input type="text" name="contactno" id="contactno" placeholder="Enter Contact No." required="required" max="10"/> <br/><br/>
		</div>
	</div>	
	
	<div class="row">
		<div class="col-30">
	<label for="email">Email Address :</label>
			
		</div>	
		<div class="col-80">
			<input type="text" name="emailaddress" id="emailaddress" placeholder="Enter Email Address"/> <br/><br/>
		</div>
	</div>
		
	<div class="row">
		<div class="col-30">
		<label for="email">User Name :</label>
		</div>	
		<div class="col-80">
			<input type="text" name="username" placeholder="Enter User ID OR UserName"/> <br/><br/>
		</div>
	</div>	
	
	<div class="row">
		<div class="col-30">
	<label for="password">Password :</label>	
		</div>	
		<div class="col-80">
			<input type="password" name="password" id="password" required="required"/> <br/><br/>
		</div>
	</div>
		<div class="row">
		<div class="col-30">
	<label for="password">Confirm Password :</label>	
		</div>	
		<div class="col-80">
			<input type="password" name="cpassword" id="cpassword" placeholder="Password" required="required"/> <br/><br/>
			<span id = "message" style="color:red"> </span> <br><br>
		</div>
	</div>
	<div class="row">
	<input type="submit" id="submitForm" value="Submit"/>
		
	</div>	
	</form>
	
	</div>

	<c:if test="${param.fullname!=null}">
		<jsp:useBean id="beanDao" class="Training.BusBookingProject.UserDAO"/>
		<jsp:useBean id="users" class="Training.BusBookingProject.User"/>
		<jsp:setProperty property="*" name="users"/>
		<c:set var="result" value="${beanDao.Adduser(users)}" scope="page"/>
	</c:if>
	
	<div class="col-5">
		<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
		<lottie-player src="https://assets1.lottiefiles.com/packages/lf20_fgvmiyev.json"  background="transparent"  speed="1"  style="width: 600px; height: 600px;"  loop  autoplay></lottie-player>		
	</div>	
	        
        	
</div>
</div>
</body>
</html>