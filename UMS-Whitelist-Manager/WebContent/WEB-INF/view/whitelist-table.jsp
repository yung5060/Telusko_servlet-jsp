<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS ȭ��Ʈ����Ʈ ������</title>
</head>
<style>
h2 {
	text-align: center;
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
<script type="text/javascript">
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "list?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
<script type="text/javascript">
	function titleLink() {
		window.location.href = 'list';
	}
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
<body>
	<h2 onclick="titleLink()">UMS ȭ��Ʈ����Ʈ ������</h2>

	<div id="outter">
		<button
			onclick="window.location.href = 'showFormForAddWhiteMember.html' ">�߰��ϱ�</button>
		<br>
		<form action="<c:url value="list" />">
			<input type="text" name="searchNumber" placeholder="��ȭ��ȣ�� �Է��ϼ���" />
			<button>�˻��ϱ�</button>
		</form>
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5��
					����</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10��
					����</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15��
					����</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20��
					����</option>
			</select>
		</div>
		<!-- �ɼǼ��� �� -->
		<table class="table">
			<tr>
				<td>ä���ڵ�</td>
				<td>��ȭ��ȣ</td>
				<td>������</td>
			</tr>
			<c:forEach items="${viewAll}" var="w" varStatus="status">
				<c:url var="deleteLink" value="/deleteProcess">
					<c:param name="custInfo" value="${w.CUST_INFO}"></c:param>
					<c:param name="searchNumber" value="${paging.searchNumber }"></c:param>
				</c:url>
				<tr>
					<td>${w.CHNL_DV_CD}</td>
					<!-- <td>${w.CUST_INFO}</td> -->
					<td>${fn:substring(w.CUST_INFO,0,3) }-${fn:substring(w.CUST_INFO,3,7) }-${fn:substring(w.CUST_INFO,7,11) }
					</td>
					<td>${w.PPRT_DTM}</td>
					<c:if test="${w.CUST_INFO != viewAll[status.index - 1].CUST_INFO}">
						<td><a href="${deleteLink}"
							onclick="if(!(confirm('Are you sure you want to delete the record?'))) return false;">Delete</a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<!-- <input type="button" value="�۾���" style="float: right;" onclick="location.href='/write'"><br> -->

		<div style="display: block; text-align: center;">
			<c:if test="${empty paging.searchNumber }">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</c:if>
			<c:if test="${not empty paging.searchNumber}">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchNumber=${paging.searchNumber}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchNumber=${paging.searchNumber}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchNumber=${paging.searchNumber}">&gt;</a>
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>