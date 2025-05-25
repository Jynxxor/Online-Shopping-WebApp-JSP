<%@ page import="com.DB, java.sql.*"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("INSERT INTO product VALUES(?, ?, ?, ?, ?);");
	pstm.setString(1, id);
	pstm.setString(2, name);
	pstm.setString(3, category);
	pstm.setString(4, price);
	pstm.setString(5, active);
	
	pstm.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
} catch(Exception e){
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>