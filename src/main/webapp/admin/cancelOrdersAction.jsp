<%@ page import="com.DB, java.sql.*"%>

<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String status = "Cancel";

try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	stm.executeUpdate("UPDATE cart SET status = '"+status+"' WHERE product_id = '"+id+"' AND email='"+email+"' AND address IS NOT NULL;");
	
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
} catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>
