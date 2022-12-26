<%@page import="Training.BusBookingProject.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<title>Bus Booking System</title>

<style>
h3{
font-family: fantasy;
font-size: 5ex;
color:gray;
}

</style>
</head>
<body>
<h3 class="text-center">Wallet</h3>
 <a href="JSF_Files/UserHome.xhtml" class="btn btn-success ml-5">BacK</a>
<center>
<c:set var="userId" value="#{param.userid}" />
<jsp:useBean id="beanwalt" class="Training.BusBookingProject.UserDAO"/>

	<h2> Total : <c:out value="${beanwalt.wallettll(userId)}"/></h2><br/><br/>
         
 	<%-- <h2> 	Total phonepe : <c:out value="${beanwalt.Wallet_type(userid,'PHONE_PAY')}"/></h2><br/><br/>
 	<h2> 	Total GOOGLE_PAY : <c:out value="${beanwalt.Wallet_type(userid,'GOOGLE_PAY')}"/></h2><br/><br/> --%>
 		
 		
 		<a href="UserWallet.jsp?id=${userId}"><button class="btn btn-primary" type="button">Add</button></a>
</center>
</body>
</html>