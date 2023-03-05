<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS-Whitelist-Manager</title>
</head>
<body>
	<script>
		alert(`${msg}`);
		location.href='<c:out value="${url}" />';
	</script>
</body>
</html>