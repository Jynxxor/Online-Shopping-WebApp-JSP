<%@ page import="com.DB, java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;

int z = 0;
try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT * FROM product WHERE id='"+product_id+"';");
	while(rs.next()){
		product_price = rs.getInt(4);
		product_total = product_price;
	}
	ResultSet rs1 = stm.executeQuery("SELECT * FROM cart WHERE product_id='"+product_id+"' AND email='"+email+"' AND address is NULL;");
	while(rs1.next()){
		cart_total = rs1.getInt(5);
		cart_total += product_total;
		quantity = rs1.getInt(3);
		quantity += 1;
		z = 1;
	} if(z == 1){
		stm.executeUpdate("UPDATE cart SET total='"+cart_total+"', quantity='"+quantity+"' WHERE product_id='"+product_id+"' AND email='"+email+"' AND address is NULL;");
		response.sendRedirect("home.jsp?msg=exist");
	} if(z == 0){
		PreparedStatement pstm = conn.prepareStatement("INSERT INTO cart(email, product_id, quantity, price, total) VALUES (?,?,?,?,?);");
		pstm.setString(1, email);
		pstm.setString(2, product_id);
		pstm.setInt(3, quantity);
		pstm.setInt(4, product_price);
		pstm.setInt(5, product_total);
		pstm.executeUpdate();
		
		response.sendRedirect("home.jsp?msg=added");
	}
} catch(Exception e){
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>