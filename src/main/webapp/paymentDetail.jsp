<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<style>
table{
margin-top: 5ex;
}
thead{
background-color:F5BDB1;
}
</style>
<body>
<c:if test="${param.amount == null}">
<c:set var="ids" value="${param.userid}"/>
<c:out value="${ids}"/>
<c:if test="${param.bookingId!=null}">
	<jsp:useBean id="booked" class="Training.BusBookingProject.UserDAO"/>
   <c:set var="walletid" value="${booked.searchWalletByUserId(ids)}"/> 
   <c:out value="${walletid.walletId}"/> 
	<c:forEach var="showBook" items="${booked.SearchBookId(param.bookingId)}">
		<c:set var="tamt" value="${showBook.totalAmount}"/>
	</c:forEach>
</c:if>
<form action="" method="get" class="text-center mt-5">
	User ID:
	<input type="text" name="userId" value="${ids}" readonly="readonly" required="required"/><br/><br/>
	 Wallet ID:
	<input type="text" name="walletId" value="${walletid.walletId}"/><br/><br/>
	Wallet Type :
	<select name="paytype">
		<option value="PHONE_PAY">Phone_pe</option>
		<option value="GOOGLE_PAY">GPay</option>
		<option value="PAYTM">Paytm</option>
	</select><br/><br/>
	Booking ID:
	<input type="text" name="bookingId" value="${param.bookingId}"/><br/><br/>
	Amount:
	<input type="number" name="amount" value="${tamt}"/><br/><br/>
	Comment :
	<textarea rows="5" cols="25"></textarea><br/><br/>
	<button type="submit" class="btn btn-primary">Pay</button>
</form>
</c:if>
<c:if test="${param.amount != null }">
<c:out value="radhe"/>
<jsp:useBean id="pay" class="Training.BusBookingProject.PaymentDetail"/>
<jsp:useBean id="dao" class="Training.BusBookingProject.PaymentDAO"/>
<jsp:setProperty property="*" name="pay"/>
<c:set var="res" value="${dao.addPayment(pay)}"/>
<c:if test="${res.equals('ok')}">
<h4 class="text-center text-danger mt-2"><c:out value="Successfull..."/></h4>
<c:out value="${ids}"/>
<c:redirect url="ApprvdTickets.jsp?userid=${param.userId}"/>
</c:if>
<c:if test="${res.equals('oknot')}">
<h4 class="text-center text-danger mt-2"><c:out value="Insufficient Amount..."/></h4>
<c:out value="${ids}"/>
</c:if>

</c:if>



