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


#outter {
	display: block;
	width: 70%;
	margin: auto;
	background: #E6E6E6;
	padding: 20px 40px;
}

a {
	text-decoration: none;
}
.btn1 {
	padding: 5px 10px;
	background: #2E64FE;
	border: 0;
	outline: none;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	color: #FFFFFF;
	border-radius: 30px;
}
</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
<body>
	<h2 onclick="titleLink()">UMS 화이트리스트 관리자</h2>

	<div id="outter">
		<button class="btn1" onclick="window.location.href = 'showFormForAddWhiteMember.html' ">추가하기</button>
		<button type="submit" class="btn1">submit</button>
		<br><br>
		<form action="<c:url value="list" />">
			<!-- <input class="form-control" id="ex3" type="text" name="searchNumber" placeholder="전화번호를 입력하세요" />
			<button class="btn1">검색하기</button>  -->
			<div class="input-group mb-3">
				<input type="text" name="searchNumber" class="form-control" placeholder="전화번호를 입력하세요" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button">검색하기</button>
				</div>
			</div>
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
		<table class="table" >
			<tr>
				<td>채널코드</td>
				<td>전화번호</td>
				<td>생성일</td>
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
		<!-- <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br> -->

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
</html>