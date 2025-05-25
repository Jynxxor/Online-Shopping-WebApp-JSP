<%@ page import="com.DB, java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");

String address = "";
String city = "";
String state = "";
String country = "";

try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("INSERT INTO users values(?, ?, ?, ?, ?, ? ,? ,? , ?, ?)");
	pstm.setString(1, name);
	pstm.setString(2, email);
	pstm.setString(3, mobileNumber);
	pstm.setString(4, securityQuestion);
	pstm.setString(5, answer);
	pstm.setString(6, password);
	pstm.setString(7, address);
	pstm.setString(8, city);
	pstm.setString(9, state);
	pstm.setString(10, country);
	pstm.executeUpdate();
	
	response.sendRedirect("signup.jsp?msg=valid");
	
} catch(Exception e){
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>