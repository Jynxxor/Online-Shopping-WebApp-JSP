<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");

int check = 0;
try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT * FROM users WHERE email='"+email+"' AND password='"+password+"';");
	if(rs.next()){
		check = 1;
		stm.executeUpdate("UPDATE users SET mobileNumber='"+mobileNumber+"' WHERE email='"+email+"';");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check == 0) response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
} catch(Exception e){System.out.println(e);}
%>