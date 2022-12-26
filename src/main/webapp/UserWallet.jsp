<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Bus Booking System</title>
</head>
<body>
<c:set var="testid" value="${userid}"/>
<h1 style="text-align: center; font-family:fantasy; ;color: gray; text-decoration:underline;">Add Amount</h1>
 <a href="ShowWallet.jsp" class="btn btn-success ml-5">BacK</a>
 <div class="container-fluid text-center"> 
 	<div class="row">
 		<div class="col-12">
 		<form>
          
        Wallet Amount :
          <input type="number" name="walletAmount" placeholder="Enter Amount" class="w-25" min="100" max="20000" /> <br/><br/> 
       User Id :
          <input type="text" name="userId" value="${param.id}"/> <br/><br/>
          <input type="submit" class="btn btn-primary" value="Add Amount"/> <br/><br/>
     
     </form>
     <c:if test="${param.walletAmount!=null}">
           <jsp:useBean id="bean" class="Training.BusBookingProject.UserDAO"/>
           <c:set var="amount" value="${param.walletAmount}"/>
           <c:set var="user" value="${param.userId}"/>
           ${bean.addWallet(user, amount)}
           <c:redirect url="ShowWallet.jsp?userid=${user}"/>
          </c:if>
  
 		</div>
	
 		
 	</div>
 </div>
 
 
</body>
</html>