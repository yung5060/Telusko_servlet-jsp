<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS 화이트리스트 관리자</title>
</head>
<body>
	<h1>UMS 화이트리스트 추가</h1>
	<s:form modelAttribute="whitelistDto" action="saveProcess">
		
		<input type="hidden" value="${whitelistDto.channelCodes}" id="hiddenTxt" />
		
		전화번호 : <s:input path="phoneNumber"/><br>
		채널코드 : <br>
		<s:checkbox path="channelCodes" value="K"/>K<br>
		<s:checkbox path="channelCodes" value="L"/>L<br>
		<s:checkbox path="channelCodes" value="M"/>M<br>
		<s:checkbox path="channelCodes" value="S"/>S<br>
		
		<input type="submit" value="저장하기" />
		
	</s:form>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	
	</script>
	
</body>
</html>