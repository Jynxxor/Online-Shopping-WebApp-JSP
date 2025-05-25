<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");

int price = 0;
//int total = 0;
int quantity = 0;
int final_total = 0;
try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT * FROM cart WHERE email='"+email+"' AND product_id='"+id+"' AND address is NULL;");
	if(rs.next()){
		price = rs.getInt(4);
		quantity = rs.getInt(3);
	}
	if(quantity == 1 && incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
	} else {
		if(incdec.equals("dec")){
			quantity -= 1;
		} else {
        quantity += 1;
		}
		
		int total = quantity * price;
		stm.executeUpdate("UPDATE cart SET total='"+total+"', quantity='"+quantity+"' WHERE email='"+email+"' AND product_id='"+id+"' AND address is NULL;");
		
		response.sendRedirect("myCart.jsp?msg="+(incdec.equals("dec") ? "dec" : "inc"));
	}
} catch(Exception e){System.out.println(e);}
%>