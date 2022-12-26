<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style>
table{
margin-top: 10ex;
text-align: center;
}
thead{
background-color:F5BDB1;

}
h3{
color: gray;
font-family: fantasy;
font-size: 5ex;
text-decoration: underline;
}
</style>
<body>
<h3 class="text text-center mt-4">Show All Payment</h3>
 <a href="JSF_Files/AdminHomePage.xhtml" class="btn btn-success ml-5">BacK</a>
<form action="showPayment.jsp" method="get" class="text-center mt-5">
<jsp:useBean id="dao" class="Training.BusBookingProject.PaymentDAO"/>
	<table border="3" align="center" class="table table-hover">
	<thead>
	<tr>
		<th>Payment ID</th>
		<th>User ID</th>
		<th>Wallet ID</th>
		<th>Booking ID</th>
		<th>Amount</th>
		<th>Payment Date</th>
		<th>Payment Type</th>
		<th>Payment_Status</th>
	</tr>
	</thead>	
	<c:forEach var="show" items="${dao.showPayment()}">
	
	<tr>
	<td><c:out value="${show.paymentId}"/></td>
		<td><c:out value="${show.userId}"/></td>
			<td><c:out value="${show.walletId}"/></td>
			<td><c:out value="${show.bookingId}"/></td>
			<td><c:out value="${show.amount}"/></td>
		    <td><c:out value="${show.paydate}"/></td>
			<td><c:out value="${show.paytype}"/></td>
			<c:if test="${show.paymentStatus=='SUCCESSFULL'}">
			
			<td class="text-success font-weight-bold"><c:out value="${show.paymentStatus}"/></td>
			</c:if>
			<c:if test="${show.paymentStatus!='SUCCESSFULL'}">
			
			<td class="text-danger font-weight-bold"><c:out value="${show.paymentStatus}"/></td>
			</c:if>
			
			
	</c:forEach>
	
	</table>

<a href="sucessPayments.jsp"><button class="btn btn-danger" type="button">Show SuccessFull Payments</button></a>
</form>

</body>
</html>