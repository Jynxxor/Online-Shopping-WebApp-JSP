<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobileNumber = request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = "";
transactionId = request.getParameter("transactionId");
String status = "bill";

try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("UPDATE users SET address=?, city=?, state=?, country=?, mobileNumber=? WHERE email=?");
	pstm.setString(1, address);
	pstm.setString(2, city);
	pstm.setString(3, state);
	pstm.setString(4, country);
	pstm.setString(5, mobileNumber);
	pstm.setString(6, email);
	pstm.executeUpdate();
	
	PreparedStatement pstm1 = conn.prepareStatement("UPDATE cart SET address=?, city=?, state=?, country=?, mobileNumber=?, orderDate=now(), deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY), paymentMethod=?, transactionId=?, status=? WHERE email=? AND address is NULL");
	pstm1.setString(1, address);
	pstm1.setString(2, city);
	pstm1.setString(3, state);
	pstm1.setString(4, country);
	pstm1.setString(5, mobileNumber);
	pstm1.setString(6, paymentMethod);
	pstm1.setString(7, transactionId);
	pstm1.setString(8, status);
	pstm1.setString(9, email);
	pstm1.executeUpdate();
	
	response.sendRedirect("bill.jsp");
} catch(Exception e){
	System.out.println(e);
}
%>