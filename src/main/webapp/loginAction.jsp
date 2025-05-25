<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream"%>
<%@ page import="com.DB, java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("admin@gmail.com".equals(email) && "admin".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}
else {
	int z = 0;
	try{
		Connection conn = DB.connect();
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery("SELECT * FROM users WHERE email = '"+email+"' AND password = '"+password+"';");
		while(rs.next()){
			z = 1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z == 0) response.sendRedirect("login.jsp?msg=notexist");
	} catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>