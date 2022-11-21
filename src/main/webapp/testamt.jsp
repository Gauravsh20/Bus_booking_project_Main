<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="js/jquery-3.5.1.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="/jquery/jquery-3.6.0.min.js"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#amt").blur(function(){
		var tamt=$("#tamt").val();
		var userid=$("#userid").val();
		alert (tamt);  
		$.post("Verify",
				{"userid":userid},
				function(output){
					if(output.trim()=="no"){
						alert ("Please try again"); 
						$(".msg").html();
						$("#userid").val("");
					}
					else{
						alert ("Please again"); 
						$(".msg").html("Username available");
					}
				});
	
	
	});

	
});
</script>

<body>
<select id="tamt">
<option value="PHONE_PAY">GPay</option>
<option value="GOOGLE_PAY">Phone_pe</option>
<option>Paytm</option>
</select>
<input type="text" id="userid">
</body>
</html>