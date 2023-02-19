<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS 화이트리스트 관리자</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
	
	<style>
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
</head>
<body>
	<h1>UMS 화이트리스트 추가</h1>
	
	<s:form modelAttribute="addByTextDto" action="saveByText">
		
		<s:textarea class="form-control col-sm-5" path="phoneNumbers" rows="10" cols="30" />
		<br>
		<input class="btn1" type="submit" value="저장하기(복붙)" />
	</s:form>
	
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	
	   $(document).ready(function(){
		   
		   var channelCodes = $("#hiddenTxt").val().split(",");
		   var $checkboxes = $("input[type=checkbox]");
		   $checkboxes.each(function(idx, element){
			      
			   if(channelCodes.indexOf(element.value) != -1) {
				   element.setAttribute("checked", "checked");
			   } else {
				   element.removeAttribute("checked");
			   }
		   });
		   
	   });
	
	</script>  -->
	
</body>
</html>