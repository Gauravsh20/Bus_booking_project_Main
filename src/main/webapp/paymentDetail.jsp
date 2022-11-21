
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<c:out value="${param.bookingId}"/>
<c:set var="userid" value="${param.userid}"/>
<c:if test="${param.bookingId!=null}">
	<jsp:useBean id="booked" class="Training.BusBookingProject.UserDAO"/>	
	<c:forEach var="showBook" items="${booked.SearchBookId(param.bookingId)}">
		<c:set var="tamt" value="${showBook.totalAmount}"/>
	</c:forEach>
</c:if>


<form action="" method="get">
	user ID:
	<input type="text" name="userId" value="${param.userid}"/><br/><br/>
	Wallet ID:
	<input type="text" name="walletId"/><br/><br/>
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
	<input type="submit" value="pay"/><br/><br/>
</form>
<c:if test="${param.walletId!=null }">
<jsp:useBean id="pay" class="Training.BusBookingProject.PaymentDetail"/>
<jsp:useBean id="dao" class="Training.BusBookingProject.PaymentDAO"/>
<jsp:setProperty property="userId" name="pay"/>
<jsp:setProperty property="walletId" name="pay"/>
<jsp:setProperty property="bookingId" name="pay"/>
<jsp:setProperty property="amount" name="pay"/>
<jsp:setProperty property="paytype" name="pay"/>
<c:out value="${dao.addPayment(pay)}"/>
<c:out value="${param.userid}"/>
<%-- <c:redirect url="ShowTickets.jsp?id=${userid}"/> --%>
</c:if>



