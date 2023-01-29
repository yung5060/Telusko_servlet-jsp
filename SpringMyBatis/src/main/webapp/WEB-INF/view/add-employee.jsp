<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Add Employee</h1>
	<s:form modelAttribute="employee" action="saveProcess">

		<input type="hidden" value="${employee.hobbies}" id="hiddenTxt" />
		<s:hidden path="id" />
        
        Employee Name : <s:input path="fullname" />
		<br>
        
        Employee Email : <s:input path="email" />
		<br>
        
        Gender : <s:radiobutton path="gender" value="Male" />Male<s:radiobutton
			path="gender" value="Female" />Female<br>
        
        Interests : <br>
		<s:checkbox path="hobbies" value="Sports" />Sports<br>
		<s:checkbox path="hobbies" value="Books" />Books<br>
		<s:checkbox path="hobbies" value="Swimming" />Swimming<br>
		<s:checkbox path="hobbies" value="Cycling" />Cycling<br>
        
        Country : <s:select path="country">
			<s:option value="Korea">Korea</s:option>
			<s:option value="US">US</s:option>
			<s:option value="Japan">Japan</s:option>
			<s:option value="France">France</s:option>
			<s:option value="Australia">Austraila</s:option>
			<s:option value="Nigeria">Nigeria</s:option>
		</s:select>
		<br>
        
        Address : <s:textarea path="address" />
		<br>

		<input type="submit" value="Save Employee" />
		<button onclick="window.location.href = '/' ">Employee List</button>
	</s:form>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	
	   $(document).ready(function(){
		   
		   var hobbies = $("#hiddenTxt").val().split(",");
		   var $checkboxes = $("input[type=checkbox]");
		   $checkboxes.each(function(idx, element){
			      
			   if(hobbies.indexOf(element.value) != -1) {
				   element.setAttribute("checked", "checked");
			   } else {
				   element.removeAttribute("checked");
			   }
		   });
		   
	   });
	
	</script>
	
	
	
</body>
</html>