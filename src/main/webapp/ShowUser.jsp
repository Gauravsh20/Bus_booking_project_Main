<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login Form</title>
<jsp:include page="AdminUser.jsp"/>
<style>
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
    <form  method="get" action="ShowUser.jsp">
      <jsp:useBean id="beanDao" class="Training.BusBookingProject.UserDAO"/>
        <div class="heading">
        <h3 class="text-center">Show All User's</h3> 
          </div>
      <a href="JSF_Files/AdminHomePage.xhtml" class="btn btn-success ml-5">BacK</a>
      <table border="3" align="center" class="table mt-5 table-hover text-center">
      <thead>
         <tr>
           <th>UserId</th>
           <th>Fullname</th>
           <th>contactno</th>
           <th>emailaddress</th>
           <th>UserName</th>
           <th>Password</th>
           <th>Update</th>
          
          </tr>
        </thead>  
          <c:forEach var="showUser" items="${beanDao.showUser(user)}" >
              <tr>
                 <td><c:out value="${showUser.userid}"/></td>
                 <td><c:out value="${showUser.fullname}"/></td>
                 <td><c:out value="${showUser.contactno}"/></td>
                 <td><c:out value="${showUser.emailaddress}"/></td>
                 <td><c:out value="${showUser.username}"/></td>
                 <td><c:out value="${showUser.password}"/></td>
                <td><a href="UpdateUser.jsp?id=${showUser.userid}"><button class="btn btn-success" type="button">Update</button></a></td>               
                
                 
              </tr>
           </c:forEach>
      </table>
    </form>
</body>
</html>