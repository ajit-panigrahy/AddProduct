<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Management</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

form {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 300px;
	text-align: center; /* Center the form content */
}

h2 {
	text-align: center;
	color: #333;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	display: block; /* Make the button a block-level element */
	margin: 0 auto; /* Center the button */
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #4caf50;
	color: white;
}
</style>
</head>
<body>

	<form action="AddProductServlet" method="post">
		<h2>Add Product</h2>
		<%
		if ("true".equals(request.getParameter("success"))) {
		%>
		<p style="color: green;">Product added successfully!</p>
		<%
		} else if ("false".equals(request.getParameter("success"))) {
		%>
		<p style="color: red;">
			Error adding product:
			<%=request.getParameter("error")%></p>
		<%
		}
		%>
		<label for="productName">Product Name:</label> <input type="text"
			name="productName" required><br> <label for="price">Price:</label>
		<input type="text" name="price" required><br> <input
			type="submit" value="Add Product">
	</form>


</body>
</html>
