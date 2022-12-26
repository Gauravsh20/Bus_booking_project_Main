<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Bus Booking System</title>
<jsp:include page="AdminUser.jsp"/>
<script type="text/javascript">
var setInterval_ID = setInterval(my_alert_func, 2000);

function my_alert_func()
{
	document.getElementById("error").innerHTML=null;
}

function phonenumber(form)
{
	
	var idstr=document.getElementById("contact_no").value;
    var phoneno = /^\d{10}$/;
     if(idstr.match(phoneno))
     {
          return true;
            }
          else
            {
            alert("Not a valid Phone Number");
            document.getElementById("contact_no").value=" ";
            return false;
            }
}
function dname(form)
{
  		var name=document.getElementById("driver_name").value;
  		var regName = /^[a-zA-Z]+$/;
	 	var regName1 = /^[a-zA-Z]+ [a-zA-Z]+$/;
 		if(!regName.test(name)&& !regName1.test(name)){
				
 			 alert("Please Correct Driver Name");
 	          document.getElementById("driver_name").value=" ";
          }
       

}


 /* function dname()
{
	 
	var A=form["formname:busNo"].value;
	alert("select");
  var S =/^[A-Z0-9]+$/;
   if(A.match(S))
     {
          return true;
            }
          else
            {
            alert("select Correct User Name");
            form["formname:busNo"].value=" ";
            return false;
            } 
} */

</script>

<style>
h3{
color: gray;
font-family: fantasy;
font-size: 5ex;
text-decoration: underline;
}

</style>
<body>
	<div class="heading">
	   <h3 class="text-center">Add New Driver</h3>
	   <a href="JSF_Files/Show_Driver.xhtml" class="btn btn-success ml-5">BacK</a>
	</div>
<jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
<form method="get" action="" class="text mt-5" id="formname">
<center>
		Enter Name :
		<input type="text" name ="driver_name" required="required" id="driver_name"  onblur="dname(this.form)"/><br/><br/>
		Enter Lic-no :
		<input type="text" name ="driver_lic_no" required="required"  onblur="lis"(this.form)"/><br/><br/>
		Enter contact-no :
		<input type="number" name ="contact_no" id="contact_no" onblur="phonenumber(this.form)"/><br/><br/>
		<button type="submit" class="btn btn-primary">Insert</button><br/><br/>
</center>
	
<c:if test="${param.driver_name!= null && param.driver_lic_no != null}" >
	<jsp:useBean id="beanDriverDetailsDAO" class="Training.BusBookingProject.BusDAO" />
	<jsp:useBean id="beanDriverDetails" class="Training.BusBookingProject.DriverDetails" />
	<jsp:setProperty property="*" name="beanDriverDetails" />
	<h4 class="text text-danger text-center" id="error"><c:out value="${beanDriverDetailsDAO.addDriver(beanDriverDetails)}"/></h4>
</c:if>
</form>
</body>
</html>