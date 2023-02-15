<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
#modal {
	display:none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
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
<script type="text/javascript">
	document.getElementById("modal_opne_btn").onclick = function() {
		document.getElementById("modal").style.display = "block";
	}

	document.getElementById("modal_close_btn").onclick = function() {
		document.getElementById("modal").style.display = "none";
	}
</script>
<body>
	<h2 onclick="titleLink()">UMS 화이트리스트 관리자</h2>

	<div id="outter">
		<!-- <button onclick="window.location.href = 'showFormForAddWhiteMember.html' " >추가하기</button> -->
		<div id="root">
			<button type="button" id="modal_opne_btn">추가하기</button>
		</div>
		<div id="modal">
			<div class="modal_content">
				<h2>UMS 화이트리스트 추가하기</h2>
				<p>추가하기 내용 들어갈 것</p>
				<button type="button" id="modal_close_btn">닫기</button>
			</div>
			<div class="modal_layer"></div>
		</div>
		<br>
		<form action="<c:url value="search" />">
			<input type="text" name="searchNumber" placeholder="전화번호를 입력하세요" />
			<button>검색하기</button>
		</form>
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
		<!-- 옵션선택 끝 -->
		<table border="1">
			<tr>
				<td>UMS_VAL</td>
				<td>CUST_INFO</td>
				<td>CREATED_AT</td>
			</tr>
			<c:forEach items="${viewAll}" var="w">
				<tr>
					<td>${w.UMS_VAL}</td>
					<!-- <td>${w.CUST_INFO}</td> -->
					<td>${fn:substring(w.CUST_INFO,0,3) }-${fn:substring(w.CUST_INFO,3,7) }-${fn:substring(w.CUST_INFO,7,11) }
					</td>
					<td>${w.CREATED_AT}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br> -->

		<div style="display: block; text-align: center;">
			<c:catch var="exception">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="search?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchNumber=${paging.searchNumber}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="search?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchNumber=${paging.searchNumber}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="search?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchNumber=${paging.searchNumber}">&gt;</a>
				</c:if>
			</c:catch>
			<c:if test="${not empty exception}">
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
		</div>
	</div>
</body>
</html>