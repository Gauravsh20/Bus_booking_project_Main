<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
       <h1>Bus Details</h1>
     <form method="get" action="UpdateBus.jsp">
         Bus Id :
            <input type="text" name="busId"/> <br/><br/> 
         Bus No :
            <input type="text" name="busNo"/> <br/><br/> 
         User ID :
            <input type="number" name="userId"/> <br/><br/>   
         Bus Type :
            <select name="busType">
						<option value="AC">AC</option>
						<option value="SLEEPER">SLEEPER</option>
						<option value="SEATER">SEATER</option>
						<option value="NON_AC">NON_AC</option>  
					</select>  <br/><br/> 
		Bus Services :
		    <select name="serviesType">
		       <option value="REGULAR">REGULAR</option>
		       <option value="WEEKEND">WEEKEND</option>
		       <option value="ALTERNATE_DAYS">ALTERNATE_DAYS</option>
		       <option value="EVENT">EVENT</option>   
		    </select>  <br/><br/> 
		NoOf Seats :
		 <input type="number" name="noOfSeats"/> <br/><br/>  
		 <input type="submit" value="Update Bus"/>  
				
     </form>
     <c:if test="${param.busNo!=null}">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
      <jsp:useBean id="bus" class="Training.BusBookingProject.Bus"/>
      <jsp:setProperty property="*" name="bus"/>
      <c:out value="${beanDao.updateBus(bus)}"/>
     </c:if>
     
</body>
</html>