<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/jquery/jquery-3.6.0.min.js"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<script type="text/javascript">
	$("#pname").blur(function(){
		alert("Are you sure to book the Ticket");
		var regName = /^[a-zA-Z]+$/;
		 var regName1 = /^[a-zA-Z]+ [a-zA-Z]+$/;
	    var name = document.getElementById('pname').value;
	    if(!regName.test(name) && !regName1.test(name)){
	    	$("#error").html("**Invalid User Name");
	    	$("#pname").val(""); 
	    	var setInterval_ID = setInterval(my_alert_func, 6000); 
	        
	    }

	});

	function my_alert_func()
	{
		document.getElementById("error").innerHTML=null;
		
	}

</script>
<body>
<c:out value="${userid}"/>
<jsp:useBean id="UserDAO" class="Training.BusBookingProject.UserDAO"/>
<jsp:useBean id="BusDAO" class="Training.BusBookingProject.BusDAO"/>
<jsp:useBean id="TravelDAO" class="Training.BusBookingProject.TravelscheduleDAO"/>

<form action="">
	<input type="text" name="answer" id="answer" placeholder="number of persons"/>
	<input type="text" name="scheduleid" value="${param.scheduleid}" readonly="readonly"/>
	<input type="text" name="userid" value="${param.userid}" readonly="readonly"/>
	<input type="submit" value="save">

</form>


<c:if test="${param.answer != null}">
<%
String name="gaurav";
String no=request.getParameter("answer");
int number=Integer.parseInt(no);
if(number!=0){
for(int i=0;i<number;i++){
%>
<c:out value="<%=no %>"/>

<c:set var="tra" value="${param.scheduleid}"/>
		<c:if test="${param.seatNo == null }">
				<c:set var="travel" value="${TravelDAO.SearchTravelId(tra)}"/>
		</c:if>
		<c:set var="bid" value="${travel.busid}"/>
  		
  		<h1 style="text-align: center; font-family: cursive;color: gray; text-decoration:underline;">Booking</h1>
  		<a href="showalltravel.jsp" class="btn btn-success ml-5">BacK</a>
  		<div id="error" style="color:red; text-align: center; font-weight: bolder;"></div>

 		<div class="container-fluid ">
 		
 		
 		<form method="post" action="" name="myForm">
 		<div class="container mt-3">
     
        <table class="table table-bordered">
            <thead>
                   <div  name="scheduleId" value="${tra}"></div>
                   <div  name="userId" value="${param.userid}"></div>
              
            </thead>
             <thead>
                <tr>
                  <th>Passenger_name   </th>
                  <th><input type="text" name="pname" id="pname" required="required" pattern="[a-zA-Z]*" /></th>
                </tr>
            </thead>
             <thead>
                <tr>
                  <th>Passenger_age  </th>
                  <th><input type="number" name="page" required="required" min="12" max="90"/></th>
                </tr>
            </thead>
             <thead>
                <tr>
                  <th>Passenger_Gender</th>
                  <th><c:choose>
    			<c:when test="${posting.postingStatus eq 'Active'}">
    					<input type="radio" name="pgender" id="status" value="MALE" checked="checked"/>
   							 MALE&nbsp; 
   						 <input type="radio" name="pgender" id="status" value="FEMALE"/>
   							 FEMALE
    			</c:when>
    			<c:otherwise>
    						<input type="radio" name="pgender" id="status" value="MALE" />
    						MALE&nbsp;
    						<input type="radio" name="pgender" id="status" value="FEMALE" checked="checked"/>
    						FEMALE
    			 </c:otherwise> 
    		</c:choose> </th>
                </tr>
            </thead>
            <thead>
            <c:set var="f" value="${(travel.fareamount*3)/10+travel.fareamount}"/>
                <tr>
                  <th>Fare Amount : ${travel.fareamount}</th>
                  <th>Total Amount: : ${f}</th>
                </tr>
            </thead>
             <thead>
                <tr>
                  <th>Select Seat No : <select name="seatNo">
			<c:forEach items="${UserDAO.book(tra)}" var="seat2">
   			 <option value="${seat2}"> <c:out value="${seat2}"/></option>
   			 <br>
			</c:forEach>	
	</select></th>
                  <th><button class="btn btn-success m-3" type="submit" onclick="fun()">Book</button></th>
                
                </tr>
            </thead>
        </table>
    </div>
 			
       </form>
       <%}} %>
       </div>
      <c:if test="${param.pname != null}">
      <c:set var="travel" value="${TravelDAO.SearchTravelId(tra)}"/>
      <c:set var="f" value="${(travel.fareamount*3)/10+travel.fareamount}"/>
  			<jsp:useBean id="Dao" class="Training.BusBookingProject.UserDAO"/>
    		<jsp:useBean id="book" class="Training.BusBookingProject.Booking"/>
    <jsp:setProperty property="pname" name="book" value="${param.pname}"/>
    <jsp:setProperty property="page" name="book" value="${param.page}"/>
    <jsp:setProperty property="pgender" name="book" value="${param.pgender}"/>
    <jsp:setProperty property="scheduleId" name="book" value="${tra}"/>
    <jsp:setProperty property="userId" name="book" value="${param.userid}"/>
    <jsp:setProperty property="fareAmount" name="book" value="${travel.fareamount}"/>
    <jsp:setProperty property="totalAmount" name="book" value="${f}"/>
    <jsp:setProperty property="seatNo" name="book" value="${param.seatNo}"/>
    <c:out value="${Dao.addBooking(book)}"/>
    <c:redirect url="ShowTickets.jsp?id=${param.userid}"></c:redirect>
</c:if>
</c:if>

</body>
</html>