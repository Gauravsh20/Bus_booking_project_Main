<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Insert title here</title>
</head>
<body>
<c:out value="${userid}"/>
<h1 style="text-align: center; font-family: cursive;color: gray; text-decoration:underline;">Wallet</h1>
 <div class="container-fluid text-center"> 
 	<div class="row">
 		<div class="col-12">
 		<form method="get" action="">

       <div class="heading">
          </div>
          
        Wallet Type :
          <select name="walletType">
               <option value="PHONE_PAY">PHONE_PAY</option>
               <option value="GOOGLE_PAY">GOOGLE_PAY</option>
               <option value="PAYTM">PAYTM</option>
               <option value="CASH">CASH</option>
          </select> <br/><br/>
        Wallet Amount :
          <input type="number" name="walletAmount"/> <br/><br/> 
       User Id :
          <input type="text" name="userId" value="${param.id}"/> <br/><br/>
          <input type="submit" value="Add Wallet"/> <br/><br/>
     
     </form>
     <c:if test="${param.walletAmount!=null}">
           <jsp:useBean id="bean" class="Training.BusBookingProject.UserDAO"/>
           <jsp:useBean id="beanWallet" class="Training.BusBookingProject.Wallet"/>
           <jsp:setProperty property="walletType" name="beanWallet" value="${param.walletType}"/>
           <jsp:setProperty property="walletAmount" name="beanWallet" value="${param.walletAmount}"/>
           <jsp:setProperty property="userId" name="beanWallet" value="${param.userId}"/>
           <c:out value="${bean.addWallet(beanWallet)}"/>
           <c:redirect url="ShowWallet.jsp?userid=${param.userId}"></c:redirect>
          </c:if>
  
 		</div>
	
 		
 	</div>
 </div>
 
 
</body>
</html>