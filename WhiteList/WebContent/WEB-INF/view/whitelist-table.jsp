<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS 화이트리스트 관리자</title>
</head>
<body>
	<h1>UMS WhiteList Manager</h1>
	<div>
		<table border="1">
			<tr>
				<th>UMS_VAL</th>
				<th>CUST_INFO</th>
				<th>CREATED_AT</th>
			</tr>
			<c:forEach items="${whitelist}" var="e">



				<tr>
					<td>${e.UMS_VAL}</td>
					<td>${e.CUST_INFO}</td>
					<td>${e.CREATED_AT}</td>
					<td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>