<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS 화이트리스트 관리자</title>
</head>
	<style>
		h2 {
			text-align: center;
		}
		table {
			width: 100%;
		}
		#outter {
			display: block;
			width: 60%;
			margin: auto;
		}
		a {
			text-decoration: none;
		}
	</style>
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="boardList?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}
	</script>
<body>
<h2>게시판</h2>

<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<table border="1">
		<tr>
			<td>UMS_VAL</td>
			<td>CUST_INFO</td>
			<td>CREATED_AT</td>		
		</tr>
		<c:forEach items="${viewAll}" var="w">
			<tr>
				<td>${w.UMS_VAL}</td>
				<td>${w.CUST_INFO}</td>
				<td>${w.CREATED_AT}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br> -->
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>