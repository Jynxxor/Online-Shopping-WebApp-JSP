<%@ page import="com.DB, java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){ %>
<h3 class="alert">Product Added Successfully!</h3>
<% } if("wrong".equals(msg)){ %>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>
<%
int id = 1;
try{
	Connection conn = DB.connect();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT max(id) FROM product;");
	while(rs.next()){
		id = rs.getInt(1);
		id = id + 1;
	}
} catch(Exception e){
	
}
%>
<form action="addNewProductAction.jsp" method="post">

<h3 style="color: yellow;">Product ID: <%=id%></h3>
<input type="hidden" name="id" value="<%=id%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" reequired>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" reequired>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" reequired>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
   <option value="yes">Yes</option>
   <option value="no">No</option>
   </select>
<hr>
</div>
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>

</form>
</body>
<br><br><br>
</body>
</html>