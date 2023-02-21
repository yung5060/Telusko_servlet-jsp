<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
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
	background: #EAECEE;
	padding: 20px 40px;
	margin-top: 50px;
}

a {
	text-decoration: none;
}

table, tr, td {
	border: none;
	border-collapse: collapse;
	text-align: center;
	transition: 0.2s;
}

tr.colored:nth-child(even) {
	background: #D5D8DC;
	color: #000;
}

tr.colored:nth-child(odd) {
	background: #BFC9CA;
	color: #000;
}

tr.colored:hover {
	background: #F2F3F4;
}

.btn1 {
	padding: 5px 10px;
	background: #154360;
	border: 0;
	outline: none;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	color: #FFFFFF;
	border-radius: 30px;
	transition: 0.3s;
}

.btn1:hover {
	background: #5499C7;
}

.btn1:focus {
	background: #5499C7;
}

.btn-open-popup {
	padding: 5px 10px;
	background: #154360;
	border: 0;
	outline: none;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	color: #FFFFFF;
	border-radius: 30px;
	transition: 0.3s;
}

.btn-open-popup:hover {
	background: #5499C7;
}

.btn-open-popup:focus {
	background: #5499C7;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 400px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal2.show {
	display: block;
}

.modal2_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 400px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

textarea {
	width: 100%;
	resize: none;
}
</style>

<link rel="icon" type="image/png"
	href="<c:url value= '/img/kbank.png' />" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
<body>
	<h2 style="margin-top: 30px;" onclick="titleLink()">UMS 화이트리스트 관리자</h2>

	<div class="modal">
		<div class="modal_body">
			<s:form modelAttribute="addByTextDto" action="saveByText">
				<h4 style="margin-top: -25px;">UMS 화이트리스트 추가</h4>
				<s:textarea style="height: 286px; margin-top: 10px;"
					class="form-control" path="phoneNumbers"
					placeholder="010XXXX0000
010XXXX0000
0100000XXXX
.
.
." />
				<input class="btn1" style="margin-top: 13px;" type="submit"
					value="저장하기(복붙)" />
			</s:form>
		</div>
	</div>

	<div id="outter">
		<button class="btn-open-popup">추가하기(복붙)</button>
		<form action="<c:url value="list" />">
			<!-- <input class="form-control" id="ex3" type="text" name="searchNumber" placeholder="전화번호를 입력하세요" />
			<button class="btn1">검색하기</button>  -->
			<div class="input-group mb-3" style="margin-top: 10px;">
				<input type="text" name="searchNumber" class="form-control"
					placeholder="전화번호를 입력하세요" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button">검색하기</button>
				</div>
			</div>
		</form>

		<!-- 옵션선택 끝 -->
		<table class="table">
			<tr>
				<td>채널코드</td>
				<td>전화번호</td>
				<td>생성일</td>
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
			</tr>
			<c:forEach items="${viewAll}" var="w" varStatus="status">
				<c:url var="deleteLink" value="/deleteProcess">
					<c:param name="custInfo" value="${w.CUST_INFO}"></c:param>
					<c:param name="searchNumber" value="${paging.searchNumber }"></c:param>
				</c:url>
				<tr class="colored" onclick="rowClicked('${w.CUST_INFO}')">
					<td>${w.CHNL_DV_CD}</td>
					<!-- <td>${w.CUST_INFO}</td> -->
					<td>${fn:substring(w.CUST_INFO,0,3) }-${fn:substring(w.CUST_INFO,3,7) }-${fn:substring(w.CUST_INFO,7,11) }
					</td>
					<td>${w.PPRT_DTM}</td>
					<!-- <td><a href="${deleteLink}"
						onclick="if(!(confirm('Are you sure you want to delete the record?'))) return false;">Delete</a>
					</td> -->
					<div class="modal2" id="${w.CUST_INFO }" onclick="rowExit('${w.CUST_INFO}')">
						<div class="modal2_body">
							<h4>${fn:substring(w.CUST_INFO,0,3) }-${fn:substring(w.CUST_INFO,3,7) }-${fn:substring(w.CUST_INFO,7,11) }</h4>
						</div>
					</div>
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
<script type="text/javascript">
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');
      
      function rowClicked(x) {
  		const modal2 = document.getElementById(x);
  		modal2.classList.toggle('show');

        if (modal2.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
  	 }
      
      function rowExit(x) {
    	  const modal2 = document.getElementById(x);
    	  if (event.target === modal2) {
    		  modal2.classList.toggle('show');

              if (!modal2.classList.contains('show')) {
                body.style.overflow = 'auto';
              }
            }
    	 }

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
</script>
</html>