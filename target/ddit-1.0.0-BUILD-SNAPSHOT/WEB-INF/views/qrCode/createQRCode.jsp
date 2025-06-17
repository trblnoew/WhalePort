<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>qrCode 생성</h1>
	<form>
		사번 : <input type="text" id="empId"><br>
<!-- 		비밀번호 : <input type="password" id="memPw"><br> -->
<!-- 		이름 : <input type="text" id="memName"><br> -->
		<input type="button" id="btn" value="create">
	</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var btn = $("#btn");
	
	btn.on("click", function() {
		data = {
			empId : $("#empId").val(),
// 			memPw : $("#memPw").val(),
// 			memName : $("#memName").val(),
		}
		$.ajax({
			url : "/management/qrCode/createQRCode",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				location.href="/management/qrCode/employeeQRCode";
			}
		});
	});
});
</script>
</html>