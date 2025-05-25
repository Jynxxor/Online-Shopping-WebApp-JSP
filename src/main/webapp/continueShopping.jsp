<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String status = "processing";
try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("UPDATE cart SET status=? WHERE email=? AND status='bill';");
	pstm.setString(1, status);
	pstm.setString(2, email);
	pstm.executeUpdate();
	response.sendRedirect("home.jsp");
} catch(Exception e){System.out.println(e);}
%>