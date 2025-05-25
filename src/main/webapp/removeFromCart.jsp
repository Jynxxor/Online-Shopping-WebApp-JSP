<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");

try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	stm.executeUpdate("DELETE FROM cart WHERE  email='"+email+"' AND product_id='"+product_id+"' AND address is NULL;");
	response.sendRedirect("myCart.jsp?msg=removed");
} catch(Exception e){System.out.println(e);}
%>