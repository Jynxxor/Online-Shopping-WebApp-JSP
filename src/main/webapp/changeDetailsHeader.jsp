<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
            <center><h2>Change Details<i class="fa fa-edit"></i></h2></center>
             <% String email = session.getAttribute("email").toString(); %>
            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
             <h2><a href="">Your Profile(<%=email %>) <i class='fas fa-user-alt'></i></a></h2>
            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
            <a href="addChangeAddress.jsp">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
            <a href="changeSecurityQuestion.jsp">Change Security Question <i class="fa fa-repeat"></i></a>
            <a href="changeMobileNumber.jsp">Change Mobile Number <i class='fas fa-phone'></i></a>
          </div>
           <br>
           <!--table-->
