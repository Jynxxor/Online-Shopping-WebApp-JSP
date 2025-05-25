<%@ page import="com.DB, java.sql.*"%>

<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT * FROM users WHERE email='"+email+"' AND mobileNumber='"+mobileNumber+"' AND securityQuestion='"+securityQuestion+"' AND answer='"+answer+"'");
	
	while(rs.next()){
		check = 1;
		stm.executeUpdate("UPDATE users SET password='"+newPassword+"' WHERE email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	} if(check == 0){
		response.sendRedirect("forgotPassword.jsp?msg=invalid");

	}
} catch(Exception e){
	System.out.println(e);
}
%>