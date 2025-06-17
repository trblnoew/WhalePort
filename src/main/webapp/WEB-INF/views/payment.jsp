<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name : <input type="text" id="name" value=""/><br/>
	price : <input type="text" id="price" value=""/><br/>
	<button id="submit">click</button>

</body> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>	
<script type="text/javascript">
$(function(){
	

	$('#submit').on('click',function(e){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var data = {
				name : $('#name').val(),
				totalPrice : $('#price').val()
		}
		$.ajax({
			type : 'post',
			url : '/order/pay/ready',
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			success : function(response){
				location.href = response.next_redirect_pc_url;
			}
			
		});
	});
});
</script>
</html>