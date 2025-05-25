<%@ page import="com.DB, java.sql.*"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection conn = DB.connect();
	PreparedStatement pstm = conn.prepareStatement("UPDATE product set name=?, category=?, price=?, active=? WHERE id=?;");
	pstm.setString(1, name);
	pstm.setString(2, category);
	pstm.setString(3, price);
	pstm.setString(4, active);
	pstm.setString(5, id);
	pstm.executeUpdate();
	
	if(active.equals("no")){
		pstm = conn.prepareStatement("DELETE FROM cart WHERE product_id=? AND address is NULL");
		pstm.setString(1, id);
		pstm.executeUpdate();
	} response.sendRedirect("allProductEditProduct.jsp?msg=done");
} catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>