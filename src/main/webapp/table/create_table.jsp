<%@ page import="com.DB, java.sql.*"%>

<%
try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	String q1 = "CREATE TABLE users(name varchar(100), email varchar(100) primary key, mobileNumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(100), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
	
	String q2 = "CREATE TABLE product(id int, name varchar(500), category varchar(200), price int, active varchar(10));";
	
	String q3 = "CREATE TABLE cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigInt, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10));";
	
	String q4 = "CREATE TABLE message(id int AUTO_INCREMENT, email varchar(100), subject varchar(200), body varchar(1000), PRIMARY KEY(id))";
	
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	
	// stm.execute(q1);
	// stm.execute(q2);
	// stm.execute(q3);
	stm.execute(q4);
	
	System.out.print("Table created");
	conn.close();
} catch(Exception e){
	System.out.print(e);
}
%>