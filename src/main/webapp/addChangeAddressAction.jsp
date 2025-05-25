<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");

try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("UPDATE users SET address=?, city=?, state=?, country=? WHERE email=?");
	pstm.setString(1, address);
	pstm.setString(2, city);
	pstm.setString(3, state);
	pstm.setString(4, country);
	pstm.setString(5, email);
	pstm.executeUpdate();
	
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
} catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>