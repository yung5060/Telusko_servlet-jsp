<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>List Employees</h1>
	<button onclick="window.location.href = 'showFormForAddEmployee.html' ">Add
		Employee</button>
	<div>
		<table border="1">
			<tr>
				<th>Full Name</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Hobbies</th>
				<th>Country</th>
				<th>Address</th>
				<th>Actions</th>
			</tr>
			<c:forEach items="${listemployees}" var="e">

				<c:url var="deleteLink" value="/deleteEmployee">

					<c:param name="employeeId" value="${e.id}" />

				</c:url>
				
				<c:url var="updateLink" value="/updateEmployee">

                    <c:param name="employeeId" value="${e.id}" />

                </c:url>

				<tr>
					<td>${e.fullname}</td>
					<td>${e.email}</td>
					<td>${e.gender}</td>
					<td>${e.hobbies}</td>
					<td>${e.country}</td>
					<td>${e.address}</td>
					<td>
					<a href="${updateLink}">Update</a>  |
					<a href="${deleteLink}"
						onclick="if(!(confirm('Are you sure you want to delete the record?'))) return false;">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>