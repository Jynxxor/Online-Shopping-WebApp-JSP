<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String subject = request.getParameter("subject");
String body = request.getParameter("body");

try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("INSERT INTO message(email, subject, body) values (?, ?, ?);");
	pstm.setString(1, email);
	pstm.setString(2, subject);
	pstm.setString(3, body);
    pstm.executeUpdate();
    response.sendRedirect("messageUs.jsp?msg=valid");
} catch (Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>