<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="UserHeader.jsp"/>
<head>

<title>All Bus's</title>
<link rel="stylesheet" href="Css/bootstrap.min.css" />
  <script type="text/javascript" src="js/paginator.js"></script>
  <script type="text/javascript" src="js/table.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
</head>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
		<script
		  src="http://code.jquery.com/jquery-3.3.1.min.js"
		  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		  crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>
		<script type="text/javascript">
function myFunction() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}

function myFunction1() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput1");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}

function myFunctionfinal() {
	  // Declare variables
	  var input, filter, table, tr, td, i,td2,filter2;
	  input = document.getElementById("myInput");
	  
	  var dates=document.getElementById("datefilterfrom");
    var date=moment(dates.value).format('YYYY-MM-DD');
    filter2 = date.toUpperCase();
    
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display ="";
	        
	        td2 = tr[i].getElementsByTagName("td")[2];
          if (td2) {
              if (td2.innerHTML.toUpperCase().indexOf(filter2) > -1) {
                  tr[i].style.display = "";
              } else {
                  tr[i].style.display = "none";
  
              }
          }
			
			
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	    
	  }
	  
	}

</script>
<style>

label{
display: none;
}
input[type=search]{
display: none;
}
#datefilterfrom {
    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
     width:20%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}
#myInput1 {
    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
     width:20%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}
#myInput {
    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
     width:20%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
    border-collapse: collapse; /* Collapse borders */
    width: 100%; /* Full-width */
    border: 1px solid #ddd; /* Add a grey border */
    font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
    text-align: left; /* Left-align text */
    padding: 12px; /* Add padding */
}

#myTable tr {
    /* Add a bottom border to all table rows */
    border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
    /* Add a grey background color to the table header and on hover */
    background-color: #f1f1f1;
}

#username{
    margin-left:80ex;
}
</style>


<body>

<h1 style="text-align: center; font-family: cursive;color: gray; text-decoration:underline;">All Bus's</h1>
<div class="text-center">
<a href="JSF_Files/UserHome.xhtml"><button type="button" class="btn btn-primary m-3">Back</button></a> 
<input type="text" id="myInput1" onkeyup="myFunction1()" placeholder="Search for Source">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Destination">

<input type="date" id="datefilterfrom" data-date-split-input="true"> 
<button type="button" class="btn btn-success m-3" onclick="myFunctionfinal()">Search</button> 
</div>	
        <jsp:useBean id="beanDao" class="Training.BusBookingProject.NewFeature"/>
          <div class="heading">
          </div>
         <table border="3" align="center" id="myTable">
         <thead>
            <tr>
              <th>Pick Up Place</th>
              <th>Destination Place</th>
              <th>Journey Start Date</th>
              <th>Journey Start Time</th>
              <th>Journey End Date</th>
              <th>Journey End Time</th>
               <th>Starting Address</th>
                <th>Destination address</th>
              <th>Fare Amount</th>
              <th>Remark</th>
              <th>Booked</th>
            </tr>
            </thead>
            <tbody>
           <c:forEach var="showBus" items="${beanDao.AvailableBus()}" >
              <tr>
                 <td><c:out value="${showBus.startingpoint}"/></td>
                 <td><c:out value="${showBus.destinationpoint}"/></td>
                 <td><c:out value="${showBus.scheduledate}"/></td>
                 <td><c:out value="${showBus.departuretime}"/></td>
                 <td><c:out value="${showBus.estimatearrivaldate}"/></td>
                 <td><c:out value="${showBus.estimatearrivaltime}"/></td>
                 <td><c:out value="${showBus.addressstart}"/></td>
                 <td><c:out value="${showBus.addressend}"/></td>
                 <td><c:out value="${showBus.fareamount}"/></td>
                 <td><c:out value="${showBus.remark}"/></td>
                 <td><a href="AddTickets.jsp?scheduleid=${showBus.scheduleid}&userid=${param.userid}"><button type="submit" class="btn btn-danger">Book Now</button></a></td>
              </tr>
           </c:forEach> 
           </tbody>  
         </table>
   <script>
    $(document).ready(function () {
        $("#myTable").DataTable();
    });
</script>
</body>
</html>