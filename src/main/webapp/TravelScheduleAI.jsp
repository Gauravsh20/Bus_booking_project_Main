<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Bus Booking System</title>
<jsp:include page="AdminUser.jsp"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        var today = new Date();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);
        var year = today.getFullYear();
        var date = year + '-' + month + '-' + day;
        $('[id*=txtdateofreservation]').attr('min', date);
    });
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


<jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
	<h3 class="text-center">Add New Travel Schedule</h3>
	<a href="ShowTSchedule.jsp" class="btn btn-success ml-5">BacK</a>
	<center>
	<form action="">
		Available Bus's :
		<select name="busid">
		<c:forEach var="busid" items="${beanDao.showAvailable()}">
			<option  var="busids" value="${busid}">${busid}</option>
		</c:forEach>
		</select><br/><br/>
		
		Available Driver :
		<select name="driverid">
		<c:forEach var="driverids" items="${beanDao.showDriverAvailable()}">
			<option  var="dids" value="${driverids}">${driverids}</option>
		</c:forEach>
		</select><br/><br/>
		Starting Point:
		<input type="text" name="startingpoint" required="required"><br/><br/>
		Destination Point:
		<input type="text" name="destinationpoint"  required="required"><br/><br/>
		Starting Date:
		<input type="date" name="scheduledate" ID="txtdateofreservation" runat="server"  required="required"><br/><br/>
		Starting time:
		<input type="time" name="departuretime"><br/><br/>
		End Date:
		<input type="date" name="estimatearrivaldate" ID="txtdateofreservation" runat="server"  required="required"><br/><br/>
		End time:
		<input type="time" name="estimatearrivaltime"  required="required"><br/><br/>
		Starting_Address
		<input type="text" name="addressstart"  required="required"><br/><br/>
		End_Address
		<input type="text" name="addressend"  required="required"><br/><br/>
		Fare Amount:
		<input type="number" name="fareamount"  required="required"><br/><br/>
		Remark:
		<input type="text" name="remark"  required="required"><br/><br/>
		<input type="submit" class="btn btn-primary" value="Save"><br/><br/>
	</form>

</center>

<c:if test="${param.busid!= null }">
		<jsp:useBean id="TravelDao" class="Training.BusBookingProject.TravelscheduleDAO"/>
	    <jsp:useBean id="travel" class="Training.BusBookingProject.TravelscheduleMain"/>
	    <jsp:setProperty property="busid" name="travel"/>
		<jsp:setProperty property="driverid" name="travel"/>
		<jsp:setProperty property="startingpoint" name="travel"/>
		<jsp:setProperty property="destinationpoint" name="travel"/>
		
		<%--Date--%>
		<fmt:parseDate value="${param.scheduledate}" pattern="yyyy-MM-dd" var="cd1"/>
		<c:set var="sqlDate1" value="${TravelDao.convertDate(cd1)}" />
			<c:out value="${sqlDate1}"/>
		<fmt:parseDate value="${param.estimatearrivaldate}" pattern="yyyy-MM-dd" var="cd2"/>
		<c:set var="sqlDate2" value="${TravelDao.convertDate(cd2)}"  />
			<c:out value="${sqlDate2}"/>
	
		<jsp:setProperty property="scheduledate" name="travel" value="${sqlDate1}"/>
		<jsp:setProperty property="estimatearrivaldate" name="travel" value="${sqlDate2}"/>
		
		
		<jsp:setProperty property="departuretime" name="travel"/>
		<jsp:setProperty property="addressstart" name="travel"/>
		<jsp:setProperty property="addressend" name="travel"/>
		<jsp:setProperty property="estimatearrivaltime" name="travel"/>
	    <jsp:setProperty property="fareamount" name="travel"/>
		<jsp:setProperty property="remark" name="travel"/>
		
	<h4 class="text-center text-danger"><c:out value="${TravelDao.AddTrvelSchedule(travel)}"></c:out></h4>
</c:if>
</body>
</html>