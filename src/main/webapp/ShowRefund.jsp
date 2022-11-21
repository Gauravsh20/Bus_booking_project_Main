<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<body>
    <form method="get" action="ShowRefund.jsp">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.BusDAO"/>
      <table border="3" align="center">
        <tr>
          <th>RefundId</th>
          <th>PaymentId</th>
          <th>UserId</th>
          <th>WalletId</th>
          <th>Amount</th>
          <th>RefundDate</th>
          <th>RefundStatus</th>
         </tr>
         
         <c:forEach var="showRefund" items="${beanDao.showRefund(refund)}">
           <tr>
             <td><c:out value="${showRefund.refundId}"/></td>
             <td><c:out value="${showRefund.paymentId}"/></td>
             <td><c:out value="${showRefund.userId}"/></td>
             <td><c:out value="${showRefund.walletId}"/></td>
             <td><c:out value="${showRefund.amount}"/></td>
             <td><c:out value="${showRefund.refundDate}"/></td>
             <td><c:out value="${showRefund.refundStatus}"/></td>
            <tr> 
         
         </c:forEach>  
      </table>
    </form>
</body>
</html>