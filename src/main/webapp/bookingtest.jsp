<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="/jquery/jquery-3.6.0.min.js"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>


function myFunction() {
	var no=document.getElementById("seatno").value;
	var b = parseInt(no);
	alert(b);
	var c=10;
	for (let i = 0; i < b; i++) {
		 c+a;
		}
	document.getElementById("demo").innerHTML = text;
  	/* location.replace("firstpage.jsp") */
}
</script>
</head>
<body>
 <label for="vehicle1">Seat No.</label><br>
  <input type="number" id="seatno" name="seatno" required="required">
 
  <input type="submit" onclick="myFunction()" id="button">Replace document</button>
  <p id="demo"></p>

<div id="fn" hidden> First Name :
  <input type="text" />
</div>
<br>
<div id="ln" hidden>Last Name :
  <input type="text" />
</div>
<script type="text/javascript">

$("#button").click(function() {
	  $("#fn").show();
	  $("#ln").show();
	});

</script>

</body>
</html>