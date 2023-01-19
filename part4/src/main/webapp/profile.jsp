<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String url = "jdbc:mysql://localhost:3306/yung";
		String usr = "root", password = "root";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql = "select * from stu_tbl where stu_id = 1";
		
		Connection con = DriverManager.getConnection(url, usr, password);
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		
	%>
	
	Student Number : <%= rs.getString(1) %><br>
	Name : <%= rs.getString(2) %><br>
	Grade : <%= rs.getString(3) %><br>
	
	
</body>
</html>