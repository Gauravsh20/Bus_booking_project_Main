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

    
    <div class="heading">
    <h3 class="text-center">Show All Booking</h3> 
  <a href="JSF_Files/AdminHomePage.xhtml" class="btn btn-success ml-5">BacK</a>
    </div>
    <jsp:useBean id="beanDao" class="Training.BusBookingProject.TravelscheduleDAO"/>
    <table border="3" align="center" class="table-bordered table-hover mt-5 w-100 h-50">
    <thead class="text-center">
    <tr>
              <th> Booking Id </th>
              <th> Schedule Id </th>
              <th> Date Of Booking </th>
              <th> User Id </th>
              <th> Passenger Name </th>
              <th> Passenger Age </th>
              <th> Passenger Gender </th>
              <th> Seat No </th>
              <th> Fare Amount </th>
              <th> Total Amount </th>
           
   </tr> 
    </thead>            
     <tbody class="text-center">        
     <c:forEach var="showBooking" items="${beanDao.showBooking()}" >
              <tr>
               <td><c:out value="${showBooking.bookingId}"/></td>
                  <td><c:out value="${showBooking.scheduleId}"/></td>
                  <td><c:out value="${showBooking.bKdate}"/></td>
                  <td><c:out value="${showBooking.userId}"/></td>
                  <td><c:out value="${showBooking.pname}"/></td>
                  <td><c:out value="${showBooking.page}"/></td>
                  <td><c:out value="${showBooking.pgender}"/></td>
                  <td><c:out value="${showBooking.seatNo}"/></td>
                  <td><c:out value="${showBooking.fareAmount}"/></td>
                  <td><c:out value="${showBooking.totalAmount}"/></td>
                  
              </tr>
             </c:forEach>
             </tbody> 
    </table>
</body>
</html>