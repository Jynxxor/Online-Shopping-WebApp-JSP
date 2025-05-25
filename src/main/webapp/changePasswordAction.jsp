<%@ page import="com.DB, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if(!confirmPassword.equals(newPassword))
	response.sendRedirect("changePassword.jsp?msg=notMatch");
else{
	int check=0;
	try{
		Connection conn = DB.connect();
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery("SELECT * FROM users WHERE email='"+email+"' AND password='"+oldPassword+"';");
		if(rs.next()){
			check = 1;
			stm.executeUpdate("UPDATE users SET password='"+newPassword+"' WHERE email='"+email+"';");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check == 0){
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	} catch(Exception e){System.out.println(e);}
}
%>