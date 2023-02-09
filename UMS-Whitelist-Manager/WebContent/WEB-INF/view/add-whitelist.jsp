<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UMS ȭ��Ʈ����Ʈ ������</title>
</head>
<body>
	<h1>UMS ȭ��Ʈ����Ʈ �߰�</h1>
	<s:form modelAttribute="whitelistDto" action="saveProcess">
		
		<input type="hidden" value="${whitelistDto.channelCodes}" id="hiddenTxt" />
		
		��ȭ��ȣ : <s:input path="phoneNumber"/><br>
		ä���ڵ� : <br>
		<s:checkbox path="channelCodes" value="K"/>K<br>
		<s:checkbox path="channelCodes" value="L"/>L<br>
		<s:checkbox path="channelCodes" value="M"/>M<br>
		<s:checkbox path="channelCodes" value="S"/>S<br>
		
		<input type="submit" value="�����ϱ�" />
		
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