<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<body>
<form action="" class="text-center">
				<div class="col-30">
					<label for="text">User Name :</label>
				</div>
				<div class="col-80">
					<input type="text" name="username" size="30"/><br/><br/>
				</div>
				<div class="col-30">
					<label for="text">ForgetPassword :</label>
				</div>
				<div class="col-80">
					<input type="number" name="newpass" size="30"/><br/><br/>
				</div>
		<input type="submit" value="ForgetPassword"/> <br/><br/>
	</form>
		<c:if test="${param.username!= null}">
		<c:set var="username" value="${param.username}"/>
		<c:set var="newpss" value="${param.newpass}"/>
		<jsp:useBean id="beandao" class="Training.BusBookingProject.AdminDAO"/>
		<c:out value="${beandao.ForgetPwd(username,newpss)}"/>


       </c:if>
      

    </body>
</html>
