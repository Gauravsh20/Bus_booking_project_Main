<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style type="">
h3{
color: gray;
font-family: fantasy;
font-size: 5ex;
text-decoration: underline;
}

</style>
<body>
       <h3 class="text-center">Driver Details</h3>
       <a href="JSF_Files/Show_Driver.xhtml" class="btn btn-success ml-5">BacK</a>
     <form method="get" action="UpdateDriver.jsp" class="text-center">
         Driver Id :
            <input type="text" name="driver_id" Value="${param.DId}" required="required"/> <br/><br/> 
         Driver Name :
            <input type="text" name="driver_name" required="required"/> <br/><br/> 
         Driver lic no :
            <input type="text" name="driver_lic_no" required="required"/> <br/><br/>   
         Contact No :
           	<input type="number" name="contact_no" required="required"/> <br/><br/>
          Status :
           	<input type="text" name="driverstatus" Value="${param.DStatus}" required="required"/> <br/><br/>    
		 <input type="submit" class="btn btn-primary" value="Update Driver"/>  
				
     </form>
     <c:if test="${param.driver_id!=null}">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
      <jsp:useBean id="driver" class="Training.BusBookingProject.DriverDetails"/>
      <jsp:setProperty property="*" name="driver"/>
      <c:out value="${beanDao.updateDriver(driver)}"/>
      <c:redirect url="JSF_Files/Show_Driver.xhtml"/>
     </c:if>
</body>
</html>